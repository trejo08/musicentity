class User < ApplicationRecord

  def user_traits
    personality.reject { |k, v| v.to_f < 0.5 }
  end

  def genres
    trait = user_traits.keys.sample

    case trait
    when 'Openness'
      'clasical'
    when 'Extraversion'
      'rap'
    when 'Agreeableness'
      'jazz'
    when 'Emotional range'
      'country'
    when 'Conscientiousness'
      'pop'
    end
  end
end
