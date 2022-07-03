import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_codigo5_museumapp/models/artist_model.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../models/cultural_property_model.dart';

class APIService{
  Logger logger = Logger();

  Future<List<MuseumModel>> getMuseums() async {
    try {
      //http://192.168.1.6:8000/API/museums/
      String _path = "http://192.168.1.6:8000/API/museum/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List museum = json.decode(source);
        List<MuseumModel> museumModelList =
        museum.map((e) => MuseumModel.fromJson(e)).toList();

        return museumModelList;
      }
      return [];
    } on TimeoutException catch (error) {
      return Future.error('Error: TimeoutException');
    } on SocketException catch (error) {
      return Future.error('Error: SocketException');
    } on FormatException catch (error) {
      return Future.error('Error: FormatException');
    }on Error catch(error) {
      return Future.error('Error');
    }
  }

  Future<List<ArtistModel>> getArtist() async {
    try {
      //http://192.168.1.6:8000/API/museums/
      String _path = "http://192.168.1.6:8000/API/artists/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List artist = json.decode(source);
        List<ArtistModel> artistModelList =
        artist.map((e) => ArtistModel.fromJson(e)).toList();

        return artistModelList;
      }
      return [];
    } on TimeoutException catch (error) {
      return Future.error('Error: TimeoutException');
    } on SocketException catch (error) {
      return Future.error('Error: SocketException');
    } on FormatException catch (error) {
      return Future.error('Error: FormatException');
    }on Error catch(error) {
      return Future.error('Error');
    }
  }

  Future<List<CulturalPropertyModel>> getCultualProperty() async {
    try {
      //http://192.168.1.6:8000/API/museums/
      String _path = "http://192.168.1.6:8000/API/cultural_property/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List cultural = json.decode(source);
        List<CulturalPropertyModel> culturalModelList =
        cultural.map((e) => CulturalPropertyModel.fromJson(e)).toList();

        return culturalModelList;
      }
      return [];
    } on TimeoutException catch (error) {
      return Future.error('Error: TimeoutException');
    } on SocketException catch (error) {
      return Future.error('Error: SocketException');
    } on FormatException catch (error) {
      return Future.error('Error: FormatException');
    }on Error catch(error) {
      return Future.error('Error');
    }
  }
}