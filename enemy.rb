class Enemy
  attr_accessor :x, :y

  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/cat.png", true)
    reset!
  end

  def draw
    @icon.draw(@x, @y, 2)
  end

  def update
    if @y > @game_window.height
      reset!
    else
      @y = y + 6
    end
  end

  def reset!
    @y = 0
    @x = rand(@game_window.width)
  end
end
