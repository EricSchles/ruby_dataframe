#expects ruby 2.1.2
class DataFrame
 
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

end

if __FILE__ == $0
  df = DataFrame.new
  
