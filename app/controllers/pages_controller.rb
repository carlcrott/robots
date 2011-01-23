require 'net/ssh'
require 'logger'

class PagesController < ApplicationController
  def home
    @title = " HOME PAGE DAR "
  end
  
  def foo
    render :text => 'bar'
  end
  
  
  
  def conn
  
  Net::SSH.start( '127.0.0.1','unf-ubu' ) do |session|
    session.open_channel do |channel|
      channel.on_close do |ch|
        puts "channel closed successfully."
        render :text => 'hits'
      end
      puts "closing channel..."
      channel.close
    end

    session.loop
  end
    
  end








end
