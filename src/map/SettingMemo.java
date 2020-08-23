package map;

import map.dto.MemoDTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class SettingMemo {
    private static ArrayList<MemoDTO> memoList = new ArrayList<>();
    private static final String URL = "jdbc:mysql://localhost/map?useSSL=false";
    private static final String ID = "root";
    private static final String PW = "mysql";

    // public List<MemoDTO> getMemoList(HttpServletRequest request, HttpServletResponse response) {
    public ArrayList<MemoDTO> getMemoList() throws ClassNotFoundException {
        // request.setCharacterEncoding("utf-8");
        Class.forName("com.mysql.jdbc.Driver");

        String selectWriterQuery = "select * from writer";

        try (Connection conn = DriverManager.getConnection(URL, ID, PW)) {
            System.out.println("연결성공!");

            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(selectWriterQuery);
                StringBuilder sb = new StringBuilder();

                while (rs.next()) {
                    MemoDTO memoDTO = new MemoDTO();

                    memoDTO.setId(rs.getInt("id"));
                    memoDTO.setEmail(rs.getString("email"));
                    memoDTO.setPassword(rs.getString("password"));
                    memoDTO.setNickname(rs.getString("nickname"));
                    memoDTO.setSex(rs.getString("sex"));
                    memoDTO.setBirthday(rs.getString("birthday"));

                    memoList.add(memoDTO);
                    sb.append(memoDTO.toString()+"\n");
                }
                System.out.println(sb.toString());

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("exception : " + e);
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            System.out.println("exception : " + e);
        }

        return memoList;

    }

}