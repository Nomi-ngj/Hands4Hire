//
//  ServiceItem.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import Foundation

struct ServiceItem: Identifiable {
    let id: Int
    let title: String
    let imageName: String
    let type: HomeSection
    let description: String
    let overview: String // Brief overview of the service
    let expectedDuration: String // Estimated time to complete the service
    let costRange: String // Estimated cost range for the service
}

let allServices: [ServiceItem] = [
    ServiceItem(id: 1, title: "AC Repair", imageName: "ac_repair_icon", type: .homeRepairs, description: "Get your air conditioning unit fixed quickly and professionally.", overview: "Expert technicians will diagnose and repair your AC issues.", expectedDuration: "2-4 hours", costRange: "$100 - $300"),
    ServiceItem(id: 2, title: "Appliance Repair", imageName: "appliance_repair_icon", type: .homeRepairs, description: "Repair broken appliances like refrigerators, ovens, and more.", overview: "Fast and reliable appliance repair service for all major brands.", expectedDuration: "1-3 hours", costRange: "$80 - $250"),
    ServiceItem(id: 3, title: "Bathroom Cleaning", imageName: "bathroom_cleaning_icon", type: .cleaningServices, description: "Deep cleaning services for your bathroom, leaving it spotless.", overview: "Thorough cleaning of all surfaces, fixtures, and floors.", expectedDuration: "1-2 hours", costRange: "$50 - $100"),
    ServiceItem(id: 4, title: "Carpet Cleaning", imageName: "carpet_cleaning_icon", type: .cleaningServices, description: "Professional carpet cleaning services to remove dirt and stains.", overview: "Advanced cleaning methods to rejuvenate your carpets.", expectedDuration: "1-3 hours", costRange: "$80 - $200"),
    ServiceItem(id: 5, title: "Carpenter", imageName: "carpenter_icon", type: .homeRepairs, description: "Expert carpentry services for repairs and custom projects.", overview: "Skilled carpenters for custom furniture, repairs, and installations.", expectedDuration: "2-8 hours", costRange: "$100 - $500"),
    ServiceItem(id: 6, title: "Cleaner", imageName: "cleaner_icon", type: .categories, description: "Hire a professional cleaner to keep your home spotless.", overview: "Comprehensive cleaning services tailored to your needs.", expectedDuration: "2-4 hours", costRange: "$50 - $150"),
    ServiceItem(id: 7, title: "Deep Cleaning", imageName: "deep_cleaning_icon", type: .cleaningServices, description: "Comprehensive deep cleaning for your home or office.", overview: "In-depth cleaning to remove dirt, dust, and allergens.", expectedDuration: "4-6 hours", costRange: "$150 - $300"),
    ServiceItem(id: 8, title: "Disinfection", imageName: "disinfection_icon", type: .cleaningServices, description: "Disinfection services to ensure a clean and germ-free environment.", overview: "Professional disinfection to keep your space safe and healthy.", expectedDuration: "1-2 hours", costRange: "$100 - $200"),
    ServiceItem(id: 9, title: "Electrician", imageName: "electrician_icon", type: .categories, description: "Qualified electricians for all your electrical repair needs.", overview: "Experienced electricians for installations, repairs, and inspections.", expectedDuration: "1-4 hours", costRange: "$75 - $250"),
    ServiceItem(id: 10, title: "Gardener", imageName: "gardener_icon", type: .categories, description: "Professional gardening services to keep your garden beautiful.", overview: "Gardening services to maintain and enhance your outdoor space.", expectedDuration: "2-5 hours", costRange: "$50 - $150"),
    ServiceItem(id: 11, title: "Hairdresser", imageName: "hairdresser_icon", type: .categories, description: "Get a fresh look with professional hairdressing services.", overview: "Skilled hairdressers for cuts, styling, and treatments.", expectedDuration: "1-2 hours", costRange: "$30 - $100"),
    ServiceItem(id: 12, title: "Handyman", imageName: "handyman_icon", type: .homeRepairs, description: "General handyman services for a variety of home repairs.", overview: "One-stop solution for all your home maintenance needs.", expectedDuration: "1-6 hours", costRange: "$50 - $300"),
    ServiceItem(id: 13, title: "Home Cleaning", imageName: "home_cleaning_icon", type: .cleaningServices, description: "General cleaning services to keep your home clean and tidy.", overview: "Regular cleaning services tailored to your schedule.", expectedDuration: "2-4 hours", costRange: "$50 - $150"),
    ServiceItem(id: 14, title: "Locksmith", imageName: "locksmith_icon", type: .homeRepairs, description: "Fast and reliable locksmith services for lock-related issues.", overview: "Professional locksmith services for all your security needs.", expectedDuration: "1-2 hours", costRange: "$75 - $200"),
    ServiceItem(id: 15, title: "Mechanic", imageName: "mechanic_icon", type: .categories, description: "Automotive repair services for cars, motorcycles, and more.", overview: "Expert mechanics for diagnostics, repairs, and maintenance.", expectedDuration: "1-5 hours", costRange: "$50 - $400"),
    ServiceItem(id: 16, title: "Move-in/Move-out Cleaning", imageName: "move_in_move_out_cleaning_icon", type: .cleaningServices, description: "Thorough cleaning services for moving in or out of a property.", overview: "Cleaning services to prepare your home for new occupants.", expectedDuration: "3-6 hours", costRange: "$100 - $250"),
    ServiceItem(id: 17, title: "Mover", imageName: "mover_icon", type: .categories, description: "Professional moving services for a hassle-free relocation.", overview: "Full-service moving for a stress-free transition to your new home.", expectedDuration: "4-8 hours", costRange: "$200 - $800"),
    ServiceItem(id: 18, title: "Office Cleaning", imageName: "office_cleaning_icon", type: .cleaningServices, description: "Keep your office clean and professional with regular cleaning services.", overview: "Regular office cleaning services to maintain a tidy work environment.", expectedDuration: "2-4 hours", costRange: "$100 - $300"),
    ServiceItem(id: 19, title: "Painter", imageName: "painter_icon", type: .categories, description: "Hire professional painters for your home or office painting needs.", overview: "Skilled painters for interior and exterior projects.", expectedDuration: "2-5 hours", costRange: "$150 - $500"),
    ServiceItem(id: 20, title: "Pest Control", imageName: "pest_control_icon", type: .categories, description: "Get rid of unwanted pests with professional pest control services.", overview: "Comprehensive pest control solutions for your home or business.", expectedDuration: "1-2 hours", costRange: "$100 - $300"),
    ServiceItem(id: 21, title: "Plumber", imageName: "plumber_icon", type: .categories, description: "Licensed plumbers for fixing leaks, blockages, and installations.", overview: "Expert plumbing services for all your water-related issues.", expectedDuration: "1-3 hours", costRange: "$75 - $250"),
    ServiceItem(id: 22, title: "Post-Construction Cleaning", imageName: "post_construction_cleaning_icon", type: .cleaningServices, description: "Clean up after construction work with our post-construction cleaning services.", overview: "Thorough cleaning to remove dust and debris after construction.", expectedDuration: "3-6 hours", costRange: "$150 - $400"),
    ServiceItem(id: 23, title: "Roof Repair", imageName: "roof_repair_icon", type: .homeRepairs, description: "Professional roof repair services to fix leaks and damage.", overview: "Expert roof repair services to protect your home.", expectedDuration: "2-4 hours", costRange: "$150 - $500"),
    ServiceItem(id: 24, title: "Technician", imageName: "technician_icon", type: .categories, description: "Skilled technicians for a variety of technical repairs and services.", overview: "Qualified technicians for electronics and appliance repairs.", expectedDuration: "1-3 hours", costRange: "$75 - $200"),
    ServiceItem(id: 25, title: "Upholstery Cleaning", imageName: "upholstery_cleaning_icon", type: .cleaningServices, description: "Professional upholstery cleaning to make your furniture look new again.", overview: "Expert cleaning for all types of upholstery materials.", expectedDuration: "1-2 hours", costRange: "$100 - $300"),
    ServiceItem(id: 26, title: "Wall Repair", imageName: "wall_repair_icon", type: .homeRepairs, description: "Repair damaged walls and keep your home looking perfect.", overview: "Professional wall repair services for any type of damage.", expectedDuration: "1-3 hours", costRange: "$75 - $200"),
    ServiceItem(id: 27, title: "Window Cleaning", imageName: "window_cleaning_icon", type: .cleaningServices, description: "Get sparkling clean windows with our professional window cleaning services.", overview: "Expert window cleaning for a streak-free finish.", expectedDuration: "1-2 hours", costRange: "$50 - $150"),
    ServiceItem(id: 28, title: "Window Repair", imageName: "window_repair_icon", type: .homeRepairs, description: "Repair or replace damaged windows with our window repair services.", overview: "Professional window repair services to ensure security and efficiency.", expectedDuration: "2-4 hours", costRange: "$100 - $300")
]
