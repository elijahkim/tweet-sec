require "ruby-dictionary"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

class PasswordStrengthCalculator
  def calculate_password_strength(password)
    words = split_by_non_alpha_chars(password)
    replaced_words = words.map { |word| replace_words_with_letters(word) }
    not_words = split_by_alpha_chars(password)
    new_array = not_words + replaced_words
  end

  def split_by_non_alpha_chars(text)
    text.scan(/[a-zA-Z]+/)
  end

  def split_by_alpha_chars(text)
    text.scan(/[^a-zA-Z]+/)
  end

  def replace_words_with_letters(text)
    loop do
      matching_word = dictionary.prefixes(text).last
      if matching_word
        text.gsub!(matching_word, "")
        text << "x"
      else
        break
      end
    end

    text
  end

  def dictionary
    @_dictionary ||= Dictionary.from_file("lib/dictionary.txt")
  end
end
