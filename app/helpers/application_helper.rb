module ApplicationHelper
  def words_occurrences_in_string(text)
    words = text.split 
    freqs=Hash.new(0) 
    words.each { |word| freqs[word] += 1 } 
    freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+' '+f.to_s}
  end
  
  def truncate_words(text, length, end_string = ' ...')
    returning words = text.split() do
      words = words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
    end
  end
  
end