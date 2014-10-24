# -*- coding: utf-8 -*-

# == 计分类
class Scorer

  def initialize
    @throws = []
    @ball = 0
  end

  def add_throw(pins)
    @throws << pins
  end

  def score_for_frame(frame)
    score = 0
    @ball = 0
    for i in 1..frame
      if quan_zhong?
        score += 10 + next_two_balls
        @ball += 1
      elsif bu_zhong?
        score += 10 + next_ball_for_bu_zhong
        @ball += 2
      else
        score += two_ball_in_frame
        @ball += 2
      end
    end
    score
  end

  def quan_zhong?
    @throws[@ball] == 10
  end

  def next_two_balls
    @throws[@ball+1] + @throws[@ball+2]
  end

  def bu_zhong?
    (@throws[@ball] + @throws[@ball+1]) == 10
  end

  def next_ball_for_bu_zhong
    @throws[@ball+2]
  end

  def two_ball_in_frame
    @throws[@ball] + @throws[@ball+1]
  end
end
