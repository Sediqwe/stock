class SaveController < ApplicationController
  def index

  end
  def controllka(file)
      if File.exists?(file)
        File.delete(file)
      else
      end
   
  
  end


  def save
    file_nevek = Translate.select(:file).distinct
    file_nevek.each do |file|
      #Minden fájlnéven menjünk végig!
      controllka("tmp/testing/" + file.file)
      data_all = Translate.where(trans_type: false, file: file.file).order(id: "ASC")
      dollar = ""
          data_all.each do |data|
            if ["{", "}", "Version"].include? data.trans_id
              dollar << data.trans_id + "\n"
            else
              dollar << data.trans_id + "=" + data.original+"\n"
            end
          end #Data_each end
      File.write("tmp/testing/" + file.file, dollar , mode: "a")
      send_file "tmp/testing/" + file.file , :disposition => 'attachment'
    end #file_nevek.each end
  end
end
