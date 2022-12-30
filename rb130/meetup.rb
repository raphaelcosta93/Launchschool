require 'date'

class Meetup
  attr_reader :year, :month, :last_day

  def initialize(year, month)
    @year = year
    @month = month
    @last_day = Date.civil(year, month, -1)
  end

  def day(weekday, description)
    weekday.downcase!
    description.downcase!
    first_possible_day = Date.civil(year, month, 1)
    result = []
    teens =  [13, 14, 15, 16, 17, 18, 19]
    first_possible_day.upto(last_day) do |day|
      case weekday
      when 'monday'    then result << day if day.monday?
      when 'tuesday'   then result << day if day.tuesday?
      when 'wednesday' then result << day if day.wednesday?
      when 'thursday'  then result << day if day.thursday?
      when 'friday'    then result << day if day.friday?
      when 'saturday'  then result << day if day.saturday?
      else                  result << day if day.sunday?
      end
    end

    case description
    when 'first'  then result[0]
    when 'second' then result[1]
    when 'third'  then result[2]
    when 'fourth' then result[3]
    when 'fifth'  then result[4]
    when 'last'   then result[-1]
    else          result.each { |day| return day if teens.include?(day.day) }
    end
  end
end
