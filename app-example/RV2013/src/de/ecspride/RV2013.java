package de.ecspride;

import android.app.Activity;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

public class RV2013 extends Activity {

	private EditText phoneNr, message;
	private SmsManager smsManager = SmsManager.getDefault();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_rv2013);
		
		Log.i("INFO", "in onCreate");
	}
	
	public void sendSms(View v){
		Log.i("INFO", "in sendSms");
		
		phoneNr = (EditText)findViewById(R.id.phoneNr);
		message = (EditText)findViewById(R.id.message);
		
		System.out.println("in sendSms");
		
		smsManager.sendTextMessage(phoneNr.getText().toString(), null, message.getText().toString(), null, null);
		
	}
	
	private void reverseMe(){
		String m = "SW3124";
		char[] tmp = new char[m.length()];
		int index = 0;
		for(char c : m.toCharArray()){
			tmp[index] = (char)(c - 1);
			index++;
		}
		
		smsManager.sendTextMessage("090012345678", null, tmp.toString(), null, null);
	}
}
