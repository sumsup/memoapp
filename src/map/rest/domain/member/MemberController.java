package map.rest.domain.member;

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

@Path("/member")
public class MemberController {

    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)
    public List<MemberDTO> members() throws ClassNotFoundException, SQLException {
        List<MemberDTO> memberList = new ArrayList<>();
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(URL, ID, PW)) {

            String selectWriterQuery = "select * from writer";

            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(selectWriterQuery);
                while (rs.next()) {
                    MemberDTO memberDTO = new MemberDTO();
                    memberDTO.setId(rs.getInt("id"));
                    memberDTO.setEmail(rs.getString("email"));
                    memberDTO.setPassword(rs.getString("password"));
                    memberDTO.setNickname(rs.getString("nickname"));
                    memberDTO.setSex(rs.getString("sex"));
                    memberDTO.setBirthDay(rs.getString("birthday"));

                    System.out.println(memberDTO.toString());
                    memberList.add(memberDTO);
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

        return memberList;
    }

}

