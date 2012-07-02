class CountersController < ApplicationController

  def index
# raise params.inspect
    @counters = Counter.find_all_by_queue params[:queue]

    @skipped = session[:skipped] || {}
    if @skipped.keys.count >= @counters.count
      @skipped = {}
      session[:skipped] = @skipped
    end

    min_count = 10000000000000000
    @counters.each do |c|
      unless @skipped.has_key? c.title
        if c.count < min_count 
          min_count = c.count
          @highlited_title = c.title
        end
      end
    end
  end

  def pay
#    raise params.inspect
    @counter = Counter.find_by_title_and_queue params[:highlited_title], params[:queue]
    if( @counter )
      @counter.count+=1
      @counter.save!
    end
    session[:skipped]={}
    redirect_to queues_path params[:queue]
  end

  def skip
#    raise params.inspect
    if session[:skipped] == nil
      session[:skipped] = {}
    end
    session[:skipped][params[:highlited_title]] = 0
    redirect_to queues_path params[:queue]
  end


end
