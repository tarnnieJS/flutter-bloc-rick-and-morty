// bloc/user_event.dart
abstract class UserEvent {}

class LoadUsers extends UserEvent {}
class OnTapUser extends UserEvent {
  final String userId;
  OnTapUser(this.userId);
}
class LoadMoreUsers extends UserEvent {
  final int page;
  LoadMoreUsers(this.page);
}
