/// Cloudflare Consumer WARP MASQUE endpoint IPs already admitted by the
/// Rust automatic endpoint policy. The .2 hosts work with both H3 and H2.
/// These are Anycast endpoints; they do not guarantee a physical country.
const List<String> kFreeWarpEndpointCandidates = <String>[
  '162.159.198.2',
  '162.159.199.2',
  '2606:4700:103::2',
  '2606:4700:104::2',
];

const List<String> kPlusWarpEndpointCandidates = <String>[
  '162.159.199.2',
  '2606:4700:104::2',
];

/// Unknown entitlements deliberately use the narrower Plus-compatible pool,
/// matching EndpointPool::from_entitlement(None) in usque-core.
List<String> warpEndpointCandidates({required bool freeTier}) =>
    List<String>.unmodifiable(
      freeTier ? kFreeWarpEndpointCandidates : kPlusWarpEndpointCandidates,
    );
