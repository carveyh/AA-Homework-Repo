require 'rspec'
require 'calculator'
require 'byebug'

RSpec.describe Calculator do
	let(:c) { Calculator.new }
	let(:a) { 2 }
	let(:b) { 5 }
	let(:arr) { [1,2,3] }
	describe '#add' do
		before(:each) do #passing :each as argument to #before will cause this to run only
			#before each #it contained in the same parent #describe, and the block evaluation
			#inside #before will persist in specs outside this #describe block.
			#passing :all WILL cause the state modifications within the #before block to apply
			#to all specs and is not recommended.
			#default arg for #before is :each so if you just write #before do, it is the same as #before(:each) do
			#There is also #after(:each) and #after(:all)
			c.activate_hidden_multiplier
			# debugger
			# a += 11 #QUESTION: WHY CAN'T I DO THIS???
		end
		it 'returns the sum of its arguments with hidden multiplier when activated' do
			expect(c.add(a,b)).to eq(35)
		end
	end
	describe '#add' do
		it 'returns the sum of its arguments without hidden multiplier when not activated' do
			expect(c.add(a,b)).to eq(7)
		end
		it 'formats the result output in rainbow text color' #omitting do..end will create a 'pending' spec
	end
	describe 'sum_arr' do
		it 'returns the sum of all elements in a given array' do
			expect(c.sum_arr(arr)).to eq(6)
		end
	end
end

describe Calculator do
	# subject(:shiny_calc) { Calculator.new("silver") }
	subject { Calculator.new("silver") }
	it 'sets itself up in middle of your desk' do
		expect(subject.position_on_desk).to eq([0,0])
	end
	it 'starts off nice and shiny' do
		expect(subject.color).to eq("silver")
	end
	describe "move methods" do
		it "can be moved up on desk a bit" do
			expect(subject.move_calc_up_on_desk).to eq([0,1])
		end
	end
end