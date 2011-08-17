require "rubygems"
require "gosu"
require "player"

class MyGame < Gosu::Window
  def initialize
    super(640, 480, false)
    @player = Player.new(self)
    @background = Gosu::Image.new(self, "images/background.png", true)
  end

  def update
    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end
    if button_down? Gosu::Button::KbRight
      @player.move_right
    end
    if button_down? Gosu::Button::KbUp
      @player.move_up
    end
    if button_down? Gosu::Button::KbDown
      @player.move_down
    end
  end

  def draw
    @background.draw(0,0,1)
    @player.draw
  end
end

window = MyGame.new
window.show
