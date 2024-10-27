//
//  struct.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 19/10/2024.
//

import Foundation

// Assuming you have a ServiceProvider struct
struct ServiceProvider: Identifiable, Hashable, Codable {
    var id: Int
    var name: String
    var imageName: String
    var rating: Double // Rating for the provider
    var reviews: [Review]   // Number of reviews
    var services: [ServiceItem] // List of services they offer
    var hourlyRate: Double // Pricing info
    var phoneNumber: String
    var email: String
    var website: String?
    
    var workingDays: [Int] // Days of the week the provider works (1 = Sunday, 2 = Monday, ..., 7 = Saturday)
    var openTime: DateComponents // Time when the provider opens (e.g., 9:00 AM)
    var closeTime: DateComponents // Time when the provider closes (e.g., 6:00 PM)
    
    var isAvailable: Bool {
        // Get the current date and time
        let now = Date()
        let calendar = Calendar.current
        
        // Check if today is a working day
        let currentDay = calendar.component(.weekday, from: now) // 1 = Sunday, 7 = Saturday
        guard workingDays.contains(currentDay) else {
            return false
        }
        
        // Get the current time
        let currentTime = calendar.dateComponents([.hour, .minute], from: now)
        
        // Check if the current time is within open and close times
        if let currentHour = currentTime.hour, let currentMinute = currentTime.minute,
           let openHour = openTime.hour, let openMinute = openTime.minute,
           let closeHour = closeTime.hour, let closeMinute = closeTime.minute {
            
            let currentTotalMinutes = currentHour * 60 + currentMinute
            let openTotalMinutes = openHour * 60 + openMinute
            let closeTotalMinutes = closeHour * 60 + closeMinute
            
            return currentTotalMinutes >= openTotalMinutes && currentTotalMinutes <= closeTotalMinutes
        }
        
        return false
    }
}


