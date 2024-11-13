package dtcookie.server;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

import dtcookie.common.CommonUtils;

public class ServerApp implements com.sun.net.httpserver.HttpHandler {
    public static void main(String[] args) throws Exception {
        com.sun.net.httpserver.HttpServer server = com.sun.net.httpserver.HttpServer.create(new InetSocketAddress(8000), 0);
        server.createContext("/test", new ServerApp());
        server.setExecutor(null);
        server.start();
    }

    @Override
    public void handle(com.sun.net.httpserver.HttpExchange t) throws IOException {
        String response = CommonUtils.getMessage();
        t.sendResponseHeaders(200, response.length());
        OutputStream os = t.getResponseBody();
        os.write(response.getBytes());
        os.close();
    }

}
