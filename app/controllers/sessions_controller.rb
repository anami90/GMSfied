class SessionsController < ApplicationController
  before_filter :authenticate, :only =>[:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]


  def index
 
     @title = "All Users"
     @sessions = Session.all
  end
     
  def show
      @session = Session.find(params[:id])
      @title = @session.name
      @progresses = @session.progresses

  end

  
  def new
     
     @session = Session.new
     @title = "Sign up" 
 
  end
  
  def create
     @session = Session.new(params[:session])
    if @session.save
    sign_in @session
     # Handle a successful save.
     flash[:success] = "Welcome to the GMS"
     redirect_to @session
    else
      @title = "Sign up"
      render 'new'
   end
  end
 
  
  def edit 
    #@session = Session.find(params[:id])
    @title = "Edit user"
  end 
  
  def update
    @session = Session.find(params[:id])
    if @session.update_attributes(params[:session])
     flash[:success] = "Profile updated."
     redirect_to @session
   else
    @title = "Edit user"
    render 'edit'

   end
 end 
 
  private 
    def authenticate
     deny_access unless signed_in?
   end
   
   def correct_user
     @session = Session.find(params[:id])
     redirect_to(signin_path) unless current_user?(@session)
  end

  
end     
