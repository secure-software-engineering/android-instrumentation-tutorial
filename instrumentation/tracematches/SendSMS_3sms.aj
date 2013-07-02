import android.telephony.SmsManager;
import android.app.PendingIntent;

public aspect SendSMS_3sms {
	void tracematch(String no, String scaddr, PendingIntent sintent, PendingIntent dintent) {
		sym sendSmsA after:
			call (void SmsManager.sendTextMessage(String, String, PendingIntent, PendingIntent)) && args(no, scaddr, sintent, dintent);
		sym sendSms around(no, scaddr, sintent, dintent):
			call (void SmsManager.sendTextMessage(String, String, PendingIntent, PendingIntent)) && args(no, scaddr, sintent, dintent);

		sendSmsA sendSmsA sendSmsA sendSms {
			throw new RuntimeException("Too many SMS messages");
		}
	}
}