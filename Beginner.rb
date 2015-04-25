
class Player
  def play_turn(warrior)
    if @health==nil then @health=warrior.health end #health delta initilization
    @criticalhealth=8 #if our health is less than this, we will retreat untill we stop taking damage
    @lowhealth=16     #if our health is less than this and we arent fighting monsters, we will heal
    
    if ((warrior.look.join(" ").downcase.include? "wizard") or (warrior.look.join(" ").downcase.include? "archer")) and (warrior.feel.empty?) then
      warrior.shoot!
    elsif warrior.feel.wall? then
      warrior.pivot!
    elsif warrior.health < @health and warrior.feel.empty? and warrior.health < @criticalhealth then #if we have taken damage but nobody is in front of us and we are at low health, move back
      warrior.walk!:backward
    elsif warrior.health >= @health and warrior.health < @lowhealth then #if we havent taken damage and our health is below lowhealth, heal up
      warrior.rest!
    elsif warrior.feel.captive? then
      warrior.rescue!
    elsif warrior.feel.empty? then
      warrior.walk!
    else
      warrior.attack!
    end
    
    @health=warrior.health #save delta health
  end
end
  
