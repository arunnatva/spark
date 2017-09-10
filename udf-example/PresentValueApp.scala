// This piece of code is run on the spark-shell, not with the spark-submit.
import org.apache.spark.sql.functions._
import org.apache.poi.ss.formula.functions.FinanceLib
val mydf1 = sqlContext.read.json("/user/aknatva/sample.json")
mydf1.show()
//Below statement creates a UDF that accepts three variables and calculates present value (its a financial function)
val getPvUdf = udf((wacc:Double,lor:Double,revenue:Double) => FinanceLib.pv(wacc,lor,revenue,0,false))
// A new dataframe is created by adding a derived column to existing dataframe
val mydf2 = mydf1.withColumn("pv_val",getPvUdf($"wacc",$"lor",$"revenue")
mydf2.show()
