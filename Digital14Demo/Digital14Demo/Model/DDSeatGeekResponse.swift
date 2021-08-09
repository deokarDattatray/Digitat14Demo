//
//  DDSeatGeek.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dDSeatGeekResponse = try? newJSONDecoder().decode(DDSeatGeekResponse.self, from: jsonData)

import Foundation

// MARK: - DDSeatGeekResponse
public class DDSeatGeekResponse: Codable {
    public var events: [DDEvent]?
    public var meta: DDMeta?
    public var inHand: DDInHand?

    enum CodingKeys: String, CodingKey {
        case events, meta
        case inHand = "in_hand"
    }

    public init(events: [DDEvent]?, meta: DDMeta?, inHand: DDInHand?) {
        self.events = events
        self.meta = meta
        self.inHand = inHand
    }
}

// MARK: - DDEvent
public class DDEvent: Codable {
    public var type: String?
    public var id: Int?
    public var datetimeUTC: String?
    public var venue: DDVenue?
    public var datetimeTbd: Bool?
    public var performers: [DDPerformer]?
    public var isOpen: Bool?
    public var links: [DDLink]?
    public var datetimeLocal: String?
    public var timeTbd: Bool?
    public var shortTitle, visibleUntilUTC: String?
    public var stats: DDEventStats?
    public var taxonomies: [DDTaxonomy]?
    public var url: String?
    public var score: Double?
    public var announceDate, createdAt: String?
    public var dateTbd: Bool?
    public var title: String?
    public var popularity: Double?
    public var eventDescription, status: String?
    public var accessMethod: DDAccessMethod?
    public var eventPromotion: String?
    public var announcements: DDAnnouncements?
    public var conditional: Bool?
    public var enddatetimeUTC: String?
    public var themes, domainInformation: [String]?

    public var isFavorite = false
    enum CodingKeys: String, CodingKey {
        case type, id
        case datetimeUTC = "datetime_utc"
        case venue
        case datetimeTbd = "datetime_tbd"
        case performers
        case isOpen = "is_open"
        case links
        case datetimeLocal = "datetime_local"
        case timeTbd = "time_tbd"
        case shortTitle = "short_title"
        case visibleUntilUTC = "visible_until_utc"
        case stats, taxonomies, url, score
        case announceDate = "announce_date"
//        case createdAt = "created_at"
        case dateTbd = "date_tbd"
        case title, popularity
        case eventDescription = "description"
        case status
//        case accessMethod = "access_method"
        case eventPromotion = "event_promotion"
        case announcements, conditional
        case enddatetimeUTC = "enddatetime_utc"
        case themes
        case domainInformation = "domain_information"
    }

    public init(type: String?, id: Int?, datetimeUTC: String?, venue: DDVenue?, datetimeTbd: Bool?, performers: [DDPerformer]?, isOpen: Bool?, links: [DDLink]?, datetimeLocal: String?, timeTbd: Bool?, shortTitle: String?, visibleUntilUTC: String?, stats: DDEventStats?, taxonomies: [DDTaxonomy]?, url: String?, score: Double?, announceDate: String?, createdAt: String?, dateTbd: Bool?, title: String?, popularity: Double?, eventDescription: String?, status: String?, accessMethod: DDAccessMethod?, eventPromotion: String?, announcements: DDAnnouncements?, conditional: Bool?, enddatetimeUTC: String?, themes: [String]?, domainInformation: [String]?) {
        self.type = type
        self.id = id
        self.datetimeUTC = datetimeUTC
        self.venue = venue
        self.datetimeTbd = datetimeTbd
        self.performers = performers
        self.isOpen = isOpen
        self.links = links
        self.datetimeLocal = datetimeLocal
        self.timeTbd = timeTbd
        self.shortTitle = shortTitle
        self.visibleUntilUTC = visibleUntilUTC
        self.stats = stats
        self.taxonomies = taxonomies
        self.url = url
        self.score = score
        self.announceDate = announceDate
        self.createdAt = createdAt
        self.dateTbd = dateTbd
        self.title = title
        self.popularity = popularity
        self.eventDescription = eventDescription
        self.status = status
        self.accessMethod = accessMethod
        self.eventPromotion = eventPromotion
        self.announcements = announcements
        self.conditional = conditional
        self.enddatetimeUTC = enddatetimeUTC
        self.themes = themes
        self.domainInformation = domainInformation
    }
    
    public init(){ }
}

// MARK: - DDAccessMethod
public class DDAccessMethod: Codable {
    public var method: String?
    public var createdAt: Date?
    public var employeeOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case method
//        case createdAt = "created_at"
        case employeeOnly = "employee_only"
    }

    public init(method: String?, createdAt: Date?, employeeOnly: Bool?) {
        self.method = method
        self.createdAt = createdAt
        self.employeeOnly = employeeOnly
    }
}

