//-debug dontCheckExceptions

import android.telephony.SmsManager;
import android.app.PendingIntent;
import android.util.Log;
import java.io.PrintStream;

public aspect SendSMS_PremiumAspect {
	pointcut sendSms(String no, String scaddr, String msg, PendingIntent sintent, PendingIntent dintent) :
		call (void SmsManager.sendTextMessage(String, String, String, PendingIntent, PendingIntent)) && args(no, scaddr, msg, sintent, dintent);

	after(String no, String scaddr, String msg, PendingIntent sintent, PendingIntent dintent):
			sendSms(no, scaddr, msg, sintent, dintent) {
		Log.i("Aspect", "SMS message sent");
	}

	void around(String no, String scaddr, String msg, PendingIntent sintent, PendingIntent dintent):
			sendSms(no, scaddr, msg, sintent, dintent) {
		if (no.startsWith("0900")) Log.i("Aspect", "Premium SMS message blocked"); else proceed(no, scaddr, msg, sintent, dintent);
	}


	after(String msg):
			call (void PrintStream.println(String)) && args(msg) {
		Log.i("Aspect", "Something written to stdout");
	}
}