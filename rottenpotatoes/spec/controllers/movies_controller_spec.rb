require 'rails_helper'

describe MoviesController do
    describe 'Search by director' do
        it 'should call Movie.similar_movies' do
            expect(Movie).to receive(:similar_movies).with('The Terminator')
            get :search, {title: 'Aladdin'}
        end
    end
end