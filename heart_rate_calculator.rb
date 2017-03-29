class HeartRateCalculator
  @age = 0
  @resting_heart_rate = 0

  def initialize
    @age = get_age.to_i
    @resting_heart_rate = get_resting_heart_rate.to_i
    heart_rate = calc_intensities
    display(heart_rate)
  end

  private

  def get_age
    puts 'Enter your age: '
    gets
  end

  def get_resting_heart_rate
    puts 'Enter your resting heart rate: '
    gets
  end

  def calc_intensities
    heart_rate = []
    intensities.each_with_index do |intensity, i|
      heart_rate[i] = calc_heart_rates(intensities[i])
    end
    heart_rate
  end

  def calc_heart_rates (intensity)
    ((((220 - @age) - @resting_heart_rate) * intensity) + @resting_heart_rate).round
  end

  def intensities
    [0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90, 0.95]
  end

  def display(heart_rate)
    puts 'Intensity | Heart rate'
    heart_rate.length.times do |i|
      puts "#{(intensities[i] * 100).round}% | #{heart_rate[i]}"
    end
  end
end

HeartRateCalculator.new