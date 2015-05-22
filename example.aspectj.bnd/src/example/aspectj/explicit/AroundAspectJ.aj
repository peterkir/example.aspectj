package example.aspectj.explicit;

import java.text.MessageFormat;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AroundAspectJ {

	@Pointcut("call (* example.aspectj.app.Application.methodToModify(..)) && args(text)")
	void setText(String text) {
	};

	@Around("setText(text)")
	public int methodAround(ProceedingJoinPoint joinPoint, String text) throws Throwable {
		int newReturnValue = 99;
		System.err.println("AspectJ - " + joinPoint.getKind() + " - @Around method begin: replacing in argument 'RCP' with 'AspectJ (formerly RCP)'"); //$NON-NLS-1$
		Object proceed = joinPoint.proceed(new Object[] { text.replace("RCP", "AspectJ (formerly RCP)") });
		System.err.println(MessageFormat.format("AspectJ - @Around method end: changing return value from <{0}> to <{1}>", proceed, newReturnValue)); //$NON-NLS-1$
		return newReturnValue;
	}

}
