#expects ruby 2.1.2
class DataFrame
  attr_accessor :headers,:data, :frame
  def initialize(data:[], headers: [],view:"column")
    @data = data
    @headers = headers
    @index_mapping = {}
    @frame = [] # a list of lists
    #the index_mapping is going to keep an internal set of references from the 
    #data to the headers.  the way things should look:
    #Headers: ["Column A","Column B","Column C"]
    #Data:        1           2          3
    #             2           3          4
    #             1           5          2
    #The way internally I'll know what value goes in each column is via the index_mapping
    #The reason for this mapping is because the data will be stored internally as a list, but
    #brought in as a hash - so data will appear as follows: {"Column A" => 1, "Column B" => 2, "Column 3" => 3}
    #despite being used stored internally as rows - [ ["Column A","Column B","Column C"] , [1,2,3] ]
    #
  end
  
  def generate_frame(data,headers: [])
   
  end

  def to_s
   
  end
end


if __FILE__ == $0
  df = DataFrame.new
  df.generate_frame()
  puts df
end
