module AssuredRunner
  require 'rest-assured'
  require 'yaml'

  class Runner 

    def run
      start_server
      load_doubles_from_config
      wait_for_interrupt
    end

    def start_server
      RestAssured::Server.start(:port =>7899)
    end

    def load_doubles_from_config
      config = read_config
      load_data_into_doubles(config['paths'])
    end

    private
    def read_config( config_location = "config/rest-assured.yml" )
      YAML::load( File.open(config_location) )
    end

    private
    def load_data_into_doubles( paths )
      paths.each do | path_uri, file_location |
        double_response = read_from_file(file_location)
        RestAssured::Double.create(:fullpath => path_uri, :content => double_response)
      end
    end

    private 
    def read_from_file( location)
      file = File.open(location, "rb")
      contents = file.read
    end

    private
    def wait_for_interrupt
      switch = true

      Signal.trap("SIGINT") do
        switch = false
      end

      lastTime = Time.now

      while switch do
        sleep 1
      end
    end

  end

  def self.run
    s = Runner.new
    s.run
  end

end


