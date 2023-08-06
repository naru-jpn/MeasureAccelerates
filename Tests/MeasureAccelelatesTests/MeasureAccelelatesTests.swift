import XCTest
@testable import MeasureAccelelates

final class MeasureAccelelatesTests: XCTestCase {
    let loopExecutor = LoopExecutor()
    let accelerateExecutor = AccelerateExecutor()

    // MARK: - Add

    func testAddLoop() throws {
        let length = 1_000_000
        let v1 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let v2 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v1.initialize(repeating: 10, count: length)
        v2.initialize(repeating: 20, count: length)

        measure {
            loopExecutor.add_2v(v1: v1, v2: v2, out: v1, length: length)
        }
    }

    func testAddAccelerate() throws {
        let length = 1_000_000
        let v1 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let v2 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v1.initialize(repeating: 10, count: length)
        v2.initialize(repeating: 20, count: length)

        measure {
            accelerateExecutor.add_2v(v1: v1, v2: v2, out: v1, length: length)
        }
    }

    // MARK: - Mul

    func testMulLoop() throws {
        let length = 1_000_000
        let v1 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let v2 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v1.initialize(repeating: 10, count: length)
        v2.initialize(repeating: 20, count: length)

        measure {
            loopExecutor.mul_2v(v1: v1, v2: v2, out: v1, length: length)
        }
    }

    func testMulAccelerate() throws {
        let length = 1_000_000
        let v1 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let v2 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v1.initialize(repeating: 10, count: length)
        v2.initialize(repeating: 20, count: length)

        measure {
            accelerateExecutor.mul_2v(v1: v1, v2: v2, out: v1, length: length)
        }
    }

    // MARK: - Sub Abs

    func testSubAbsLoop() throws {
        let length = 1_000_000
        let v1 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let v2 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v1.initialize(repeating: 10, count: length)
        v2.initialize(repeating: 20, count: length)

        measure {
            loopExecutor.sub_abs_v2(v1: v1, v2: v2, out: v1, length: length)
        }
    }

    func testSubAbsAccelerate() throws {
        let length = 1_000_000
        let v1 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let v2 = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v1.initialize(repeating: 10, count: length)
        v2.initialize(repeating: 20, count: length)

        measure {
            accelerateExecutor.sub_abs_v2(v1: v1, v2: v2, out: v1, length: length)
        }
    }

    // MARK: - Add 1 for only odd index

    func testAdd1OddLoopAll() throws {
        let length = 1_000_000
        let v = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v.initialize(repeating: 10, count: length)

        measure {
            loopExecutor.add1_only_even_index_loop_all(v: v, out: v, length: length)
        }
    }

    func testAdd1OddLoopStride() throws {
        let length = 1_000_000
        let v = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v.initialize(repeating: 10, count: length)

        measure {
            loopExecutor.add1_only_even_index_loop_stride(v: v, out: v, length: length)
        }
    }

    func testAdd1OddAccelerate() throws {
        let length = 1_000_000
        let v = UnsafeMutablePointer<Float>.allocate(capacity: length)
        v.initialize(repeating: 10, count: length)

        measure {
            accelerateExecutor.add1_only_even_index(v: v, out: v, length: length)
        }
    }
}
