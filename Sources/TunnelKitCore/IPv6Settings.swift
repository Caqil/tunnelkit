//
//  IPv6Settings.swift
//  TunnelKit
//
//  Created by Davide De Rosa on 5/19/19.
//  Copyright (c) 2023 Davide De Rosa. All rights reserved.
//
//  https://github.com/passepartoutvpn
//
//  This file is part of TunnelKit.
//
//  TunnelKit is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  TunnelKit is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with TunnelKit.  If not, see <http://www.gnu.org/licenses/>.
//

import Foundation

/// Encapsulates the IPv6 settings for the tunnel.
public struct IPv6Settings: Codable, Equatable, CustomStringConvertible {

    /// Represents an IPv6 route in the routing table.
    public struct Route: Codable, Hashable, CustomStringConvertible {

        /// The destination host or subnet.
        public let destination: String

        /// The address prefix length.
        public let prefixLength: UInt8

        /// The address of the gateway (falls back to global gateway).
        public let gateway: String?

        public init(_ destination: String, _ prefixLength: UInt8?, _ gateway: String?) {
            self.destination = destination
            self.prefixLength = prefixLength ?? 3
            self.gateway = gateway
        }

        // MARK: CustomStringConvertible

        public var description: String {
            "{\(destination.maskedDescription)/\(prefixLength) \(gateway?.maskedDescription ?? "*")}"
        }
    }

    /// The address.
    public let address: String

    /// The address prefix length.
    public let addressPrefixLength: UInt8

    /// The address of the default gateway.
    public let defaultGateway: String

    public init(address: String, addressPrefixLength: UInt8, defaultGateway: String) {
        self.address = address
        self.addressPrefixLength = addressPrefixLength
        self.defaultGateway = defaultGateway
    }

    // MARK: CustomStringConvertible

    public var description: String {
        "addr \(address)/\(addressPrefixLength) gw \(defaultGateway)"
    }
}
