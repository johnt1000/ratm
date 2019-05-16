class Boot
  def initialize
    puts "Starting system...\n".dark_purple
  end

  def update_gems
    puts "Download and update plugins...\n".dark_purple
    download_zipbruteforce
    puts "\nFinished\n".dark_purple
  end

  private
    def download_zipbruteforce
      puts "> ZipBruteForce \n".blue
      puts "Download...\n".yellow
      puts `cd ./vendor/ && git clone https://github.com/johnt1000/zipbruteforce.git`.green
      bundle_zipbruteforce
    end
    def bundle_zipbruteforce
      puts 'Update gems...'.yellow
      puts `cd vendor/zipbruteforce/ && bundle install`.green
    end
end