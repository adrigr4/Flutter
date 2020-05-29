import 'package:jomel/apiCalls/genericCall.dart';
import 'package:jomel/models/member.dart';


  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Member> fetchMovieList(body) async {
    final response = await _helper.post('members', body);
    return Member.newMemberfromJson(response);
  }

  void postNewMember(body) async {
    final response = await _helper.post('members', body);
    print(response);
  }