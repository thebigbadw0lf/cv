class CvController < ApplicationController
  def index
    @years = %w{ 1978 1994 1998 2003 2005 2006(1) 2006(2) 2007 2008 2009 2010 2011 2012 2013 }
  end
end
