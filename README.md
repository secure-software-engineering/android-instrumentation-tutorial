android-instrumentation-tutorial
================================
Program instrumentation is a widely used mechanism in different software engineering areas. 
It can be used for creating profilers and debuggers, for detecting programming errors at runtime, or for securing programs through inline reference monitoring.
This is a tutorial on instrumenting Android applications using Soot and the AspectBench compiler (abc). We show how two well- known monitoring 
languages –Tracematches and AspectJ– can be used for instrumenting Android applications. Furthermore, we also describe the more flexible approach of manual 
imperative instrumentation directly using Soot’s intermediate representation Jimple. In all three cases no source code of the target application is required.

Directory structure:
- app-example: contains an Android application that can be used for instrumentation purpose
- instrumentation:
	* aspectj: aspectj instrumentation
	* manual-instrumentation: source-code for manual instrumentation based on Soot
	* tracematches: tracematches instrumentation
- slidesAndTutorial: contains the slides of our tutorial and the corresponding tutorial (paper)