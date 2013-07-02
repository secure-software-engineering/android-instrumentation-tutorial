import java.lang.String;
import android.telephony.SmsManager;
import android.app.PendingIntent;
import android.util.Log;

public aspect SendSMS_Premium {
	void tracematch(String no) {
/*
		sym afterSendSms after: 
			call (void SmsManager.sendTextMessage(String, String, String, PendingIntent, PendingIntent)) && args(no, scaddr, msg, sintent, dintent);
		afterSendSms {
			System.out.println("SMS message sent");
		}
*/
		sym sendSms around(no): 
			call (void SmsManager.sendTextMessage(String, *)) && args(no, *);

		sendSms	{
			if (!no.startsWith("0900")) proceed(no);
		}

	}
}