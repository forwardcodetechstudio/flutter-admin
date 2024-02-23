part of 'listing_bloc.dart';

sealed class ListingState extends Equatable {
  const ListingState();

  @override
  List<Object> get props => [];
}

final class ListingInitial extends ListingState {
  final List<Listing> listings;

  const ListingInitial({
    required this.listings,
  });
}
