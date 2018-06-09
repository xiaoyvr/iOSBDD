//
//  GameSpec.swift
//  iOSBDDTests
//
//  Created by Yu Xiaoqiang on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Quick
import Nimble

@testable import iOSBDD


class CabinetSpec: QuickSpec {
    override func spec() {

        // positive
        it("should store and return a ticket") {
            let cabinet = Cabinet(cap: 1)
            let ticket = cabinet.store()
            expect(ticket).toNot(beNil())
        }

        // negative
        it("should not store when cabinet is full") {
            let cabinet = Cabinet(cap: 1)
            _ = cabinet.store()

            let unit = cabinet.store()

            expect(unit).to(beNil())
        }

        // exception
        it("should throw exception when using a wrong ticket") {
            let cabinet = Cabinet(cap: 1)

            let wrongTicket = Ticket()

            expect{ try cabinet.pick(ticket: wrongTicket) }.to(raiseException())
        }

    }
}

class Ticket{

}


class Cabinet {

    init(cap: Int) {

    }
    func store() -> Ticket? {
        return Ticket()
    }

    func pick(ticket: Ticket) throws  {

    }
}
