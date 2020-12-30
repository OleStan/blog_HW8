class AuthorsController < ApplicationController


  def index
    @autors = Author.all
    redirect_to signup_url
  end

  def new
    cookies[:views] = 3
    @author = Author.new
  end

  def edit
    @author = current_author
  end
  def show
    redirect_to home_url
  end
  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to home_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end


    def update
      @author = Author.find(params[:id])
      respond_to do |format|
        if @author.update(author_params)
          format.html { redirect_to home_url, notice: 'Author was successfully updated.' }
          format.json { render :show, status: :ok, location: @author }
        else
          format.html { render :edit }
          format.json { render json: @author.errors, status: :unprocessable_entity }
        end
      end
    end



  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :birthday,
                                   :gender, :password, :password_confirmation, :avatar)
  end

end