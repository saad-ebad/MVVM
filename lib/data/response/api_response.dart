import 'package:mvvm/data/response/status.dart';

// ignore: camel_case_types
class Api_Response<T>
{
  Status? status;
  T? data;
  String? message;

  Api_Response(this.status , this.message , this.data);


  Api_Response.loading()  : status = Status.LOADING;
  Api_Response.completed() : status = Status.COMPLETED;
  Api_Response.error() : status = Status.ERROR;


  @override
  String toString()
  {
    return "Status $status \n Message $message \n Data $data";
  }
}