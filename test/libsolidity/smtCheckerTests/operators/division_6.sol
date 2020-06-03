pragma experimental SMTChecker;
contract C {
	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
		if (a == 0) {
			return 0;
		}
		// TODO remove when SMTChecker sees that this code is the `else` of the `return`.
		require(a != 0);
		uint256 c = a * b;
		require(c / a == b);
		return c;
	}
}
// ----
// Warning: (265-270): Error trying to invoke SMT solver.
// Warning: (282-292): Condition is always true.
// Warning: (265-270): Overflow (resulting value larger than 2**256 - 1) happens here
