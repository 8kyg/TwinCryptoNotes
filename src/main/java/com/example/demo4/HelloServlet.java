package com.example.demo4;

import java.io.*;
import java.nio.charset.Charset;
import java.sql.*;
import java.util.Base64;
import java.util.Enumeration;
import java.util.Random;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import org.json.simple.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;

@WebServlet(name = "TwinCryptoNote", value = "/TwinCryptoNote")

public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        //message = "Hello!!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.getWriter().print(zapiska_read_write(request.getParameter("read"),request.getParameter("data"), request.getParameter("id")));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.getWriter().print(zapiska_read_write(request.getParameter("read"),request.getParameter("data"), request.getParameter("id")));
    }

    public String zapiska_read_write(String readCrypto, String  data2crypt, String id2read )
        {

            JSONObject json= new JSONObject();

            if(readCrypto == null && data2crypt == null ){

                json.put("write","true");
                json.put("data","null");
                json.put("error","true");

                return (json.toString());
            } else if (readCrypto != null && id2read == null ) {


                json.put("read","true");
                json.put("id","null");
                json.put("error","true");

                return (json.toString());

            }

            String new_random_id = RandomStringUtils.randomAlphanumeric(20);
            String new_random_key = RandomStringUtils.randomAlphanumeric(30);



        String query_insert = "INSERT INTO zapiski  VALUES ( null,?,?,?);";
        String query_select = "SELECT * from zapiski WHERE id_zapiski = ?";

//        PrintWriter out = response.getWriter();

        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/javadb",
                    "javadb", "java"
            );

            Statement stm = connection.createStatement();

            if(readCrypto == null) {
                Connection c = stm.getConnection();
                PreparedStatement p = c.prepareStatement(query_insert);
                p.setString(1, new_random_key);
                p.setString(2, AES256.encrypt(data2crypt,new_random_key));
                p.setString(3, new_random_id);
                int result_insert = p.executeUpdate();

                if (result_insert == 0) {
                    json.put("newid","creatingError");
                } else {
                    // Here need generated encryptionKey and return
                    json.put("newid",new_random_id);
                }
            } else { //Read and encrytion message

                Connection c = stm.getConnection();
                PreparedStatement p = c.prepareStatement(query_select);
                p.setString(1, id2read);
                ResultSet rs = p.executeQuery();

                if (rs.next()) {
                    json.put("decrypted_data",AES256.decrypt(rs.getString(3),rs.getString(2)));
                } else {
                    json.put("id",id2read);
                    json.put("decrypted_data","MessageIdWasNotFoundOrCanBeDeleted");
                    json.put("MessageIdWasNotFoundOrCanBeDeleted",stm.getResultSet());
                }

            }
            stm.close();
            connection.close();
        } catch (SQLException e) {
            return ("Mysql Error: " + e.getMessage());
//            throw new RuntimeException(e);
        }

        return (json.toString());
    }


    public void destroy() {

    }


}