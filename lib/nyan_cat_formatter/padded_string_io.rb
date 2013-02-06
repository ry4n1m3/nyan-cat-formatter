class PaddedStringIO
  def initialize
    @output = $stdout
  end

  def puts(output_strings = '')
    unless output_strings.is_a?(Array)
      output_strings = [output_strings]
    end
    output_strings.each do |output_string|
      @output.puts output_string + "\e[0K"
    end
  end

  def method_missing(*args)
    @output.send(*args)
  end
end