#expects ruby 2.1.2
class DataFrame
  attr_accessor :headers,:data,:frame, :view
  def initialize(data:[], headers: [],view:"column")
    @data = data
    @headers = headers
    @frame = {}
    @view = view
    if @headers != [] and @data != []
      for header,ind in @headers.each_with_index
        @frame[header] = @data[ind]
      end
    end
  end
  
  def generate_frame(data,headers: [])
    @data = data
    @headers = headers
    alphabet = "abcdefghijklmnopqrstuvwxyz".split('')
    if headers != []
      for header,ind in @headers.each_with_index
        @frame[header] = @data[ind]
      end
    else 
      for elem in 0..data.length
        headers.push(alphabet[elem])
      end
      for header,ind in @headers.each_with_index
        @frame[header] = @data[ind]
      end
    end
  end

  def to_s
    if @view == "column"
    print @headers.join(' ')
    puts "Column by Column view"
    for column in @data
      puts column.join(',')
    end
    
  end
  
end


if __FILE__ == $0
  df = DataFrame.new
  df.generate_frame([["Hello there","Hi"],["Ahoy friends","what up"]],headers: ["greetings","replies"])
  puts df
end
