package example.aspectj.app;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;

@SuppressWarnings("nls")
public class Application implements IApplication {

	@Override
	public Object start(final IApplicationContext context) throws Exception {
		System.out.println("starting AspectJ Demo application");
		System.out.println("calling methodToModify with param <Hi RCP World!>");
		int returnValue = methodToModify("Hi RCP World!");
		System.out.println("Return value (without AspectJ its 0): " + returnValue);
		System.out.println("finished AspectJ Demo application");
		return IApplication.EXIT_OK;
	}

	@Override
	public void stop() {
		// nothing to do
	}

	int methodToModify(final String text) {
		System.out.println(text);
		return 0;
	}
}
