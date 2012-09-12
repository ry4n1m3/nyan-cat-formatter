# -*- coding: utf-8 -*-
require 'smooth_jazzy'
require 'nyan_cat_music_formatter'

class SmoothJazzNyanCatMusicFormatter < NyanCatMusicFormatter
  include SmoothJazzy
  
  def nyan_mp3
    File.expand_path('../../data/smooth-jazz-nyan-cat.mp3', __FILE__)
  end
end