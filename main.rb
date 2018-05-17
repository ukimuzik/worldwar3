require 'gosu'
require './player'

class Ww3 < Gosu::Window

  def initialize
    super 640, 480
    self.caption = "World War 3"
    @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    @cursor = Gosu::Image.new("media/cursor.png")
    @player = Player.new
    @player.warp(320, 240)
  end

  def update
    if button_down? Gosu::MS_LEFT
      @player.destination(mouse_x, mouse_y)
    end
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
    @cursor.draw(mouse_x, mouse_y, 0)
  end


  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

end

Ww3.new.show
