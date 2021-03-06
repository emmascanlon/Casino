require "pry"
require "colorize"
@yourDeck = [{suit: "♠",  value: 2, number: 2}, {suit: "♠",  value: 4, number: 4}, {suit: "♠",  value: 6, number: 6}, 
{suit: "♠",  value: 8, number: 8}, {suit: "♠",  value: 10, number: "J"}, {suit: "♠",  value: 12, number: "K"}, 
{suit: "♦️",  value: 2, number: 2}, {suit: "♦️",  value: 4, number: 4}, {suit: "♦️",  value: 6, number: 6}, 
{suit: "♦️",  value: 8, number: 8}, {suit: "♦️",  value: 10, number: "J"}, {suit: "♦️",  value: 12, number: "K"},
{suit: "♣️",  value: 3, number: 3}, {suit: "♣️",  value: 5, number: 5}, {suit: "♣️",  value: 7, number: 7}, 
{suit: "♣️",  value: 9, number: 9}, {suit: "♣️",  value: 11, number: "Q"}, {suit: "♣️",  value: 13, number: "A"},
{suit: "♥️",  value: 3, number: 3}, {suit: "♥️",  value: 5, number: 5}, {suit: "♥️",  value: 7, number: 7}, 
{suit: "♥️",  value: 9, number: 9}, {suit: "♥️",  value: 11, number: "Q"}, {suit: "♥️",  value: 13, number: "A"},]
@compDeck = [{suit: "♠",  value: 3, number: 3}, {suit: "♠",  value: 5, number: 5}, {suit: "♠",  value: 7, number: 7}, 
{suit: "♠",  value: 9, number: 9}, {suit: "♠",  value: 11, number: "Q"}, {suit: "♠",  value: 13, number: "A"}, 
{suit: "♥️",  value: 2, number: 2}, {suit: "♥️",  value: 4, number: 4}, {suit: "♥️",  value: 6, number: 6}, 
{suit: "♥️",  value: 8, number: 8}, {suit: "♥️",  value: 10, number: "J"}, {suit: "♥️",  value: 12, number: "K"},
{suit: "♣️",  value: 2, number: 2}, {suit: "♣️",  value: 4, number: 4}, {suit: "♣️",  value: 6, number: 6}, 
{suit: "♣️",  value: 8, number: 8}, {suit: "♣️",  value: 10, number: "J"}, {suit: "♣️",  value: 12, number: "K"},
{suit: "♦️",  value: 3, number: 3}, {suit: "♦️",  value: 5, number: 5}, {suit: "♦️",  value: 7, number: 7}, 
{suit: "♦️",  value: 9, number: 9}, {suit: "♦️",  value: 11, number: "Q"}, {suit: "♦️",  value: 13, number: "A"},]
@battle = []
def welcome
puts "Welcome to war!".red
 puts "Do you want to start or see the detials on how the betting works?".red
 print "(start/detials/quit)> "
 case gets.strip.downcase
 when "start"
  cast
 when "detials"
  puts "It is $5 for ever round and you double your money every win!".red
  puts "Also when you win you take the dealers card so the more you win the better the chances of you winning!".red
  print "So would you like to play?".red
  print "(start/quit)> "
  gets.strip.downcase == "start" ? (cast) : nil
 when "quit"
  "Come wage war with us anytime!".red
  sleep 1
 else 
  welcome
 end
end
 def cast
  rng = Random.new
  yNum = rng.rand(@yourDeck.count)
  cNum = rng.rand(@compDeck.count)
    yCard = @yourDeck[yNum]
    cCard = @compDeck[cNum]
   print `clear`
    print"
  
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   |________________|
   
   
   
   
   
   
   
   
   
   
   
   
   
   


"
sleep 0.25
print `clear`
    print"
    ________________
   |                |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   | XXXXXXXXXXXXXX |
   |________________|
                                 
                                  
                                    
                     ________________ 
                    |                |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    
                                       
"

sleep 0.3
print `clear`
print"
    ________________
   |#{cCard[:number]}               |
   |#{cCard[:suit]}               |
   |                |
   |                |
   |                | <-- Dealer's card
   |                |
   |                |
   |                |
   |________________|________________
                    |                |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    | XXXXXXXXXXXXXX |
                    |________________|
                    
"

sleep 0.3
print `clear`
print"
    ________________
   |#{cCard[:number]}               |
   |#{cCard[:suit]}               |
   |                |
   |                |
   |                | <-- Dealer's card
   |                |
   |                |
   |                |
   |________________|________________
                    |#{yCard[:number]}               |
                    |#{yCard[:suit]}               |
                    |                |
                    |                |
      Your card --> |                |
                    |                |
                    |                |
                    |                |
                    |________________|
                    
"

sleep 0.5
if cCard[:value] < yCard[:value] 
  puts "You won!".green
@yourDeck << @compDeck[cNum]
@compDeck.delete_at(cNum)
@yourDeck << @battle
@battle = []
@yourDeck.flatten!
   $wallet.depo(5)
   repeat
elsif cCard[:value] == yCard[:value]
  puts "Draw!!! That means War!".red
  uNum = rng.rand(@yourDeck.count)
  dNum = rng.rand(@compDeck.count)
  @battle << @compDeck[cNum]
  @compDeck.delete_at(cNum)
  @battle << @yourDeck[yNum]
  @yourDeck.delete_at(yNum)
  @battle << @compDeck[dNum]
  @compDeck.delete_at(dNum)
  @battle << @yourDeck[uNum]
  @yourDeck.delete_at(uNum)
  
  sleep 2
  cast
else
  puts "You lost".yellow
  @compDeck << @yourDeck[yNum]
  @yourDeck.delete_at(yNum)
  @compDeck << @battle
  @battle = []
  @compDeck.flatten!
    $wallet.withdraw(5)
    repeat
 end
end 

def repeat
  if @compDeck.empty? 
    puts "Well looks like you beat the dealer at war
    Here's a pay out of $200. Come wage war with us anytime!".red
    $wallet.depo(250)
    sleep 1
  elsif @yourDeck.empty?
    Puts "Looks like the dealer won this time.
    Come wage war with us anytime!".red
    sleep 1
  elsif $budget <= 0
    puts "Looks like your'e out of money...".red
    sleep 1
  else
    puts
print "Go again?".red
puts " (Dealer: #{@compDeck.count} cards) (You: #{@yourDeck.count} cards)"
print "(yes/no)> "
case gets.strip.downcase
when "yes"
  print `clear`
  cast
when "no"
  puts "Are you sure you want to leave?
  The decks will be reset".red
  print "(yes/no)> "
  case gets.strip.downcase
  when "yes"
    puts "Come wage war with us anytime!".red
    sleep 1
  else 
    repeat
  end
else 
  repeat
end
end

end
 welcome