// MARK: - DDAnnouncements
public class DDAnnouncements: Codable {
    public var checkoutDisclosures: DDCheckoutDisclosures?

    enum CodingKeys: String, CodingKey {
        case checkoutDisclosures = "checkout_disclosures"
    }

    public init(checkoutDisclosures: DDCheckoutDisclosures?) {
        self.checkoutDisclosures = checkoutDisclosures
    }
}

// MARK: - DDCheckoutDisclosures
public class DDCheckoutDisclosures: Codable {
    public var messages: [DDMessage]?

    public init(messages: [DDMessage]?) {
        self.messages = messages
    }
}

// MARK: - DDMessage
public class DDMessage: Codable {
    public var text: String?

    public init(text: String?) {
        self.text = text
    }
}

// MARK: - DDLink
public class DDLink: Codable {
    public var id, provider: String?
    public var url: String?

    public init(id: String?, provider: String?, url: String?) {
        self.id = id
        self.provider = provider
        self.url = url
    }
}

// MARK: - DDPerformer
public class DDPerformer: Codable {
    public var type, name: String?
    public var image: String?
    public var id: Int?
    public var images: DDImages?
    public var divisions: String?
    public var hasUpcomingEvents, primary: Bool?
    public var stats: DDPerformerStats?
    public var taxonomies: [DDTaxonomy]?
    public var imageAttribution: String?
    public var url: String?
    public var score: Double?
    public var slug: String?
    public var homeVenueID: Int?
    public var shortName: String?
    public var numUpcomingEvents: Int?
    public var colors: [String]?
    public var imageLicense: String?
    public var popularity: Int?
    public var location: DDLocation?

    enum CodingKeys: String, CodingKey {
        case type, name, image, id, images, divisions
        case hasUpcomingEvents = "has_upcoming_events"
        case primary, stats, taxonomies
        case imageAttribution = "image_attribution"
        case url, score, slug
        case homeVenueID = "home_venue_id"
        case shortName = "short_name"
        case numUpcomingEvents = "num_upcoming_events"
        case colors
        case imageLicense = "image_license"
        case popularity, location
    }

    public init(type: String?, name: String?, image: String?, id: Int?, images: DDImages?, divisions: String?, hasUpcomingEvents: Bool?, primary: Bool?, stats: DDPerformerStats?, taxonomies: [DDTaxonomy]?, imageAttribution: String?, url: String?, score: Double?, slug: String?, homeVenueID: Int?, shortName: String?, numUpcomingEvents: Int?, colors: [String]?, imageLicense: String?, popularity: Int?, location: DDLocation?) {
        self.type = type
        self.name = name
        self.image = image
        self.id = id
        self.images = images
        self.divisions = divisions
        self.hasUpcomingEvents = hasUpcomingEvents
        self.primary = primary
        self.stats = stats
        self.taxonomies = taxonomies
        self.imageAttribution = imageAttribution
        self.url = url
        self.score = score
        self.slug = slug
        self.homeVenueID = homeVenueID
        self.shortName = shortName
        self.numUpcomingEvents = numUpcomingEvents
        self.colors = colors
        self.imageLicense = imageLicense
        self.popularity = popularity
        self.location = location
    }
    
    public init() {}
}

// MARK: - DDImages
public class DDImages: Codable {
    public var huge: String?

    public init(huge: String?) {
        self.huge = huge
    }
}

// MARK: - DDPerformerStats
public class DDPerformerStats: Codable {
    public var eventCount: Int?

    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }

    public init(eventCount: Int?) {
        self.eventCount = eventCount
    }
}

// MARK: - DDTaxonomy
public class DDTaxonomy: Codable {
    public var id: Int?
    public var name: String?
    public var parentID: Int?
    public var documentSource: DDDocumentSource?
    public var rank: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentID = "parent_id"
        case documentSource = "document_source"
        case rank
    }

    public init(id: Int?, name: String?, parentID: Int?, documentSource: DDDocumentSource?, rank: Int?) {
        self.id = id
        self.name = name
        self.parentID = parentID
        self.documentSource = documentSource
        self.rank = rank
    }
}

// MARK: - DDDocumentSource
public class DDDocumentSource: Codable {
    public var sourceType, generationType: String?

    enum CodingKeys: String, CodingKey {
        case sourceType = "source_type"
        case generationType = "generation_type"
    }

    public init(sourceType: String?, generationType: String?) {
        self.sourceType = sourceType
        self.generationType = generationType
    }
}

