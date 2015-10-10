require File.expand_path("code/fibonacci")

describe Fibonacci do
  describe ".calculate" do

    {'numeric' => 'a', 'positive' => -1}.each do |name, input|
      it "when n is not #{name}" do
        expect { Fibonacci.calculate(input) }.to raise_error(ArgumentError, "input must be #{name}")
      end
    end

    describe "works" do
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765].each_with_index do |value, index|
        context "when n == #{index}" do
          subject { Fibonacci.calculate(index) }

          it { is_expected.to eq value }
        end
      end
    end
  end
end
