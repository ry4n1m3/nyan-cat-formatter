# -*- coding: utf-8 -*-

module SmoothJazzy
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
    [[  "----------", 
        "_,------,   ",
        "_|  /\\_/\\ ",
        "~|_( #{face})  ",
        " \"\"  \"\" ", 
        "----------"
      ],
      [ "----------",
        "_,------,   ",
        "_|   /\\_/\\",
        "^|__( #{face}) ",
        "  \"\"  \"\" ",
        "----------"
      ]]
  end  
end