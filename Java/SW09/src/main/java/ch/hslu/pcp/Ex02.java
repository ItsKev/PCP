package ch.hslu.pcp;

import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Ex02 {

    public static void main(String[] args) {

    }

    private void generateSortAndPrintRandomInts(int numberOfVals, int maxValueExc) {
        IntStream intStream = new Random().ints(0, maxValueExc);
        intStream.limit(numberOfVals).boxed().collect(Collectors.toList()).sort();
    }

}
