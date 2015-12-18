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
end
