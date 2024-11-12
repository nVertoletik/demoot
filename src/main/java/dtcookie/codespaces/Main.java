package dtcookie.codespaces;

public class Main {

    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
        synchronized (System.out) {
            System.out.wait();
        }
    }
}