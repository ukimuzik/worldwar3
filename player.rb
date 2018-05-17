class Player

  def initialize
    @image = Gosu::Image.new("media/car.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @distance = 0.0
    @temp_mx = 0.0
    @temp_my = 0.0
    @score = 0
  end

  def destination(x, y) #標記前進目標角度和坐標
    @angle = Gosu.angle(@x, @y, x, y)
    @temp_mx = x
    @temp_my = y
  end

  def move #計算和目標的距離
    @moving_distance = Gosu.distance(@x, @y, @temp_mx, @temp_my)
    if @moving_distance >= 10 #和目標位置距離大於10px時移動player
      @vel_x += Gosu.offset_x(@angle, 0.5)
      @vel_y += Gosu.offset_y(@angle, 0.5)
      @x += @vel_x
      @y += @vel_y
      @vel_x *= 0.3
      @vel_y *= 0.3
    else #目的地到達減速player
      @x += @vel_x
      @y += @vel_y
      @vel_x *= 0.95
      @vel_y  *= 0.95
    end

  end

  def warp(x, y) #開始座標
    @x, @y = x, y
    @temp_mx = x
    @temp_my = y
  end

  def draw
      @image.draw_rot(@x, @y, 1, @angle)
  end
end
