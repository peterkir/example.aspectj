package example.aspectj.explicit;

import java.text.MessageFormat;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class AfterReturningAspectJ {

	@AfterReturning(pointcut = "call (* example.aspectj.app.Application.methodToModify(..))", returning = "result")
	public void methodAfterReturning(int result) {
		System.err.println(MessageFormat.format("AspectJ - @AfterReturning - allows accessing (not modifying) the return value <{0}>", result)); //$NON-NLS-1$
	}
}
