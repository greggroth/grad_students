desc  "Import data to the database from an xml file"
namespace :import do
  task :students, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    puts doc["root"]["dataroot"]["Students"].length
  end

  task :test, :message do |t, args|
    puts "Arugments: #{args}"
  end
end