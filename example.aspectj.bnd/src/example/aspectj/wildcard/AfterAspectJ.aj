package example.aspectj.wildcard;

import java.text.MessageFormat;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class AfterAspectJ {

	@After("execution (* *.*(..))")
	public void afterMethods(JoinPoint joinPoint) {
		String signature = joinPoint.getSignature().getName();
		String joinedArgs = "";
		for (Object arg : joinPoint.getArgs()) {
			joinedArgs.concat(",").concat(arg.toString());
		}
		System.err.println(MessageFormat.format("AspectJ - @After method <{0}>, args: <{1}>", signature, joinedArgs)); //$NON-NLS-1$
	}

}
