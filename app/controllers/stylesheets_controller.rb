class StylesheetsController < ApplicationController
  
  layout nil
  before_filter :load_color_schemes
  
  
  def application
    respond_to do |format|
      format.html
      format.css
    end
  end
  
  def forms
    respond_to do |format|
      format.html
      format.css
    end
  end
  
  def tabnav
    respond_to do |format|
      format.html
      format.css
    end
  end
  
  def top_navigation
    respond_to do |format|
      format.html
      format.css
    end
  end
  
  def welcome
    respond_to do |format|
      format.html
      format.css
    end
  end
  
  private
  
  def load_color_schemes
    @color_schemes = {}
    if (session[:account_id])
      account = Account.find(session[:account_id])
      account.color_schemes.each { |cs| @color_schemes[cs.name] = cs.hex_value }
    else
      DefaultColorScheme.all.each { |cs| @color_schemes[cs.name] = cs.default_hex_value }
    end
  end
  
end
