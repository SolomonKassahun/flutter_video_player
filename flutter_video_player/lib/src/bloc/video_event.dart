class FetchVideoEvent  {}
class FetchSingleVideoEvent extends FetchVideoEvent {
  int pagination;
  FetchSingleVideoEvent({required this.pagination});
}