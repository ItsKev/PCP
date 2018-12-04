package ch.hslu.pcp;


import java.util.concurrent.CompletableFuture;

public class Ex03 {

    public static void main(String[] args) {
        CompletableFuture<Long> longLastingTaskFuture = CompletableFuture.supplyAsync(() -> WaitPrintAndReturnX(3000L));
        CompletableFuture<Long> evenLongerLastingTaskFuture = CompletableFuture.supplyAsync(() -> WaitPrintAndReturnX(6000L));

        CompletableFuture<String> lastTaskFuture = longLastingTaskFuture.thenCombineAsync(evenLongerLastingTaskFuture, (s, t) -> {
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "was waiting for " + (s + t + 2000) + "ms";
        });

        lastTaskFuture.thenAccept(System.out::print);
        System.out.println("-> Now waiting for things to happen!");
        for (int i = 0; i < 20; i++) {
            System.out.print(".");
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("\n-> Done.");
    }

    private static long WaitPrintAndReturnX(long value) {
        try {
            Thread.sleep(value);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.print(value);
        return value;
    }


}
