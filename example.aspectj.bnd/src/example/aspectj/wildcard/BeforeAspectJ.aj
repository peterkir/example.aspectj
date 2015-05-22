package example.aspectj.wildcard;

import java.text.MessageFormat;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAspectJ {

	@Before("execution (* *.*(..))")
	public void beforeMethods(JoinPoint joinPoint) {
		String signature = joinPoint.getSignature().getName();
		String joinedArgs = "";
		for (Object arg : joinPoint.getArgs()) {
			joinedArgs.concat(",").concat(arg.toString());
		}
		System.err.println(MessageFormat.format("AspectJ - @Before method <{0}>, args: <{1}>", signature, joinedArgs)); //$NON-NLS-1$
	}
}
