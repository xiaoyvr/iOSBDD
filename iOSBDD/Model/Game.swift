import Foundation

class Treasure : Hashable {
    var hashValue: Int = 0

    static func == (lhs: Treasure, rhs: Treasure) -> Bool {
        return true
    }
}
class Score{
    var player: String
    init(player: String, value: Int) {
        self.player = player
    }
    func setScore(score: Int) {

    }
}
class Attempt {
    var distance : Int = 0
}

class Game {
    private var attempts  = [Treasure: Attempt]()
    static var GAME_VERSION = 1
    private var _score: Score

    var ended = false

    init() {
        _score = Score(player: "", value: 0);
    }

    var score : Score {
        _score.setScore(score: calculateScore())
        return _score
    }



    func setPlayer( player: String) {
        score.player = player;
    }

    var player :String {
        return score.player
    }

    var treasures : [Treasure] {
        get {
            return Array(attempts.keys)
        }
        set(treasures) {
            attempts.removeAll()
            for treasure in treasures {
                attempts[treasure] = nil
            }
        }
    }

    func getAttempt (treasure: Treasure) -> Attempt? {
        return attempts[treasure]
    }

    func getAttempts () -> [Attempt] {
        return Array(attempts.values)
    }


    func recordAttempt (treasure: Treasure , attempt : Attempt) -> Int {
        let currentBestAttempt = getAttempt(treasure: treasure)
        var difference = Int.max;
        if let dis =  currentBestAttempt?.distance {
            difference = dis - attempt.distance;
        }
        if (difference >= 0) {
            attempts[treasure] = attempt
        }
        return difference
    }

    func hasPreviouslyAttemptedTreasure(treasure : Treasure) -> Bool {
        return (getAttempt(treasure: treasure) != nil)
    }

    var hasNoTreasures : Bool {
        return attempts.isEmpty
    }

    private func calculateScore() -> Int {
        let attempts = getAttempts()
        var totalScore = 0
        for attempt in attempts {
            totalScore += max(1000 - attempt.distance, 0);
        }
        let treasureCount = treasures.count;
        return treasureCount == 0 ? 0 :  totalScore / treasureCount;
    }

    func end() {
        ended = true;
    }
}
