package me.zw.aop.step02.advice;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {

    @Pointcut("execution(* me.zw.aop.step02..*Impl.*(..))")
    public void allPointcut() {
    }

    @Pointcut("execution(* me.zw.aop.step02..*Impl.get*(..))")
    public void getPointcut() {
    }
}
