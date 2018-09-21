package ch.hslu.pcp;

public class MyStack implements Stack {

    private Element top;

    public void push(Element e) {
        if (this.top != null) {
            Element element = this.top;
            e.setNext(element);
            this.top = e;
        } else {
            this.top = e;
        }
    }

    public Element top() {
        return this.top; // TODO: Exception
    }

    public Element pop() {
        if (this.isEmpty()) {
            return null; // TODO: Exception
        }
        Element element = this.top;
        this.top = this.top.getNext();

        return element;
    }

    public void print() {
        if (this.isEmpty()) {
            System.out.println("print - Stack is empty");
        } else {
            System.out.print("print - Stack contains: ");

            Element element = this.top;
            if (element != null) {
                do {
                    System.out.print(element.getValue() + ", ");
                    element = element.getNext();
                }
                while (element != null);
            }
            System.out.println("top Element = " + this.top.getValue());
        }
    }

    public boolean isEmpty() {
        return this.top == null;
    }

    public int size() {
        int size = 0;
        Element element = this.top;
        if (element != null) {
            do {
                size++;
                element = element.getNext();
            }
            while (element != null);
        }

        return size;
    }
}
