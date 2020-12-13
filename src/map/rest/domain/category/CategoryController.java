package map.rest.domain.category;

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

@Path("/category")
public class CategoryController {

    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)
    public List<String> getCategory() throws SQLException {
        ArrayList<String> categoryList = new ArrayList<>();

        try(Connection conn = DriverManager.getConnection(URL, ID , PW)) {
            String selectCategoryQuery = "select * from category";

            String category;
            try(Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(selectCategoryQuery);
                while (rs.next()) {
                    category = rs.getString("category");
                    categoryList.add(category);
                }


            } catch(Exception e) {

            }
        }

        return categoryList;
    }

}
