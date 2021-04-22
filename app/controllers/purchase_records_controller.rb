class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item

  def index
    @purchase_record_destination = PurchaseRecordDestination.new
    if current_user == @item.user
       redirect_to root_path
    end
  end
  
  def create
    @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_params)
    if current_user == @item.user
      redirect_to root_path
    end
    if @purchase_record_destination.valid?
      pay_item
      @purchase_record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_record_params
    params.require(:purchase_record_destination).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_record_params[:token],
      currency: 'jpy' 
    )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase_record.present?
   end

   def set_item
    @item = Item.find(params[:item_id])
  end
end


