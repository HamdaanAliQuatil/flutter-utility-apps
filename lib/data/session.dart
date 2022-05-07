class Session{
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  //unnamed constructor that will set all these fields
  Session(this.id, this.date, this.description, this.duration);

  //named constructor to create a session object from a map
  Session.fromJson(Map<String, dynamic> sessionMap){
    id = sessionMap['id'] ?? 0;
    date = sessionMap['date'] ?? '';
    description = sessionMap['description'] ?? '';
    duration = sessionMap['duration'] ?? 0;
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'date': date,
      'description': description,
      'duration': duration,
    };
  }
}