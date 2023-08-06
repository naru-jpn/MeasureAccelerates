# MeasureAccelerates

Sample library to measure performance of calculation with Accelerate Framework and others.

## Measures

Measure *Average Time* of processing using `measure` method of XCTest.

**Environemnt**

Xcode 15.0 beta5 iOS Simulator (iPhone14) 

### 1. Add 1,000,000 float value pairs with 2 vectors.

| Accelerate | Others |
|:---:|:---:|
| 0.412ms | 170ms |

```swift
// Accelerate
vDSP_vadd(v1, 1, v2, 1, out, 1, vDSP_Length(length))

// Others
for i in 0..<length {
  out[i] = v1[i] + v2[i]
}
```

### 2. Multiple 1,000,000 float value pairs with 2 vectors.

| Accelerate | Others |
|:---:|:---:|
| 0.184ms | 164ms |

```swift
// Accelerate
vDSP_vmul(v1, 1, v2, 1, out, 1, vDSP_Length(length))

// Others
for i in 0..<length {
  out[i] = v1[i] * v2[i]
}
```

### 3. Subtract and take absolute value for 1,000,000 float value pairs with 2 vectors.

| Accelerate | Others |
|:---:|:---:|
| 0.757ms | 173ms |

```swift
// Accelerate
vDSP_vsub(v2, 1, v1, 1, out, 1, vDSP_Length(length))
vDSP_vabs(out, 1, out, 1, vDSP_Length(length))

// Others
for i in 0..<length {
  out[i] = abs(v1[i] - v2[i])
}
```

### 4. Add 1 only for even index for 1,000,000 values contained in a vectors.

| Accelerate | Others (whole loop) | Others (loop with stride) |
|:---:|:---:|:---:|
| 0.913ms | 175ms | 15.2ms |

```swift
// Accelerate
var value: Float = 1
vDSP_vsadd(v, 2, &value, out, 2, vDSP_Length(length / 2))

// Others (whole loop)
for i in 0..<length {
  if i % 2 == 0 {
    out[i] = v[i] + 1
  }
}

// Others (loop with stride)
for i in stride(from: 0, to: length, by: 2) {
  out[i] = v[i] + 1
}
```


