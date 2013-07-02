package instrumentation;

import soot.PackManager;
import soot.Transform;

public class Main {

	public static void main(String[] args) {
		Settings.initialiseSoot();
		
		PackManager.v().getPack("jtp").add(new Transform("jtp.myAnalysis", new MyBodyTransformer()));
		PackManager.v().runPacks();
		PackManager.v().writeOutput();
	}

}
