package controllers

import javax.inject.Inject

import play.api.mvc.InjectedController
import utilities.AkkaDispatcherProvider

class BaseController @Inject()(akkaDispatcherProvider:AkkaDispatcherProvider) extends InjectedController{
  implicit val nonBlockingDispatcher = akkaDispatcherProvider.nonBlockingDispatcher
}