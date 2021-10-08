
public aspect TraceAspect_Thorne {

	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace(){
		String info = thisJoinPointStaticPart.getSignature() +"," //
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println(info);
	}
	
	
	after(): methodToTrace(){
		
		System.out.println(thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
	
	
	
}