import 'package:civic_app/redux/store.dart';
import 'actions.dart';

CivicComplaintState reducer(CivicComplaintState prevState,Action action){
  print(action);
  print(prevState);
  if(action is ChangeUsername)
  {
    print(action.username);
    print(action.password);
    // newState = CivicComplaintState.copyWith(prevState, action.username, action.password);
    // print(newState);
    }

}
