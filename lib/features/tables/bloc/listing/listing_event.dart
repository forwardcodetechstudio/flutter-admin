part of 'listing_bloc.dart';

sealed class ListingEvent extends Equatable {
  const ListingEvent();

  @override
  List<Object> get props => [];
}

class AddListing extends ListingEvent {
  final Listing listing;
  const AddListing({required this.listing});
}
