package me.zw.step01.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {

    @Pointcut("execution(* me.zw.step01..*Impl.*(..))")
    public void allPointcut(){
    }

    @Before("allPointcut()")
    public void beforeLog(JoinPoint joinPoint) {
        String method = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();

        System.out.println("[사전 처리] " + method + "() 메서드 args 정보: " + args[0].toString());
    }
}