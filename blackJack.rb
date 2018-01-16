# create a deck of cards

class Deck
  SUITS = ['s', 'h', 'd', 'c']
  VALUES = (2..10).map(&:to_s) + ['J','Q', 'K', 'A']
  def initialize
    @stack = generate_stack
  end 
  
  def draw
    @stack.pop
  end 
  
  def shuffle 
    @stack.shuffle!
  end 
  private
  def generate_stack
    VALUES.product(SUITS).map!(&:join)
  end
end 

#create a player
class Player
  def initialize
    @hand=[]
  end 
  
  def draw(card)
    @hand << card
  end 
  
  def reveal_hand
    puts @hand 
  end 
end 


#have a dealer deal and shuffle 
class Dealer
  def initialize
  @deck = Deck.new
  end 
  def deal_card(player)
    player.draw(@deck.draw)
  end 
  
  def shuffle_deck
    @deck.shuffle
  end 
  
  def burn_card
    @deck.draw
  end 
  def open_pack
    @deck = Deck.new
  end 
end 

dealer = Dealer.new
tara = Player.new
dealer.shuffle_deck
dealer.burn_card
5.times {dealer.deal_card(tara)}

p dealer 
p tara








