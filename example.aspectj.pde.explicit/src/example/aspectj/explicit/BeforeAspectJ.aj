package example.aspectj.explicit;

import java.text.MessageFormat;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAspectJ {

	@Before("execution (* example.aspectj.app.Application.methodToModify(..))")
	public void methodBefore(JoinPoint joinPoint) {
		String signature = joinPoint.getSignature().getName();
		String joinedArgs = "";
		for (Object arg : joinPoint.getArgs()) {
			joinedArgs.concat(",").concat(arg.toString());
		}
		System.err
				.println(MessageFormat
						.format("AspectJ - " + joinPoint.getKind() + " - @Before method <{0}> args <{1}> - no arguments accessible - do something before the method", signature, joinedArgs)); //$NON-NLS-1$
	}
}
