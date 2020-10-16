require "First_TDD_Projects"

describe "Array" do
    let (:empty_array) { [] }
    let (:unique_array) { [1, -2, 56, 0] }
    
    describe "#my_uniq" do
        let (:non_unique_array) { [1, -2, 56, 0, 0, -2, -2] }

        it 'returns an empty array if passed an empty array' do
            expect(empty_array.my_uniq).to be_empty
        end

        it 'returns an array with no duplicate values if given an array with no duplicate values' do
            expect(unique_array.my_uniq).to eq(unique_array) # [1, -2, 56, 0]
            # expect([1, -2, 56, 0].my_uniq).to eq([1, -2, 56, 0])
        end

        it 'returns an array with no duplicate values if given an array with duplicate values' do
            expect(non_unique_array.my_uniq).to eq([1, -2, 56, 0])
        end

    end
    describe "#two_sum" do
        it 'returns an empty array if passed an empty array' do
            expect(empty_array.two_sum).to be_empty
        end

        context 'when array has pairs of values that sum to zero' do
            let (:small_array) {[-2, 3, 2]}
            let (:normal_array) {[-2,0,2,4,6,-5,-2,5,-4]}
            it 'returns pairs of indices where the values sum to zero' do
                expect(small_array.two_sum).to eq([[0,2]])
            end
            it "doesn't return pairs where both values have the same index" do
                expect(normal_array.two_sum).to eq([[0,2],[2,6],[3,8],[5,7]])
            end
        
        end
        
        context "when array doesn't have pairs of values that sum to zero" do
            it 'returns an empty array' do
                expect(unique_array.two_sum).to eq([])
            end
        end

    end

    describe "#my_transpose" do
        let (:regular_2d_array) { [[0, 1, 2],
                                   [3, 4, 5],
                                   [6, 7, 8]] }
        let (:one_by_one_array) { [[0]] }
        let (:non_2d_array) { [1, 5, 7, 6, 2] }

        context 'when called upon a 2d array' do
            it 'returns itself when called upon a 1x1 array' do
                expect(one_by_one_array.my_transpose).to eq(one_by_one_array)
            end
            let (:transposed_array) { [ [0, 3, 6],
                                        [1, 4, 7],
                                        [2, 5, 8]] }
            it 'returns a transposed array' do
                expect(regular_2d_array.my_transpose).to eq(transposed_array)
            end
        end

        it 'raises an error when called upon a non-2d array' do
            expect { non_2d_array.my_transpose }.to raise_error

        end
    end
    
end 