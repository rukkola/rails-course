class ItemsController < ApplicationController
  #layout false

  # запишем данные из консоли
  skip_before_action :verify_authenticity_token # пропускает токен, что бы его не вводить
  before_action :find_item, only: %i[show edit update destroy upvote]
  before_action :admin?, only: %i[edit]
  after_action :show_info, only: %i[index]

  def index
    @items = Item.all # можно писать условия Item.where('price > 200 OR votes_count >= 2')
    @items = @items.includes(:image) # запросом выбирает сразу все фото, без этого на каждую фотку 1 запрос
    #render body: @items.map { |i| "#{i.name}: #{i.price}" }
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
    end
=begin
  def new; end

  def show
    render body: 'Page not found', status: 404 unless @item
  end

  def edit
    render body: 'Page not found', status: 404 unless @item
  end
=end
  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render body: 'Page not found', status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path # или '/items'
    else
      render body: 'Page not found', status: :unprocessable_entity
    end
  end

  def upvote
    @item.increment! :votes_count
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 1000')
    render :index
  end

  private

  def items_params
    params.permit(:name, :price, :desc)
  end
  
  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def show_info
    puts 'Index end point'
  end

end
