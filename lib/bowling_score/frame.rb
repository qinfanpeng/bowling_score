# -*- coding: utf-8 -*-

# == 保龄球比赛中的回合
class Frame
  attr_reader :score
  def initialize
    @score = 0
  end
  def add(pins)
    @score += pins
  end

end
