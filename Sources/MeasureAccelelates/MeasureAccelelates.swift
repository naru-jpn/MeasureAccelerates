import Foundation
import Accelerate

public class LoopExecutor {

    /// ```
    /// out[i] = v1[i] + v2[i]
    /// ```
    public func add_2v(
        v1: UnsafeMutablePointer<Float>,
        v2: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        for i in 0..<length {
            out[i] = v1[i] + v2[i]
        }
    }

    /// ```
    /// out[i] = v1[i] * v2[i]
    /// ```
    public func mul_2v(
        v1: UnsafeMutablePointer<Float>,
        v2: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        for i in 0..<length {
            out[i] = v1[i] * v2[i]
        }
    }

    /// ```
    /// out[i] = abs(v1[i] - v2[i])
    /// ```
    public func sub_abs_v2(
        v1: UnsafeMutablePointer<Float>,
        v2: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        for i in 0..<length {
            out[i] = abs(v1[i] - v2[i])
        }
    }

    /// ```
    /// out[i] = v[i] + 1 // if i is even
    ///        = v[i]     // if i is odd
    /// ```
    public func add1_only_even_index_loop_all(
        v: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        for i in 0..<length {
            if i % 2 == 0 {
                out[i] = v[i] + 1
            }
        }
    }

    /// ```
    /// out[i] = v[i] + 1 // if i is even
    ///        = v[i]     // if i is odd
    /// ```
    public func add1_only_even_index_loop_stride(
        v: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        for i in stride(from: 0, to: length, by: 2) {
            out[i] = v[i] + 1
        }
    }
}

public class AccelerateExecutor {
    /// ```
    /// out[i] = v1[i] + v2[i]
    /// ```
    public func add_2v(
        v1: UnsafeMutablePointer<Float>,
        v2: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        vDSP_vadd(v1, 1, v2, 1, out, 1, vDSP_Length(length))
    }

    /// ```
    /// out[i] = v1[i] * v2[i]
    /// ```
    public func mul_2v(
        v1: UnsafeMutablePointer<Float>,
        v2: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        vDSP_vmul(v1, 1, v2, 1, out, 1, vDSP_Length(length))
    }

    /// ```
    /// out[i] = abs(v1[i] - v2[i])
    /// ```
    public func sub_abs_v2(
        v1: UnsafeMutablePointer<Float>,
        v2: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        vDSP_vsub(v2, 1, v1, 1, out, 1, vDSP_Length(length))
        vDSP_vabs(out, 1, out, 1, vDSP_Length(length))
    }

    /// ```
    /// out[i] = v[i] + 1 // if i is even
    ///        = v[i]     // if i is odd
    /// ```
    public func add1_only_even_index(
        v: UnsafeMutablePointer<Float>,
        out: UnsafeMutablePointer<Float>,
        length: Int
    ) {
        var value: Float = 1
        vDSP_vsadd(v, 2, &value, out, 2, vDSP_Length(length / 2))
    }
}
