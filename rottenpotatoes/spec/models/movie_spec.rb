require 'rails_helper'
require_relative '../support/action_controller_workaround.rb'

describe Movie do
    describe '.find_similar_movies' do
        let!(:test_movie_0) {FactoryGirl.create(:movie, title: "The Terminator", director: 'James Cameron')}
        let!(:test_movie_1) {FactoryGirl.create(:movie, title: "The Terminator 2", director: 'James Cameron')}
        let!(:test_movie_2) {FactoryGirl.create(:movie, title: 'Moana', director: 'Ron Clements')}
        let!(:test_movie_3) {FactoryGirl.create(:movie, title: 'NilMovie')}
        
        context 'director exists' do
            it 'finds similar movies based on director' do
                expect(Movie.similar_movies(test_movie_1.title)).to eql(['The Terminator', 'The Terminator 2'])
                expect(Movie.similar_movies(test_movie_1.title)).to_not include(['Moana'])
            end
        end
        
        context 'director does not exist' do
            it 'handles the sad path (no director)' do
                expect(Movie.similar_movies(test_movie_3.title)).to eql(nil)
            end
        end
    end
end