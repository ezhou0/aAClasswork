def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.select(:title, :id)
    .joins(:actors)
    .where(actors: {name: those_actors})
    .group(:id)
    .having("COUNT(actors.id) = #{those_actors.length}")
    # come back to
    # line 6 selects all movies where one of the actors in those_actors included
    # group movies together by id, select 
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie.select('AVG(score), (yr / 10) * 10 as decade')
    .group('decade')
    .order('AVG(score) DESC')
    .first
    .decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  subquery = Movie.select(:id)
                    .joins(:actors)
                    .where(actors: {name: name})

  Movie.joins(:actors)
        .where.not(actors: {name: name})                    
        .where(movies: {id: subquery})
        .distinct.pluck(:name)

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.select(:name)
    .joins('LEFT OUTER JOIN castings on castings.actor_id = actors.id')
    .where(castings: {movie_id: nil })
    .count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  
  query = '%' + whazzername.split('').join('%') + '%'
  Movie.joins(:actors)
    .where('LOWER(actors.name) LIKE LOWER(?)', query)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor.select(:name, :id, 'MAX(movies.yr) - MIN(movies.yr) as career')
    .joins(:movies)
    .order('career DESC, name')
    .group(:id)
    .limit(3)
end

def matcher_method(whazzername)
  names = Actor.pluck(:name) # gives us our names 
  matched_name = nil
  names.each do |name|
    name_arr = name.split("")
    matcher = name_arr.select {|char| whazzername.include?(char)}.join('')
    matched_name = name if whazzername.downcase == matcher.downcase
  end
end