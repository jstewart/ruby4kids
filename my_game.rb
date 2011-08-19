require "rubygems"
require "gosu"
require "player"
require "enemy"

class MyGame < Gosu::Window
  def initialize
    super(640, 480, false)
    @player = Player.new(self)
    @enemies = 4.times.map { |net| Enemy.new(self) }
    @background = Gosu::Image.new(self, "images/background.png", true)
    @running = true
  end

  def update
    if button_down? Gosu::Button::KbEscape
      restart!
    end

    if @running
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

      @enemies.each { |net| net.update }
      stop! if @player.hit_by?(@enemies)
    end
  end

  def draw
    @background.draw(0,0,1)
    @player.draw
    @enemies.each { |net| net.draw }
  end

  def stop!
    @running = false
  end

  def restart!
    @running = true
    @enemies.each(&:reset!)
  end
end

window = MyGame.new
window.show
