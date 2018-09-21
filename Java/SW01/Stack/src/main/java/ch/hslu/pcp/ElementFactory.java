package ch.hslu.pcp;

public class ElementFactory {

    public static Element create(int value) {
        return new MyElement(value);
    }

}
