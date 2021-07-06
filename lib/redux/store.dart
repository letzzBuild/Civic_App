class CivicComplaintState{
  String username;
  String password;
  CivicComplaintState({this.username,this.password});

  CivicComplaintState.copyWith(CivicComplaintState prevState, String username,String password)
  {
   this.username = username ?? prevState.username ;
   this.password = password ?? prevState.password;
  }
}
