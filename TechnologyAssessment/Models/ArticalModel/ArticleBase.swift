//
//	ArticleBase.swift

import Foundation

class ArticleBase : Codable {

	let copyright : String?
	let numResults : Int?
	let results : [ArticleResult]?
	let status : String?


	enum CodingKeys: String, CodingKey {
		case copyright = "copyright"
		case numResults = "num_results"
		case results = "results"
		case status = "status"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright) ?? String()
		numResults = try values.decodeIfPresent(Int.self, forKey: .numResults) ?? Int()
		results = try values.decodeIfPresent([ArticleResult].self, forKey: .results) ?? [ArticleResult]()
		status = try values.decodeIfPresent(String.self, forKey: .status) ?? String()
	}


}
