require 'savon'
class SessionsController < ApplicationController
  def new

  end

  def create
    client = Savon.client(ssl_ca_cert_file: "C:/RailsInstaller/cacert.pem",
                          wsdl: "https://ws.espol.edu.ec/saac/wsandroid.asmx?WSDL")
    response = client.call(:autenticacion, message: { authUser: params[:session][:email], authContrasenia: params[:session][:password] })

    autenticado = response.body[:autenticacion_response][:autenticacion_result]
    puts autenticado

    if autenticado
      session[:user_id] = params[:session][:email]
      response = client.call(:ws_info_usuario, message: { authUser: params[:session][:email]})
      redirect_to '/orders'
    else
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
