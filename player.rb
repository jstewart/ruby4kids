class Player
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/dog.png", true)
    @x=50
    @y=416
  end

  def draw
    @icon.draw(@x,@y,1)
  end

  def move_left
    @x = @x < 0 ? 0 : @x - 10
  end

  def move_right
    @x = @x > 576 ? 576 : @x + 10
  end

  def move_up
    @y = @y < 0 ? 0 : @y - 10
  end

  def move_down
    @y = @y > 416 ? 416 : @y + 10
  end
end
