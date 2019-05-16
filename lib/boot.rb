class Boot
  def initialize
    puts "Starting system...\n".dark_purple
  end

  def update_gems
    puts "Update gems...\n".dark_purple
    zipbruteforce
    puts "\nFinished gem update\n".dark_purple
  end

  def zipbruteforce
    puts 'ZipBruteForce'.blue
    puts `cd vendor/zipbruteforce/ && bundle install`.green
  end
end