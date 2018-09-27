package ch.hslu.pcp;

public class MyElement implements Element {

    private final int value;
    private Element next;

    public MyElement(int value) {
        this.value = value;
    }

    @Override
    public int getValue() {
        return this.value;
    }

    @Override
    public Element getNext() {
        return this.next;
    }

    @Override
    public void setNext(Element next) {
        this.next = next;
    }
}
