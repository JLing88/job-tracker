class ContactsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "Contact Added"
      redirect_to company_path(params[:company_id])
    else
      flash[:notice] = "Unable to create contact"
      redirect_to company_path(params[:company_id])
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    company = Company.find(params[:company_id])
    contact = Contact.update(contact_params)
    redirect_to company_path(company)
  end

  def destroy
    Contact.destroy(params[:id])
    redirect_to company_path(params[:company_id])
  end
end


private
  def contact_params
    params.require(:contact).permit(:name, :job, :email)
  end
