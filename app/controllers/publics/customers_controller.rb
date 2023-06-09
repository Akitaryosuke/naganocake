class Publics::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    # @customer = Customer.find_by(email: params[:customer][:email])
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_delete: false)
    reset_session
    redirect_to root_path
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to publics_customer_path(current_customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_delete)
  end
end
