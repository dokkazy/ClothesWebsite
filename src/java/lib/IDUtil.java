/*
 * 
 */
package lib;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author HP
 */
public class IDUtil {

    public static String generateProductId() {
        String pId = null;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        pId = sdf.format(new Date());
        pId = "P" + pId;
        return pId;
    }
    
    public static String generateCusId() {
        String cusId = null;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        cusId = sdf.format(new Date());
        cusId = "CUS" + cusId;
        return cusId;
    }

    public static String generateCategoryId() {
        String cId = null;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        cId = sdf.format(new Date());
        cId = "C" + cId;

        return cId;
    }
}
