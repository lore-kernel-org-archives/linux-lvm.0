Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5JM0tg3000969
	for <linux-lvm@redhat.com>; Mon, 19 Jun 2006 18:00:55 -0400
Received: from web50410.mail.yahoo.com (web50410.mail.yahoo.com
	[206.190.38.245])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k5JM0lfY010560
	for <linux-lvm@redhat.com>; Mon, 19 Jun 2006 18:00:48 -0400
Message-ID: <20060619220042.32483.qmail@web50410.mail.yahoo.com>
Date: Mon, 19 Jun 2006 15:00:42 -0700 (PDT)
From: Slava Mikerin <slava_mikerin@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-643106834-1150754442=:30970"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vm i/o error
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

--0-643106834-1150754442=:30970
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
 i am using lvm 2 with and having problems with home partition. when i try activating my vg group "playbox" i get an error:
   Code:
  
vgchange -ay
  /dev/evms/lvm2/playbox/home: read failed after 0 of 4096 at 0: Input/output error
  /dev/playbox/home: read failed after 0 of 4096 at 0: Input/output error
  7 logical volume(s) in volume group "playbox" now active

 
 i tried 
   Code:
  
e2fsck /dev/playbox/home
e2fsck 1.38 (30-Jun-2005)
e2fsck: Attempt to read block from filesystem resulted in short read while trying to open /dev/playbox/home
Could this be a zero-length partition?

 
 can anyone please help me recover my partition  
 thanks alot
 slava
--0-643106834-1150754442=:30970
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,<br> i am using lvm 2 with and having problems with home partition. when i try activating my vg group "playbox" i get an error:<br> <div style="margin: 5px 20px 20px;">  <div class="smallfont" style="margin-bottom: 2px;">Code:</div>  <pre class="alt2" style="border: 1px inset ; margin: 0px; padding: 6px; overflow: auto; width: 640px; height: 82px;"><div dir="ltr" style="text-align: left;">vgchange -ay<br>  /dev/evms/lvm2/playbox/home: read failed after 0 of 4096 at 0: Input/output error<br>  /dev/playbox/home: read failed after 0 of 4096 at 0: Input/output error<br>  7 logical volume(s) in volume group "playbox" now active</div></pre> </div> i tried <br> <div style="margin: 5px 20px 20px;">  <div class="smallfont" style="margin-bottom: 2px;">Code:</div>  <pre class="alt2" style="border: 1px inset ; margin: 0px; padding: 6px; overflow: auto; width: 640px; height: 82px;"><div dir="ltr" style="text-align: left;">e2fsck /dev/playbox/home<br>e2fsck 1.38
 (30-Jun-2005)<br>e2fsck: Attempt to read block from filesystem resulted in short read while trying to open /dev/playbox/home<br>Could this be a zero-length partition?</div></pre> </div> can anyone please help me recover my partition <img src="http://ubuntuforums.org/images/smilies/confused.gif" alt="" title="Confused" class="inlineimg" border="0"> <br> thanks alot<br> slava
--0-643106834-1150754442=:30970--
