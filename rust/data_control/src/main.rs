
use polars::prelude::*;  
use sqlx::mysql::MySqlPoolOptions; 
use sqlx::query;  

fn read_csv(file){
    // Read a CSV file into a DataFrame

    if let Ok(df) = CsvReader::from_path(file)  
        .unwrap()  
        .finish()  
    {  
        return df;
    } else {  
        println!("Failed to read the CSV file");  
    }  
}

fn get_data(){
    path = "example.csv";
    data = read_csv(path);

    query = data[data['a'] == 0 ];
    println!(query);
}


#[tokio::main]  
async fn connectDB() -> Result<(), sqlx::Error> {  
    // Create a connection pool  
    let pool = MySqlPoolOptions::new()  
        .max_connections(5)  
        .connect("mysql://username:password@localhost/database")  
        .await?;  
  
    Ok(pool)  
}  

#[tokio::main]  
async fn queryDB() -> Result<(), sqlx::Error> {  
    let pool = connectDB().unwrap()
  
    // Execute a simple query  
    let rows = query!("SELECT id, name FROM users")  
        .fetch_all(&pool)  
        .await?;  
  
    for row in rows {  
        let id: i32 = row.id;  
        let name: String = row.name;  
        println!("ID: {}, Name: {}", id, name);  
    }  
  
    Ok(())  
}  

pub fn main() {  
  

}  