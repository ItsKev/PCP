package ch.hslu.pcp;

import sun.applet.Main;

import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Ex02 {

    public static void main(String[] args) {
        Ex02 ex02 = new Ex02();
        ex02.generateSortAndPrintRandomInts(7, 100);

    }

    private void generateSortAndPrintRandomInts(int numberOfVals, int maxValueExc) {
        IntStream intStream = new Random().ints(0, maxValueExc);
        List<Integer> sortedList = intStream
                .limit(numberOfVals)
                .boxed()
                .sorted(Comparator.reverseOrder())
                .collect(Collectors.toList());
        StringJoiner stringJoiner = new StringJoiner(" > ", "reverse ordered list = { ", " }");
        sortedList.forEach(value -> stringJoiner.add(Integer.toString(value)));
        System.out.println(stringJoiner);
    }

}
