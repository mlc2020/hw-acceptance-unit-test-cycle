require 'rails_helper'
require_relative '../support/action_controller_workaround.rb'

describe MoviesController do
    describe 'Search by director' do
        it 'should call Movie.similar_movies' do
            expect(Movie).to receive(:similar_movies).with('The Terminator')
            get :search, {title: 'The Terminator'}
        end
        it 'should show similar movies (given a non-nil director)' do
            movies_test = ['The Terminator', 'The Terminator 2']
            Movie.stub(:similar_movies).with('The Terminator').and_return(movies_test)
            get :search, {title: 'The Terminator'}
            expect(assigns(:similar_movies)).to eql(movies_test)
        end
        it 'should redirect back to start given nil director' do
            Movie.stub(:similar_movies).with('Nil').and_return(nil)
            get :search, {title: 'Nil'}
            expect(response).to redirect_to(root_url)
        end
    end
end