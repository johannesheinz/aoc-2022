import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;


public class CathodeRayTubePart2 {

    private static String getFilname(String[] args) {
        return args.length > 0 ? args[0] : "input.txt";
    }

    private static List<String> readFile(final String filename) {
        System.out.println("-".repeat(42));
        System.out.println("Reading from '%s' ...\n".formatted(filename));

        try (Stream<String> stream = Files.lines(Paths.get(filename))) {
            return stream.collect(Collectors.toList());    

        } catch (IOException e) {
            System.err.println("[ERROR] Could not open file '%s' from %s".formatted(filename, e.getMessage()));
            return List.of();
        }
    }

    private static void addLineToLookup(final String line, final List<Integer> lookup) {
        final var lineElements = line.strip().split(" ");
        final var lastValue = lookup.get(lookup.size() - 1);
        switch (lineElements[0]) {
            case "noop":
                lookup.add(lastValue);
                break;

            case "addx":
                final var change = Integer.parseInt(lineElements[1]);
                lookup.add(lastValue);
                lookup.add(lastValue + change);
                break;

            default:
                System.err.println("[ERROR] Invalid line: '%s'".formatted(line));
                break;
        }
    }

    private static void printResult(final List<Integer> lookup) {
        System.out.println("-".repeat(42));

        for (int i = 0; (i + 40) <= lookup.size(); i += 40) {
            final var offset = i;
            final var crtRow = IntStream.range(offset, offset + 40)
                .mapToObj(cycle -> (
                    (cycle - offset) >= (lookup.get(cycle) - 1) &&
                    (cycle - offset) <= (lookup.get(cycle) + 1)) 
                        ? "#"
                        : "."
                )
                .collect(Collectors.joining());
            System.out.println(" " + crtRow);
        }

        System.out.println("-".repeat(42));
    }


    public static void main(String[] args) {
        final var filename = getFilname(args);
        final var lines = readFile(filename);

        final List<Integer> lookup = new ArrayList<>();
        lookup.add(1);
        lines.forEach(line -> addLineToLookup(line, lookup));

        printResult(lookup);
    }
}
