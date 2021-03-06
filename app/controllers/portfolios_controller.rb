class PortfoliosController < ApplicationController
  layout "portfolio"
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    head :ok
  end

  def angular
    @angular_portfolio_items  = Portfolio.angular
  end

  def rubyonrails
    @rubyonrails_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit

  end



  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_show_path(@portfolio_item), notice: 'Porfolio item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolio_show_path(@portfolio_item), notice: 'Portfolio Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      technologies_attributes: [:name]
                                    )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
