import java.util.*;

public class Cart {
    private List<Book> books;

    public Cart() {
        books = new ArrayList<>();
    }

    public void addBook(String title, String price) {
        books.add(new Book(title, price));
    }

    public List<Book> getBooks() {
        return books;
    }
}
