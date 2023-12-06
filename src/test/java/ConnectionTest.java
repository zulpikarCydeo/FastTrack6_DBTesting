import java.sql.*;

public class ConnectionTest {

    static String dbrul = "jdbc:oracle:thin:@54.91.142.69:1521:XE";
    static String username = "hr";
    static String password = "hr";

    public static void main(String[] args) throws SQLException {


        Connection connection = DriverManager.getConnection(dbrul, username, password);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet resultSet = statement.executeQuery("select * from EMPLOYEES");

        resultSet.next();
        System.out.println(resultSet.getString(1));
        System.out.println(resultSet.getString(2));

        resultSet.next();
        System.out.println(resultSet.getString("First_name"));
        System.out.println(resultSet.getInt(1));

        resultSet.previous();
        System.out.println(resultSet.getString(2));

//        resultSet.absolute(10);
//        resultSet.beforeFirst();
//        resultSet.afterLast();
//        resultSet.first();


        ResultSetMetaData rsmd = resultSet.getMetaData();
        System.out.println(rsmd.getColumnName(3));
        System.out.println(rsmd.getColumnCount());


        DatabaseMetaData dbMetadata = connection.getMetaData();
        System.out.println(dbMetadata.getDriverName());
        System.out.println(dbMetadata.getDriverVersion());


    }
}
