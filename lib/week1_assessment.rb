# Put your code here to make the tests pass

class Weapon

  attr_reader :name, :damage

  def initialize (name, damage_value)

    @name = name
    @damage = damage_value

  end

end


class BattleBot

  attr_reader :name, :health, :weapon, :dead, :enemies
  alias_method :dead?, :dead

  def initialize(name)

    @name = name
    @health = 100
    @weapon = nil
    @dead = dead?
    @enemies = []

  end

  def pick_up(new_weapon)

    if @weapon.nil?
      @weapon = new_weapon
    else
      @weapon
    end

  end

  def drop_weapon

    @weapon = nil

  end

  def attack(target)

    if @weapon == nil
      raise "You cannot attack without a weapon"
    end

    unless target.is_a?(BattleBot)
      raise ArgumentError
    end

    target.take_damage(@weapon.damage)
    target.add_enemy(self)

  end

  def take_damage (weapon_damage)

    @health -= weapon_damage
    dead?

  end

  def dead?

    if @health > 0 
      return false
    else
      return true
    end

  end

  def add_enemy (attacker)

    unless @enemies.include?(attacker)
      @enemies << attacker
    end

  end


end




