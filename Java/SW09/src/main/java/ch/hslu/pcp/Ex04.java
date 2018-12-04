package ch.hslu.pcp;

import java.util.Arrays;
import java.util.List;

public class Ex04 {

    public static void main(String[] args) {
        List<String> strings = Arrays.asList("Java", "is", "cool");
        System.out.println(String.join(" ", strings));

        Ex04 ex04 = new Ex04();

        System.out.println(ex04.join(strings));
    }

    private String join(Iterable<String> strings) {
        StringBuilder stringBuilder = new StringBuilder(); // Zustand welcher verändert wird
        for (String string : strings) { // for-loop
            stringBuilder.append(string);
            stringBuilder.append(" ");
        }
        stringBuilder.deleteCharAt(stringBuilder.length() - 1);
        return stringBuilder.toString();
    }
}
