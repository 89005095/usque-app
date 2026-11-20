import 'package:flutter_test/flutter_test.dart';
import 'package:usque/core/warp_endpoint_candidates.dart';

void main() {
  test('free WARP exposes the shared and free endpoint pools', () {
    expect(
      warpEndpointCandidates(freeTier: true),
      equals(kFreeWarpEndpointCandidates),
    );
    expect(kFreeWarpEndpointCandidates, contains('162.159.198.2'));
    expect(kFreeWarpEndpointCandidates, contains('2606:4700:103::2'));
  });

  test('Plus and unknown entitlements use only the Plus-compatible pool', () {
    expect(
      warpEndpointCandidates(freeTier: false),
      equals(kPlusWarpEndpointCandidates),
    );
    expect(kPlusWarpEndpointCandidates, isNot(contains('162.159.198.2')));
    expect(kPlusWarpEndpointCandidates, isNot(contains('2606:4700:103::2')));
  });

  test('all quick-pick addresses are unique and parse as IP literals', () {
    for (final candidates in [
      kFreeWarpEndpointCandidates,
      kPlusWarpEndpointCandidates,
    ]) {
      expect(candidates.toSet().length, candidates.length);
      for (final address in candidates) {
        expect(
          address.contains(':') ||
              RegExp(r'^\d{1,3}(?:\.\d{1,3}){3}
          isTrue,
        );
      }
    }
  });
}
).hasMatch(address),
          isTrue,
        );
      }
    }
  });
}
