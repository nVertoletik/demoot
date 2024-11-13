package dtcookie.client;

import dtcookie.common.CommonUtils;
import java.io.IOException;
import java.net.Socket;

public class ClientApp {
    public static void main(String[] args) {
        try (Socket socket = new Socket("server", 8080)) {
            System.out.println(CommonUtils.getMessage() + " - Connected to Server");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
