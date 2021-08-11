

package manajemen.karyawan;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;



public class Koneksi {
    public static Connection con;

    public static Connection getCon() {
        try {
          con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/manajemen_karyawan", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e,"Pesan Kesalahan",JOptionPane.ERROR_MESSAGE);
        }
        return con;
    }
    
}
