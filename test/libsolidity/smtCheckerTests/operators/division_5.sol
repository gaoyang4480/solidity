pragma experimental SMTChecker;
contract C {
	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
		uint256 c;
		if (a != 0) {
			c = a * b;
			require(c / a == b);
		}
		return c;
	}
}
// ----
// Warning: (151-156): Error trying to invoke SMT solver.
// Warning: (151-156): Overflow (resulting value larger than 2**256 - 1) happens here
