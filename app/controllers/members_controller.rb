class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def notice
    #@members = Members.find(params[:id])
  end

  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    #render 'top/index'
  end

  # GET /members/new
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/1/edit
  def edit
     @member = Member.find(params[:id])
      render 'edit'
  end

  def confirm
     @member = Member.new(member_params)
    respond_to do |format|
      if @member.valid?
          # 確認画面
          format.html
      else
          # エラー
          format.html { render :action => "new" }
      end
    end
  end

  def complete
    @member = Member.new(member_params)

      if @member.save

      sign_in @member
      flash[:success] = "ようこそ"
      session[:id] = @member.id
      render "top/index"

      else
        format.html { render :action => "new" }
      end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    if @member.save
      sign_in @member
      flash[:success] = "ようこそ"
      session[:id] = @member.id
      #redirect_to @member
      render 'top/index'
    else
      format.html { render action: 'new' }
      #render 'new'
    end

        format.html { render action: 'new' }
  end
  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json

  def update
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
      #@member.update_attributes = { :quit => "1" }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:login_id, :name, :kana, :birthday, :password,:password_confirmation, :nickname, :mail_address, :address, :point, :quit,:remember_token)
    end
end
