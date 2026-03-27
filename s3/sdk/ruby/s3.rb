
require "aws-sdk-s3"   # AWS SDK for interacting with S3
require "pry"          # Debugging tool (like console.log)
require "securerandom" # For generating random unique strings

# Read environment variable for bucket name
bucket_name = ENV["BUCKET_NAME"]

# AWS region where the bucket will be created
region = "eu-central-1"

# Create an S3 client object (used to interact with AWS S3)
client = Aws::S3::Client.new

# Create a new S3 bucket
resp = client.create_bucket(
  {
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region   
    }
  }
)

# Generate a random number between 1 and 6
number_of_files = 1 + rand(6)

# Print how many files will be created
puts "number_of_files: #{number_of_files}"  

# Loop to create and upload files
number_of_files.times do |i|

  puts "i: #{i}"

  # Create a filename 
  filename = "file_#{i}.txt"

  # Temporary file path
  output_path = "/tmp/#{filename}"

  # Create a file and write a random UUID into it
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # Open file in binary mode and upload to S3
  File.open(output_path, "rb") do |f|
    client.put_object(   
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end
end