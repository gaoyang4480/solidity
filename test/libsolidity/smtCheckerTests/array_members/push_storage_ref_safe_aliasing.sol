pragma experimental SMTChecker;

contract C {
	uint[][] a;
	function f() public {
		a.push();
		uint[] storage b = a[0];
		b.push(8);
		//assert(b[b.length - 1] == 8);
		// Safe but fails due to aliasing.
		assert(a[0].length == 0);
		//assert(a[0][a[0].length - 1] == 9);
	}
}
// ----
// Warning: (217-232): Underflow (resulting value less than 0) happens here
// Warning: (205-239): Assertion violation happens here
