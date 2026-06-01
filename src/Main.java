import org.antlr.v4.runtime.*;

public class Main {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            return;
        }

        System.out.println("============================================");
        System.out.println(" = = = = = = = Compilador = = = = = = = ");
        System.out.println("============================================");
        System.out.println("Arquivo: " + args[0]);
        System.out.println();

        // Análise Léxica
        CharStream input = CharStreams.fromFileName(args[0]);
        Lexico lexer = new Lexico(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        try {
            tokens.fill();
        } catch (RuntimeException e) {
            System.out.println("[ERRO LÉXICO] " + e.getMessage());
            System.out.println("Compilação teve erro.");
            return;
        }

        System.out.println("--- Tokens Identificados ---");
        int count = 0;
        for (Token token : tokens.getTokens()) {
            if (token.getType() == Token.EOF) continue;
            System.out.println(tokenParaString(token));
            count++;
        }
        System.out.println("Total: " + count + " tokens encontrados.");
        System.out.println("[OK] Análise léxica concluída com sucesso.");
        System.out.println();

        // Análise Sintática
        System.out.println("--- Análise Sintática ---");
        tokens.seek(0);
        Sintatico parser = new Sintatico(tokens);

        parser.removeErrorListeners();
        parser.addErrorListener(new BaseErrorListener() {
            @Override
            public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol,
                                    int line, int charPositionInLine, String msg,
                                    RecognitionException e) {
                System.out.println("[ERRO SINTÁTICO] Linha " + line +
                        ", coluna " + charPositionInLine + ": " + msg);
                System.out.println("Compilação teve erro.");
                System.exit(1);
            }
        });

        parser.prog();
        System.out.println("[OK] Análise sintática concluída com sucesso.");
        System.out.println();
        System.out.println("--------------------------------------------");
        System.out.println("  Compilação concluída sem erros!");
        System.out.println("--------------------------------------------");
    }

    private static String tokenParaString(Token token) {
        String tipo = Lexico.VOCABULARY.getSymbolicName(token.getType());
        String atributo = getAtributo(token);
        return String.format("  %-15s | Tipo: %-12s | Atributo: %s",
                token.getText(), tipo, atributo);
    }

    private static String getAtributo(Token token) {
        switch (token.getType()) {
            case Lexico.OPAD:
                return token.getText().equals("+") ? "MAIS" : "MENOS";
            case Lexico.OPMULT:
                return token.getText().equals("*") ? "VEZES" : "DIV";
            case Lexico.OPLOG:
                return token.getText().toUpperCase();
            case Lexico.OPNEG:
                return "NEG";
            case Lexico.OPREL:
                switch (token.getText()) {
                    case "<":  return "MENOR";
                    case "<=": return "MENIG";
                    case ">":  return "MAIOR";
                    case ">=": return "MAIG";
                    case "==": return "IGUAL";
                    case "<>": return "DIFER";
                    default:   return token.getText();
                }
            default:
                return token.getText();
        }
    }
}
