part of 'listing_bloc.dart';

abstract class ListingState extends Equatable {
  final List<Listing> listings;
  const ListingState({required this.listings});

  @override
  List<Object> get props => [];
}

class ListingInitial extends ListingState {
  const ListingInitial({
    required super.listings,
  });
}

class ListingAdding extends ListingState {
  const ListingAdding({
    required super.listings,
  });
}

class ListingAdded extends ListingState {
  const ListingAdded({
    required super.listings,
  });
}

class ListingFailure extends ListingState {
  final String error;

  const ListingFailure(
    this.error, {
    required super.listings,
  });
}
