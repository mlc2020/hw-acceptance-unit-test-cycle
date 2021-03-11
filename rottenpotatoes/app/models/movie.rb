class Movie < ActiveRecord::Base
    def self.similar_movies movie_title
        movie_director = Movie.find_by(title: movie_title).director
        return nil if movie_director.blank? or movie_director.nil?
        Movie.where(director: movie_director).pluck(:title)
    end
end
