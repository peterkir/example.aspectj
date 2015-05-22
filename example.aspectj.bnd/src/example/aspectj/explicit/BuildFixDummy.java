package example.aspectj.explicit;

/**
 * The ajdt compiler produces no result (or maybe is not called at all) if there
 * exist only aspects in this project (certainly a bug). This is a dummy class
 * that only exists in order to make the ajdt compiler compile the aspect
 * contained in this project.
 * 
 * http://stackoverflow.com/questions/26215640/how-to-enable-aspectj-compiler-in
 * -pluginexport-build
 */
class BuildFixDummy {

	private BuildFixDummy() {
		// not for usage
	}

}