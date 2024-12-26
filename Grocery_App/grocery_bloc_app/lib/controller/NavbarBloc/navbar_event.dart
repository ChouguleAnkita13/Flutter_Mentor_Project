abstract class NavbarEvent {}

class ChangeBottomNavTapEvent extends NavbarEvent {
  final int newIndex;
  ChangeBottomNavTapEvent({required this.newIndex});
}
