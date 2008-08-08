Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m78153C7003189
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 21:05:03 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.251])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7814rxr021573
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 21:04:53 -0400
Received: by an-out-0708.google.com with SMTP id d31so142963and.124
	for <linux-lvm@redhat.com>; Thu, 07 Aug 2008 18:04:53 -0700 (PDT)
Message-ID: <f9d530070808071804s36f55963y504cdf0ccd73f00b@mail.gmail.com>
Date: Thu, 7 Aug 2008 18:04:52 -0700
From: unlisted <unlisted@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9978_26419578.1218157492962"
Subject: [linux-lvm] tps for block device vs lvm device
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_9978_26419578.1218157492962
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Why would I see 50x the amount of transactions on the lvm volume vs the
actual underlying block device ?

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00   11.41   57.07    0.00   31.51
Device:            tps    MB_read/s    MB_wrtn/s    MB_read    MB_wrtn
sda             211.33         0.00        56.12          0        113
sdb             268.47        63.05         0.00        128          0
dm-0          14365.52         0.00        56.11          0        113
dm-1              0.00         0.00         0.00          0          0
sdc               0.00         0.00         0.00          0          0
211 tps versus 14365 tps.  The box is idle and the following command was
running:

dd if=/dev/sdb of=/home/xxxxxxx/bigrandomfile.txt bs=4k count=10000000

Sam

------=_Part_9978_26419578.1218157492962
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr"><div>Why would I see 50x the amount of transactions on the lvm volume vs the actual underlying block device ?</div>
<div>&nbsp;</div>
<div>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice %system %iowait&nbsp; %steal&nbsp;&nbsp; %idle<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; 11.41&nbsp;&nbsp; 57.07&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; 31.51</div>
<div>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tps&nbsp;&nbsp;&nbsp; MB_read/s&nbsp;&nbsp;&nbsp; MB_wrtn/s&nbsp;&nbsp;&nbsp; MB_read&nbsp;&nbsp;&nbsp; MB_wrtn<br>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 211.33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 56.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 113<br>sdb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 268.47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 63.05&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
dm-0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14365.52&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 56.11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 113<br>dm-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>sdc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
</div>
<div>211 tps versus 14365 tps.&nbsp; The box is idle&nbsp;and the following command was running:</div>
<div>&nbsp;</div>
<div>dd if=/dev/sdb of=/home/xxxxxxx/bigrandomfile.txt bs=4k count=10000000</div>
<div><br>Sam</div></div>

------=_Part_9978_26419578.1218157492962--
