namespace :populate do
	desc "populate db with Universities"
  task get_universities: :environment do
  	schoolfile = 'public/test.csv'
  	schoolfile = File.open(schoolfile, 'r')
  	schoolfile.each.with_index(1) do |line,index|
  		# split the line into an array
  		# access each part of the array and create a new school object with each line
  		@line = line.gsub('"','').split(",")
  		@school = School.new
  		@school.name = @line[1].chomp.to_s
  		@school.location = @line[3].chomp.to_s
  		@school.state = @line[4].chomp.to_s
  		@school.save
  	end
  end
end
