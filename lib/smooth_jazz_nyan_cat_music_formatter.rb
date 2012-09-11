# -*- coding: utf-8 -*-
require 'nyan_cat_music_formatter'

SmoothJazzNyanCatMusicFormatter = Class.new(NyanCatMusicFormatter) do
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
  
  def nyan_mp3
    File.expand_path('../../data/smooth-jazz-nyan-cat.mp3', __FILE__)
  end
end
=begin
◒
◡
=end