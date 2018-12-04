package ch.hslu.pcp;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class Ex01 {

    public static void main(String[] args) {
        String[] namesArray = {"Joe", "Tara", "Sue", "Tim"};

        Ex01 ex01 = new Ex01();

        Optional<String> reducedString = ex01.reduceAndPrintStrings(namesArray);
        ex01.printOptional(reducedString, "[Default]");


        String[] otherArray = {"Joe", "Sue"};
        Optional<String> otherReducedString = ex01.reduceAndPrintStrings(otherArray);
        ex01.printOptional(otherReducedString, "[Default]");
    }

    private Optional<String> reduceAndPrintStrings(String[] namesArray) {
        List<String> names = Arrays.asList(namesArray);
        Optional<String> x = names.stream()
                .filter(s -> s.startsWith("T"))
                .map(String::toUpperCase)
                .reduce((s, t) -> s + " " + t);
        x.ifPresent(s -> {
            System.out.println("[Debugoutput] x = " + s);
        });
        return x;
    }

    private void printOptional(Optional<String> optionalString, String defaultValue) {
        System.out.println("value = " + optionalString.orElse(defaultValue));
    }

}
