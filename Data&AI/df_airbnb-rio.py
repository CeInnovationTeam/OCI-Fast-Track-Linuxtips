from pyspark.sql import SparkSession


def main():
    # Create a Spark session
    spark = SparkSession \
        .builder \
        .appName("Python Spark SQL basic example") \
        .getOrCreate()
    
    # Load a csv file from dataflow public storage
    bucket_name = 'raw-data'
    file_name = 'airbnb-listings-rio.csv'
    namespace = 'xxxxxxxxxxxx' #TODO Change for your tenancy namespace value

    df = spark \
        .read \
        .format("csv") \
        .option("header", "true") \
        .option("multiLine", "true") \
        .load(f"oci://{bucket_name}@{namespace}/{file_name}")
    
    # Create a temp view and do some SQL operations
    df.createOrReplaceTempView("rio")
    query_result_df = spark.sql("""
        SELECT 
            room_type,  
            price,  
            CONCAT(latitude,',', longitude) AS lat_long
        FROM rio 
    """)
    
    # Convert the filtered Spark DataFrame into JSON format
    # Note: we are writing to the spark stdout log so that we can retrieve the log later at the end of the notebook.
    print('\n'.join(query_result_df.toJSON().collect()))
    

if __name__ == '__main__':
    main()
