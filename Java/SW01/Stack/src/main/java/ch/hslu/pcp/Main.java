package ch.hslu.pcp;

public class Main {

    public static void main(String[] args) {
        Stack myStack = StackFactory.create();
        System.out.println("myStack.size() = " + myStack.size());
        System.out.println("myStack.isEmpty() = " + myStack.isEmpty());
        myStack.print();
        myStack.top();
        myStack.push(ElementFactory.create(42));
        myStack.push(ElementFactory.create(77));
        myStack.push(ElementFactory.create(1));
        System.out.println("myStack.size() = " + myStack.size());
        System.out.println("myStack.isEmpty() = " + myStack.isEmpty());
        myStack.print();
        myStack.push(ElementFactory.create(33));
        myStack.pop();
        myStack.push(ElementFactory.create(33));
        myStack.print();
        Element e = myStack.top();
        System.out.println("top Element is " + e.getValue());
    }

}
