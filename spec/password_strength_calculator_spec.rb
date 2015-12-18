require "spec_helper"

describe PasswordStrengthCalculator do
  let(:subject) { described_class.new }

  describe "#calculate_password_strength(password)" do
    it "calculates the strength of the password" do
      expect(subject.calculate_password_strength("password1")).to eq 4
    end

    it "calculates the strength of the password" do
      expect(subject.calculate_password_strength("goat m4n")).to eq 15
    end

    it "calculates the strength of the password" do
      expect(subject.calculate_password_strength("s0_0per 5nak3")).to eq 44
    end
  end

  describe "#split_by_non_alpha_chars(text)" do
    it "splits text by non alpha chars" do
      expect(subject.split_by_non_alpha_chars("password1")).to eq ["password"]
    end

    it "splits text by non alpha chars" do
      expect(subject.split_by_non_alpha_chars("goat m4n")).to eq(
        ["goat", "m", "n"]
      )
    end

    it "splits text by non alpha chars" do
      expect(subject.split_by_non_alpha_chars("s0_0per 5nak3")).to eq(
        ["s", "per", "nak"]
      )
    end
  end

  describe "#split_by_alpha_chars(text)" do
    it "splits text by alpha chars" do
      expect(subject.split_by_alpha_chars("password1")).to eq ["1"]
    end

    it "splits text by alpha chars" do
      expect(subject.split_by_alpha_chars("goat m4n")).to eq(
        [" ", "4"]
      )
    end

    it "splits text by alpha chars" do
      expect(subject.split_by_alpha_chars("s0_0per 5nak3")).to eq(
        ["0_0", " 5", "3"]
      )
    end
  end

  describe "#replace_words_with_letters(text)" do
    it "replaces_words_with_letters" do
      expect(subject.replace_words_with_letters("hello")).to eq "x"
    end

    it "replaces_words_with_letters" do
      expect(subject.replace_words_with_letters("password")).to eq "x"
    end

    it "replaces_words_with_letters" do
      expect(subject.replace_words_with_letters("helloworld")).to eq "xx"
    end

    it "replaces_words_with_letters" do
      expect(subject.replace_words_with_letters("hellozz")).to eq "zzx"
    end
  end
end
