#expects ruby 2.1.2
class DataFrame
  attr_accessor :headers,:data, :column_frame, :view, :row_frame
  def initialize(data:[], headers: [],view:"column")
    @data = data
    @headers = headers
    @column_frame = {}
    @row_frame = {}
    @view = view
    if @headers != [] and @data != []
      for header,ind in @headers.each_with_index
        @column_frame[header] = @data[ind]
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
   
    elsif @view == "row"
      print @headers.join(' ')
      
    end
  end
end


if __FILE__ == $0
  df = DataFrame.new
  df.generate_frame([["Hello there","Hi"],["Ahoy friends","what up"]],headers: ["greetings","replies"])
  puts df
end
