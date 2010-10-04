Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o950sAKp016542
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 20:54:10 -0400
Received: from web120701.mail.ne1.yahoo.com (web120701.mail.ne1.yahoo.com
	[98.138.82.208])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o950ruWn026488
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 20:53:56 -0400
Message-ID: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
Date: Mon, 4 Oct 2010 16:55:28 -0700 (PDT)
From: Jay <jrharris19@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-158235981-1286236528=:97197"
Subject: [linux-lvm] LVM mirror questions
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0-158235981-1286236528=:97197
Content-Type: text/plain; charset=us-ascii

Hello,   

What happens to an lvm mirror if the disk log is lost ?   

I am having a hard time understanding Linux lvm ;  I created a mirror for my 
home system, two same-sized drives.    I decided to go for a mirror because I 
have too much space and I thought with the rash of failed hard drives I've had 
recently,  having a mirror would be ideal.     I had already installed my linux 
system, and I already had my /home filesystem in a single stripe/disk lv anyway, 
all I had to do was to add the other disk and lvcovert.    But it wouldn't work, 
saying I needed to add space on yet a third device for the log.   Either that, 
or I could keep the mirror log in memory.  Lvm would have to rebuild a 1TB 
mirror every time the system was rebooted if the log was left in memory.   That 
doesn't sound efficient.   So.   Put the log on disk.   I couldn't find an 
answer in man pages, but if the log is lost, then is the whole mirror lost ?   
That would mean to have the benefits of a mirror, the log would have to be at 
least as reliable as the mirror itself (or inconsequential).   

So, another mirror would have to be built of tiny size to hold the log, then 
lvconvert can be given something like -log disk /dev/vghuh/lvtiny, etc..

But then for the original mirror to be reliable, the second mirror would need a 
third mirror for the 2nd mirror's log.   Unless it is ok to leave the 2nd 
mirrors log in memory because it is so small.

What does everyone else do ?

Thank you in advance,
Jason Harris


      
--0-158235981-1286236528=:97197
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:'times new roman', 'new york', times, serif;font-size:12pt;color:#000000;"><div>Hello, &nbsp;&nbsp;</div><div><br></div><div>What happens to an lvm mirror if the disk log is lost ? &nbsp;&nbsp;</div><div><br></div><div>I am having a hard time understanding Linux lvm ; &nbsp;I created a mirror for my home system, two same-sized drives. &nbsp; &nbsp;I decided to go for a mirror because I have too much space and I thought with the rash of failed hard drives I've had recently, &nbsp;having a mirror would be ideal. &nbsp; &nbsp; I had already installed my linux system, and I already had my /home filesystem in a single stripe/disk lv anyway, all I had to do was to add the other disk and lvcovert. &nbsp; &nbsp;But it wouldn't work, saying I needed to add space on yet a third device for the log. &nbsp; Either that, or I could keep the mirror log in memory.
 &nbsp;Lvm would have to rebuild a 1TB mirror every time the system was rebooted if the log was left in memory. &nbsp; That doesn't sound efficient. &nbsp; So. &nbsp; Put the log on disk. &nbsp; I couldn't find an answer in man pages, but if the log is lost, then is the whole mirror lost ? &nbsp; That would mean to have the benefits of a mirror, the log would have to be at least as reliable as the mirror itself (or inconsequential). &nbsp;&nbsp;</div><div><br></div><div>So, another mirror would have to be built of tiny size to hold the log, then lvconvert can be given something like -log disk /dev/vghuh/lvtiny, etc..</div><div><br></div><div>But then for the original mirror to be reliable, the second mirror would need a third mirror for the 2nd mirror's log. &nbsp; Unless it is ok to leave the 2nd mirrors log in memory because it is so small.</div><div><br></div><div>What does everyone else do ?</div><div><br></div><div>Thank you in
 advance,</div><div>Jason Harris</div><div style="position:fixed"></div>


</div><br>

      </body></html>
--0-158235981-1286236528=:97197--
