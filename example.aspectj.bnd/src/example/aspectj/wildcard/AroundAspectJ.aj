package example.aspectj.wildcard;

import java.text.MessageFormat;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class AroundAspectJ {

	@Around("execution (* *.*(..))")
	public Object aroundMethods(ProceedingJoinPoint joinPoint) throws Throwable {
		String signature = joinPoint.getSignature().getName();
		String joinedArgs = "";
		for (Object arg : joinPoint.getArgs()) {
			joinedArgs.concat(",").concat(arg.toString());
		}
		System.err.println(MessageFormat.format(
				"AspectJ - @Around pre  method <{0}>, args: <{1}>", signature, joinedArgs)); //$NON-NLS-1$
		Object returnValue = joinPoint.proceed();
		System.err
				.println(MessageFormat
						.format("AspectJ - @Around post method <{0}>, args: <{1}>, return value: <{2}>", signature, joinedArgs, returnValue)); //$NON-NLS-1$
		return null;
	}

}
