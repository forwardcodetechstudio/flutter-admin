import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_admin/features/tables/data.dart';
import 'package:flutter_admin/features/tables/models/listing.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc() : super(ListingInitial(listings: dummyListings)) {
    on<AddListing>((event, emit) {
      emit(ListingInitial(
        listings: [
          ...(state as ListingInitial).listings,
          event.listing,
        ],
      ));
    });
  }
}
