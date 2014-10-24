# -*- coding: utf-8 -*-
class Game
  attr_reader :current_frame

  def initialize
    @current_frame = 0
    @is_first_throw_in_frame = true
    @scorer = Scorer.new
  end

  def add(pins)
    @scorer.add_throw(pins)
    ajax_frame pins
    return self
  end

  def ajax_frame(pins)
    if last_ball_in_frame?(pins)
      advance_frame
      @is_first_throw_in_frame = true
    else
      @is_first_throw_in_frame = false
    end
  end

  def last_ball_in_frame?(pins)
    quan_zhong?(pins) or (not @is_first_throw_in_frame)
  end

  def quan_zhong?(pins)
    @is_first_throw_in_frame and pins == 10
  end

  def advance_frame
    @current_frame = [10, @current_frame+1].min
  end

  def score
    score_for_frame current_frame
  end

  def score_for_frame(frame)
    @scorer.score_for_frame(frame)
  end
end
