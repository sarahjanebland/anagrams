get '/' do
  if params[:word]
    redirect to("/#{params[:word]}")
    else
    erb :index
  end
end

get '/:word' do
  "Show a list of anagrams for \"#{params[:word]}\""
  @word = params[:word]
  word = @word.chomp.downcase.split('').sort.join
  anagrams = Anagram.where('sorted_word = ?', word)
  @result = []

    anagrams.each do |anagram|
    @result << anagram.word
    end

    @result
  erb :index
end
