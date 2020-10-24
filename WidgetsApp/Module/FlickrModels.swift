//
//  FlickrModels.swift
//  WidgetsApp
//
//  Created by Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

struct FlickrPhotos: Decodable {

	var photos: FlickrPhoto
}

struct FlickrPhoto: Decodable {

	var photo: [FlickrImage]
}

struct FlickrImage: Decodable {

	var id: String
	var owner: String
	var secret: String
	var server: String
}
