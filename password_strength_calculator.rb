require "ruby-dictionary"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

class PasswordStrengthCalculator
  def calculate_password_strength(password)
    words = split_by_non_alpha_chars(password)
    formatted_password_array = not_words(password) + replaced_words(words)
    new_string = formatted_password_array.join
    new_string.length * number_of_char_types(new_string)
  end

  def number_of_char_types(text)
    count = 0
    count += 1 if has_letters?(text)
    count += 1 if has_numbers?(text)
    count += 1 if has_whitespaces?(text)
    count += 1 if has_something_else?(text)
    count
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

  private

  def not_words(text)
    split_by_alpha_chars(text)
  end

  def replaced_words(words)
    words.map { |word| replace_words_with_letters(word) }
  end

  def has_letters?(text)
    !!/\w/.match(text)
  end

  def has_numbers?(text)
    !!/\d/.match(text)
  end

  def has_whitespaces?(text)
    !!/\s/.match(text)
  end

  def has_something_else?(text)
    text.gsub!(/[a-zA-Z]/, "")
    text.gsub!(/\d/, "")
    text.gsub!(/\s/, "")
    !text.empty?
  end

  def dictionary
    @_dictionary ||= Dictionary.from_file("lib/dictionary.txt")
  end
end
