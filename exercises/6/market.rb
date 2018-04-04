class Market

  STOCKS = ['BI', 'LL', 'LA', 'BO', 'ON']

  def initial_price
    Random.rand(1.0..100.0).round(2)
  end
  
  def initialize
    @prices = Hash.new
    STOCKS.each do |name|
      @prices[name] = initial_price
    end
  end

  def iterate
    @prices.each do |k, v|
      @prices[k] += Random.rand(-5.0..5.0)
    end
  end

  def price name
    return 'INVALID' if @prices[name.upcase].nil?
    @prices[name.upcase]
  end
  
  def print
    puts "Stock market:"
    @prices.each do |k, v|
      puts "#{k.upcase}.... $#{v.round(2)}"
    end
  end
  
end
