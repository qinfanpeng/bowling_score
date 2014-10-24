# -*- coding: utf-8 -*-
require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  context "score" do
    it "with 2 throws" do
      game.add 5
      game.add 4
      game.score.should == 9
      game.current_frame.should == 1
    end
    # 无补中
    it "with 4 throws and no mark" do
      game.add 5
      game.add 4
      game.add 7
      game.add 2
      game.score_for_frame(1).should == 9
      game.score_for_frame(2).should == 18
    end
    # 测试补中
    it "bu zhong" do
      game.add 3
      game.add 7
      game.add 3
      game.score_for_frame(1).should == 13
      game.current_frame.should == 1
    end
    it "quan zhong" do
      game.add 10
      game.add 3
      game.add 6
      game.score_for_frame(1).should == 19
      game.score.should == 28
      game.current_frame.should == 2
    end
    it "12x10" do
      12.times do
        game.add 10
      end
      game.score.should == 300
      game.current_frame.should == 10
    end
    it "simple game" do
      game
        .add(1).add(4)
        .add(4).add(5)
        .add(6).add(4)
        .add(5).add(5)
        .add(10)
        .add(0).add(1)
        .add(7).add(3)
        .add(6).add(4)
        .add(10)
        .add(2).add(8)
        .add(6)

      game.score.should == 133
      game.current_frame.should == 10
    end
    it "11x10+9" do
      11.times do
        game.add 10
      end
      game.add 9
      game.score.should == 299
    end
    it "9x10+ buzhong" do
      9.times do
        game.add 10
      end
      game.add(9).add 1
      game.add 1
      game.score.should == 270
    end
  end
end
