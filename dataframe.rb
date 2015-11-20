#expects ruby 2.1.2
class DataFrame
  attr_accessor :headers,:data,:frame
  def initialize(data:[], headers: [])
    @data = data
    @headers = headers
    @frame = {}
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

  def to_s()
    print @headers.join(' ')
    for column in @data
      puts column
    end
    
  end
  
end


if __FILE__ == $0
  df = DataFrame.new
  df.generate_frame([["Hello there","Hi"],["Ahoy friends","what up"]],headers: ["greetings","replies"])
  puts "headers"
  puts df.headers
  puts "data"
  puts df.data
  
end