extension ServiceProvider {
    static let serviceProviders: [ServiceProvider] = [
        ServiceProvider(
            id: 1,
            name: "Handy Solutions Co.",
            imageName: "handy_solutions_image",
            rating: 4.8,
            reviews: Review.mockReviews,
            services: allServices,
            hourlyRate: 50.0,
            phoneNumber: "555-1234",
            email: "contact@handysolutions.com",
            website: "https://handysolutions.com",
            workingDays: [2, 3, 4, 5, 6], // Monday to Friday
            openTime: DateComponents(hour: 9, minute: 0),  // Opens at 9:00 AM
            closeTime: DateComponents(hour: 18, minute: 0)  // Closes at 6:00 PM
        ),
        ServiceProvider(
            id: 2,
            name: "QuickFix Handyman",
            imageName: "quickfix_image",
            rating: 4.5,
            reviews: [Review.mockReviews[1],Review.mockReviews[2],Review.mockReviews[3]],
            services: [allServices[12], allServices[23], allServices[27]],
            hourlyRate: 45.0,
            phoneNumber: "555-5678",
            email: "service@quickfix.com",
            website: nil,
            workingDays: [2, 3, 4, 5, 6, 7], // Monday to Saturday
            openTime: DateComponents(hour: 8, minute: 0),  // Opens at 8:00 AM
            closeTime: DateComponents(hour: 17, minute: 0)  // Closes at 5:00 PM
        ),
        ServiceProvider(
            id: 3,
            name: "Reliable Repairs LLC",
            imageName: "reliable_repairs_image",
            rating: 4.9,
            reviews: [Review.mockReviews[4],Review.mockReviews[5],Review.mockReviews[6]],
            services: [allServices[0], allServices[9], allServices[21]],
            hourlyRate: 55.0,
            phoneNumber: "555-8765",
            email: "info@reliablerepairs.com",
            website: "https://reliablerepairs.com",
            workingDays: [1, 2, 3, 4, 5], // Sunday to Thursday
            openTime: DateComponents(hour: 10, minute: 0),  // Opens at 10:00 AM
            closeTime: DateComponents(hour: 19, minute: 0)  // Closes at 7:00 PM
        ),
        ServiceProvider(
            id: 4,
            name: "Home Helpers",
            imageName: "home_helpers_image",
            rating: 4.6,
            reviews: [Review.mockReviews[7],Review.mockReviews[8],Review.mockReviews[9]],
            services: [allServices[3], allServices[13], allServices[22]],
            hourlyRate: 40.0,
            phoneNumber: "555-4321",
            email: "support@homehelpers.com",
            website: nil,
            workingDays: [2, 3, 4, 5, 6], // Monday to Friday
            openTime: DateComponents(hour: 9, minute: 30),  // Opens at 9:30 AM
            closeTime: DateComponents(hour: 18, minute: 30)  // Closes at 6:30 PM
        ),
        ServiceProvider(
            id: 5,
            name: "Expert Assistance",
            imageName: "expert_assistance_image",
            rating: 4.7,
            reviews: [Review.mockReviews[0],Review.mockReviews[1],Review.mockReviews[2]],
            services: [allServices[2], allServices[5], allServices[20]],
            hourlyRate: 48.0,
            phoneNumber: "555-3456",
            email: "help@expertassistance.com",
            website: "https://expertassistance.com",
            workingDays: [1, 2, 3, 4, 5, 6], // Sunday to Friday
            openTime: DateComponents(hour: 8, minute: 30),  // Opens at 8:30 AM
            closeTime: DateComponents(hour: 17, minute: 30)  // Closes at 5:30 PM
        ),
        ServiceProvider(
            id: 6,
            name: "Clean Sweep Services",
            imageName: "clean_sweep_image",
            rating: 4.4,
            reviews: [Review.mockReviews[0],Review.mockReviews[1],Review.mockReviews[2]],
            services: [allServices[7], allServices[13], allServices[25]],
            hourlyRate: 42.0,
            phoneNumber: "555-2345",
            email: "info@cleansweep.com",
            website: nil,
            workingDays: [2, 3, 4, 5, 6, 7], // Monday to Saturday
            openTime: DateComponents(hour: 7, minute: 0),  // Opens at 7:00 AM
            closeTime: DateComponents(hour: 16, minute: 0)  // Closes at 4:00 PM
        ),
        ServiceProvider(
            id: 7,
            name: "FixIt All Solutions",
            imageName: "fixit_all_image",
            rating: 4.2,
            reviews: [Review.mockReviews[0],Review.mockReviews[1],Review.mockReviews[2]],
            services: [allServices[12], allServices[23], allServices[26]],
            hourlyRate: 38.0,
            phoneNumber: "555-9876",
            email: "support@fixitall.com",
            website: "https://fixitall.com",
            workingDays: [1, 2, 3, 4, 5], // Sunday to Thursday
            openTime: DateComponents(hour: 10, minute: 0),  // Opens at 10:00 AM
            closeTime: DateComponents(hour: 19, minute: 0)  // Closes at 7:00 PM
        ),
        ServiceProvider(
            id: 8,
            name: "Top Notch Cleaners",
            imageName: "top_notch_cleaners_image",
            rating: 4.3,
            reviews: [Review.mockReviews[0],Review.mockReviews[1],Review.mockReviews[2]],
            services: [allServices[3], allServices[22], allServices[13]],
            hourlyRate: 45.0,
            phoneNumber: "555-5432",
            email: "contact@topnotch.com",
            website: "https://topnotchcleaners.com",
            workingDays: [2, 3, 4, 5, 6], // Monday to Friday
            openTime: DateComponents(hour: 8, minute: 30),  // Opens at 8:30 AM
            closeTime: DateComponents(hour: 17, minute: 0)  // Closes at 5:00 PM
        ),
        ServiceProvider(
            id: 9,
            name: "All-Star Maintenance",
            imageName: "all_star_maintenance_image",
            rating: 4.6,
            reviews: [Review.mockReviews[0],Review.mockReviews[1],Review.mockReviews[2]],
            services: [allServices[5], allServices[20], allServices[26]],
            hourlyRate: 52.0,
            phoneNumber: "555-3210",
            email: "service@allstar.com",
            website: nil,
            workingDays: [1, 2, 3, 4, 5, 6], // Sunday to Friday
            openTime: DateComponents(hour: 9, minute: 0),  // Opens at 9:00 AM
            closeTime: DateComponents(hour: 18, minute: 0)  // Closes at 6:00 PM
        ),
        ServiceProvider(
            id: 10,
            name: "ProFix Services",
            imageName: "profix_services_image",
            rating: 4.8,
            reviews: [Review.mockReviews[0],Review.mockReviews[1],Review.mockReviews[2]],
            services: [allServices[0], allServices[9], allServices[19]],
            hourlyRate: 58.0,
            phoneNumber: "555-6789",
            email: "contact@profix.com",
            website: "https://profixservices.com",
            workingDays: [2, 3, 4, 5, 6], // Monday to Friday
            openTime: DateComponents(hour: 9, minute: 0),  // Opens at 9:00 AM
            closeTime: DateComponents(hour: 17, minute: 0)  // Closes at 5:00 PM
        )
    ]
}

