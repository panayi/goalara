module ApplicationHelper
  def words_occurrences_in_string(text)
    words = text.split 
    freqs=Hash.new(0) 
    words.each { |word| freqs[word] += 1 } 
    freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+' '+f.to_s}
  end
end