# -*- coding: utf-8 -*-
require 'nyan_cat_formatter'

class SmoothJazzNyanCatFormatter < NyanCatFormatter
  # Creates a rainbow trail
  #
  # @return [String] the sprintf format of the Nyan cat
  def nyan_trail
    marks = @example_results.map{ |mark| highlight(mark) }
    marks.shift(current_width - terminal_width) if current_width >= terminal_width
    nyan_cat_lines = nyan_cat.split("\n").each_with_index.map do |line, index|
      format("%s#{line}", marks.join)
    end.join("\n")
  end

  # Ascii version of Nyan cat. Two cats in the array allow Nyan to animate running.
  #
  # @param o [String] Nyan's eye
  # @return [Array] Nyan cats
  def ascii_cat(o = '^')
    if o=='^'
      face = '⌐■.■'
    else
      face = "#{o} .#{o}"
    end
    [[ "_,------,   ",
        "_|  /\\_/\\ ",
        "~|_( #{face})  ",
        " \"\"  \"\" "
      ],
      [ "_,------,   ",
        "_|   /\\_/\\",
        "^|__( #{face}) ",
        "  \"\"  \"\"    "
      ]]
  end

  # Colorizes the string with raindow colors of the rainbow
  #
  # @params string [String]
  # @return [String]
  def rainbowify(string)
    c = colors[@color_index % colors.size]
    @color_index += 1
    "#{ESC}38;5;#{c}m#{string}#{NND}"
  end

  # Calculates the colors of the rainbow
  #
  # @return [Array]
  def colors
    @colors ||= (0...(6 * 7)).map do |n|
      pi_3 = Math::PI / 3
      n *= 1.0 / 6
      r  = (3 * Math.sin(n           ) + 3).to_i
      g  = (3 * Math.sin(n + 2 * pi_3) + 3).to_i
      b  = (3 * Math.sin(n + 4 * pi_3) + 3).to_i
      36 * r + 6 * g + b + 16
    end
  end

  # Determines how to color the example.  If pass, it is rainbowified, otherwise
  # we assign red if failed or yellow if an error occurred.
  #
  # @return [String]
  def highlight(mark = PASS)
    case mark
    when PASS; rainbowify PASS_ARY[@color_index%2]
    when FAIL; "\e[31m#{mark}\e[0m"
    when ERROR; "\e[33m#{mark}\e[0m"
    when PENDING; "\e[33m#{mark}\e[0m"
    else mark
    end
  end
end

