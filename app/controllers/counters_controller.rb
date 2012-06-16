class CountersController < ApplicationController

  def index

    @counters = Counter.all

    @skipped = session[:skipped] || {}
    if @skipped.keys.count == @counters.count
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
    if params[:commit]=='Pay'
      @counter = Counter.find_by_title params[:highlited_title]
      @counter.count+=1
      @counter.save!
      session[:skipped]={}
    end
    if params[:commit]=='Skip'
      if session[:skipped] == nil
        session[:skipped] = {}
      end
      session[:skipped][params[:highlited_title]] = 0
    end
    redirect_to counters_path
  end


end
