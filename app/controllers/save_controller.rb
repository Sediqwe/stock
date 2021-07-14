class SaveController < ApplicationController
  require 'zip'
  def index

  end
  def controllka(file)
      if File.exists?(file)
        File.delete(file)
        
      else
      end
  end
  def cont_dir(file)
    if Dir.exists?(file)
      
      else
        Dir.mkdir(file)  
    end
end

  def save
    controllka("tmp/gta.zip")
    cont_dir("tmp/gta/")
    file_nevek = Translate.select(:file).distinct
    file_nevek.each do |file|
      #Minden fájlnéven menjünk végig!
      controllka("tmp/gta/" + file.file)
      data_all = Translate.where(trans_type: false, file: file.file).order(id: "ASC")
      dollar = ""
          data_all.each do |data|
            if "Ver".in? data.trans_id
              dollar << data.trans_id + "\n"
            elsif "}".in? data.trans_id
              dollar << data.trans_id + "\n"
            elsif "{".in? data.trans_id
              dollar << data.trans_id + "\n"
            else
              dollar << "\t" + data.trans_id + " = " + data.original+"\n"
            end
          end #Data_each end
      File.write("tmp/gta/" + file.file, dollar , mode: "a")
      
    end #file_nevek.each end
    directory_to_zip = "tmp/gta/"
    output_file = "tmp/gta.zip"
    zf = ZipFileGenerator.new(directory_to_zip, output_file)
    zf.write()
    send_file "tmp/gta.zip", :disposition => 'attachment'
  end





  # This is a simple example which uses rubyzip to
  # recursively generate a zip file from the contents of
  # a specified directory. The directory itself is not
  # included in the archive, rather just its contents.
  #
  # Usage:
  #   directory_to_zip = "/tmp/input"
  #   output_file = "/tmp/out.zip"
  #   zf = ZipFileGenerator.new(directory_to_zip, output_file)
  #   zf.write()
  class ZipFileGenerator
    # Initialize with the directory to zip and the location of the output archive.
    def initialize(input_dir, output_file)
      @input_dir = input_dir
      @output_file = output_file
    end
  
    # Zip the input directory.
    def write
      entries = Dir.entries(@input_dir) - %w[. ..]
  
      ::Zip::File.open(@output_file, create: true) do |zipfile|
        write_entries entries, '', zipfile
      end
    end
  
    private
  
    # A helper method to make the recursion work.
    def write_entries(entries, path, zipfile)
      entries.each do |e|
        zipfile_path = path == '' ? e : File.join(path, e)
        disk_file_path = File.join(@input_dir, zipfile_path)
  
        if File.directory? disk_file_path
          recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
        else
          put_into_archive(disk_file_path, zipfile, zipfile_path)
        end
      end
    end
  
    def recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
      zipfile.mkdir zipfile_path
      subdir = Dir.entries(disk_file_path) - %w[. ..]
      write_entries subdir, zipfile_path, zipfile
    end
  
    def put_into_archive(disk_file_path, zipfile, zipfile_path)
      zipfile.add(zipfile_path, disk_file_path)
    end
  end




end
