//
//  StationInfoView.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI

struct StationInfoView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("047 Ofiar Dabai")
                .font(.system(size: 26).bold())
                .padding([.leading, .trailing], 10)
            HStack {
                Text("600m")
                    .font(.system(size: 14))
                Circle()
                    .fill(.gray)
                    .frame(width: 5, height: 5)
                Text("Bike Station")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.system(size: 14))
            }
            .padding([.leading, .trailing], 10)
            HStack {
                VStack(spacing: 5) {
                    Image(systemName: "bicycle")
                    Text("Available bikes")
                        .font(.system(size: 16))
                        .foregroundColor(.black.opacity(0.7))
                    Text("7")
                        .foregroundColor(.green)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                VStack(spacing: 5) {
                    Image(systemName: "server.rack")
                    Text("Available spaces")
                        .font(.system(size: 16))
                        .foregroundColor(.black.opacity(0.7))
                    Text("21")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
            }
            .padding([.top], 25)
        }
        .padding([.top, .bottom], 10)
    }
}
