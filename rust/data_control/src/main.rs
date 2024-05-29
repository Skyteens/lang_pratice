
use polars::prelude::*;  

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


pub fn main() {  
  

}  