bool setup_sd() 
{
  
  uint8_t timeout = 0;
  while (!SD.begin(10)&& timeout < 200)
  {
    if(PRINT && timeout == 0)
      Serial.println("Failed to detect and initialize SD Card!");
    timeout ++;
  }
  
  if(timeout > 199)
    return false;

  
  datalog = SD.open(filename, FILE_WRITE);
  if (datalog) {
    if(datalog.available())
      print_error("File not empty");
    datalog.println(filename);
  }
  else
    print_error("Can't open file");
    
  datalog.close();

}


void save_sd_data() 
{
  if(PRINT)
    Serial.print("Saving SD data");
}
