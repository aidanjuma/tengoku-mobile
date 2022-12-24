import 'dart:io';
import 'dart:async';

// Requests: Re-useable try-catch block for get requests.
Future makeGetRequest(Function request) async {
  try {
    return await request();
  } on SocketException catch (_) {
    throw 'Error whilst getting the data: no internet connection.';
  } on HttpException catch (_) {
    throw 'Error whilst getting the data: requested data could not be found.';
  } on FormatException catch (_) {
    throw 'Error whilst getting the data: bad format.';
  } on TimeoutException catch (_) {
    throw 'Error whilst getting the data: connection timed out.';
  } catch (err) {
    throw 'An error occurred whilst fetching the requested data: $err';
  }
}
