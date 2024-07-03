import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class DemoJdbcPreparedStatementWithReturning{

    public static void printResultSetStringString(String stmtText, Connection connection) {
        int count = 0;
        System.out.println("\n/* Executing query: "+stmtText+"; */");
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(stmtText);
            System.out.println("\tRow#, "+resultSet.getMetaData().getColumnName(1)+", "+resultSet.getMetaData().getColumnName(2));
            while (resultSet.next()) {
                System.out.println("\t"+(++count) + ") " + resultSet.getString(1)+", "+resultSet.getString(2));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
    }
    public static void main(String[] args){
        Connection connection = null;
        try{
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:4000/test?useServerPrepStmts=true&cachePrepStmts=true&rewriteBatchedStatements=true", "root", ""
            );
            System.out.println("Connection established.");
            // Do something in the connection
            String offAutoCommit = "SET @@autocommit = 0";
            String sqlDropTable = "DROP TABLE IF EXISTS test.t1";
            String sqlCreateTable = "CREATE TABLE test.t1 (id bigint primary key AUTO_RANDOM, name char(30))";
            PreparedStatement[] pss = new PreparedStatement[]{
                connection.prepareStatement(offAutoCommit),
                connection.prepareStatement(sqlDropTable),
                connection.prepareStatement(sqlCreateTable)
            };
            for (PreparedStatement ps:pss){
                ps.executeUpdate();
                ps.close();
            }
            // Reuse PS
            connection.setAutoCommit(true);
            PreparedStatement inserting_ps = connection.prepareStatement("INSERT INTO test.t1 (name) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
            System.out.println(">>> Reuse PS Begin populating.");
            long s1 = System.currentTimeMillis();
            ResultSet generatedKeys = null;
            for (int i=0;i<20000;i++){
                inserting_ps.setString(1, Integer.toString(i));
                inserting_ps.executeUpdate();
                generatedKeys = inserting_ps.getGeneratedKeys();
                while (generatedKeys.next()){
                    System.out.println("Generated AUTO_RANDOM Key: "+generatedKeys.getLong(1));
                }
            }
            System.out.println(">>> End populating, elapsed: "+Long.toString(System.currentTimeMillis()-s1)+"(ms).");
        }
        catch(SQLException e){
            System.out.println("Error: "+e);
            // Try something
            if(connection != null){
                try{
                    connection.rollback();
                    System.out.println("Transaction rolled back.");
                }
                catch(SQLException e2){
                    System.out.println("Error: "+e2);
                }
            }
        }
        finally{
            if(connection != null){
                try{
                    // Check the battle field
                    printResultSetStringString("select * from test.t1", connection);
                    // Turn on autocommit
                    connection.setAutoCommit(true);
                    System.out.println("Turn on autocommit.");
                    connection.close();
                    System.out.println("Connection closed.");
                }
                catch(Exception e){
                    System.out.println("Error disconnecting: "+e.toString());
                }
            }
            else{
                System.out.println("Already disconnected.");
            }
        }
    }
}