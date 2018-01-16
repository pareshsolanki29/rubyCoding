class Player
    MOVES = [:rock, :paper, :scissors]
    attr_reader :score, :move
    
    def initialize
      @score = 0
      @move = nil
    end 
  
    def get_move
      loop do
        puts "pick a move rock, paperscissor or scissors"
        print ">"
        @move = gets.chomp.strip.downcase.to_sym
      if @move == :quit
        return false
          elsif MOVES.include?(@move)
            return @move
            else
            puts "Invalid Move"
          end 
     end 
    end 
    
    def win
      @score += 1
    end 
end

class ComputerPlayer < Player
  def  get_move
    @move = [:rock, :paper, :scissors].sample
  end 
end 

class Game
  WIN_SCENES = [
    [:rock, :scissors],
    [:paper, :rock],
    [:scissors, :paper]
    ]
    
    def initialize
      @p1 = Player.new
      @p2 = ComputerPlayer.new
      play
    end 
    

    
    def pick_winner
      if  @p1.move == @p2.move
        puts "It's a tie"
        elsif WIN_SCENES.include?([@p1.move, @p2.move])
          puts "p1 wins"
           @p1.win
        else 
          puts "p2 wins"
           @p2.win
      end 
    
    end
  
    def play_around
      
      return false unless @p1.get_move
      return false unless @p2.get_move
      print_move
      pick_winner
      print_scores
      puts "Lets play again"
      true
    
    end 
    def play
      loop do
        break unless play_around
      end 
      puts "goodbye thanks for playing"
    end 
    
    def print_move
      puts "p1 played #{@p1.move}, and p2 played #{@p2.move}."
    end 
    
    def print_scores
      puts "Scores :"
      puts "p1 : #{@p1.score}"
      puts "p2 : #{@p2.score}"
    end 
end 


Game.new