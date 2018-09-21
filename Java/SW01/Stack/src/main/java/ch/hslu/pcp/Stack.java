package ch.hslu.pcp;

public interface Stack {

    void push(Element e);

    Element top();

    Element pop();

    void print();

    boolean isEmpty();

    int size();

}