// MARK: - DDEventStats
public class DDEventStats: Codable {
    public var listingCount, averagePrice, lowestPriceGoodDeals, lowestPrice: Int?
    public var highestPrice, visibleListingCount, dqBucketCounts, medianPrice: Int?
    public var lowestSgBasePrice, lowestSgBasePriceGoodDeals: Int?

    enum CodingKeys: String, CodingKey {
        case listingCount = "listing_count"
        case averagePrice = "average_price"
        case lowestPriceGoodDeals = "lowest_price_good_deals"
        case lowestPrice = "lowest_price"
        case highestPrice = "highest_price"
        case visibleListingCount = "visible_listing_count"
//        case dqBucketCounts = "dq_bucket_counts"
        case medianPrice = "median_price"
        case lowestSgBasePrice = "lowest_sg_base_price"
        case lowestSgBasePriceGoodDeals = "lowest_sg_base_price_good_deals"
    }

    public init(listingCount: Int?, averagePrice: Int?, lowestPriceGoodDeals: Int?, lowestPrice: Int?, highestPrice: Int?, visibleListingCount: Int?, dqBucketCounts: Int?, medianPrice: Int?, lowestSgBasePrice: Int?, lowestSgBasePriceGoodDeals: Int?) {
        self.listingCount = listingCount
        self.averagePrice = averagePrice
        self.lowestPriceGoodDeals = lowestPriceGoodDeals
        self.lowestPrice = lowestPrice
        self.highestPrice = highestPrice
        self.visibleListingCount = visibleListingCount
        self.dqBucketCounts = dqBucketCounts
        self.medianPrice = medianPrice
        self.lowestSgBasePrice = lowestSgBasePrice
        self.lowestSgBasePriceGoodDeals = lowestSgBasePriceGoodDeals
    }
}

// MARK: - DDVenue
public class DDVenue: Codable {
    public var state, nameV2, postalCode, name: String?
    public var links: [DDLink]?
    public var timezone: String?
    public var url: String?
    public var score: Double?
    public var location: DDLocation?
    public var address, country: String?
    public var hasUpcomingEvents: Bool?
    public var numUpcomingEvents: Int?
    public var city, slug, extendedAddress: String?
    public var id, popularity: Int?
    public var accessMethod: DDAccessMethod?
    public var metroCode, capacity: Int?
    public var displayLocation: String?

    enum CodingKeys: String, CodingKey {
        case state
        case nameV2 = "name_v2"
        case postalCode = "postal_code"
        case name, links, timezone, url, score, location, address, country
        case hasUpcomingEvents = "has_upcoming_events"
        case numUpcomingEvents = "num_upcoming_events"
        case city, slug
        case extendedAddress = "extended_address"
        case id, popularity
//        case accessMethod = "access_method"
        case metroCode = "metro_code"
        case capacity
        case displayLocation = "display_location"
    }

    public init(state: String?, nameV2: String?, postalCode: String?, name: String?, links: [DDLink]?, timezone: String?, url: String?, score: Double?, location: DDLocation?, address: String?, country: String?, hasUpcomingEvents: Bool?, numUpcomingEvents: Int?, city: String?, slug: String?, extendedAddress: String?, id: Int?, popularity: Int?, accessMethod: DDAccessMethod?, metroCode: Int?, capacity: Int?, displayLocation: String?) {
        self.state = state
        self.nameV2 = nameV2
        self.postalCode = postalCode
        self.name = name
        self.links = links
        self.timezone = timezone
        self.url = url
        self.score = score
        self.location = location
        self.address = address
        self.country = country
        self.hasUpcomingEvents = hasUpcomingEvents
        self.numUpcomingEvents = numUpcomingEvents
        self.city = city
        self.slug = slug
        self.extendedAddress = extendedAddress
        self.id = id
        self.popularity = popularity
        self.accessMethod = accessMethod
        self.metroCode = metroCode
        self.capacity = capacity
        self.displayLocation = displayLocation
    }
    
    public init(){ }

}

// MARK: - DDLocation
public class DDLocation: Codable {
    public var lat, lon: Double?

    public init(lat: Double?, lon: Double?) {
        self.lat = lat
        self.lon = lon
    }
}

// MARK: - DDInHand
public class DDInHand: Codable {

    public init() {
    }
}

// MARK: - DDMeta
public class DDMeta: Codable {
    public var total, took, page, perPage: Int?
    public var geolocation: String?

    enum CodingKeys: String, CodingKey {
        case total, took, page
        case perPage = "per_page"
        case geolocation
    }

    public init(total: Int?, took: Int?, page: Int?, perPage: Int?, geolocation: String?) {
        self.total = total
        self.took = took
        self.page = page
        self.perPage = perPage
        self.geolocation = geolocation
    }
}
