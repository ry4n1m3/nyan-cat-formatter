class PaddedStringIO
  def initialize(terminal_size)
    @output = $stdout
    @terminal_size = terminal_size
  end
  
  def puts(output_strings = '')
    unless output_strings.is_a?(Array)
      output_strings = [output_strings]
    end
    output_strings.each do |output_string| 
      @output.puts output_string.ljust(@terminal_size)
#      super 'foo'
    end
  end
  
  def method_missing(*args)
    @output.send(*args)
  end
end