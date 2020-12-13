package map.rest.domain.memo;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static map.rest.common.Constants.ID;
import static map.rest.common.Constants.PW;
import static map.rest.common.Constants.URL;

@Path("/memo")
public class MemoController {

    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)
    public List<MemoDTO> getMemoList() throws ClassNotFoundException {
        List<MemoDTO> memoList = new ArrayList<>();
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(URL, ID, PW)) {

            String selectWriterQuery = "select * from memo";

            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(selectWriterQuery);
                while (rs.next()) {
                    MemoDTO memoDTO = new MemoDTO();
                    memoDTO.setId(rs.getLong("id"));
                    memoDTO.setWriterId(rs.getInt("writer_id"));
                    memoDTO.setMemo(rs.getString("memo"));
                    memoDTO.setCategory(rs.getString("category"));
                    memoDTO.setCreatedAt(rs.getDate("created_at"));
                    memoDTO.setUpdatedAt(rs.getDate("updated_at"));

                    System.out.println(memoDTO.toString());
                    memoList.add(memoDTO);
                }

            } catch (Exception e) {
                //TODO: handle exception
            }
        }
        // catch(ClassNotFoundException e) {
        //     System.out.println("connect fail!");
        //     System.out.println("exception : " + e);
        // }
        catch (SQLException e) {
            System.out.println("exception : " + e);
        }

        return memoList;
    }
}
