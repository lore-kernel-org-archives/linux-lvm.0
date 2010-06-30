Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5UKYxRY027741
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2010 16:34:59 -0400
Received: from web120413.mail.ne1.yahoo.com (web120413.mail.ne1.yahoo.com
	[98.138.85.220])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o5UKYmFZ026689
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2010 16:34:49 -0400
Message-ID: <180678.70848.qm@web120413.mail.ne1.yahoo.com>
Date: Wed, 30 Jun 2010 13:34:48 -0700 (PDT)
From: Philippe Cerfon <philcerf@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-584773965-1277930088=:70848"
Subject: [linux-lvm] when to vgscan/pvscan/lvscan
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

--0-584773965-1277930088=:70848
Content-Type: text/plain; charset=us-ascii

Hi.

(Talking always about lvm2...)

Is there a real technical difference between pvscan, vgscan and lvscan?
I mean as far as I understand one always needs all information about
PVs,VGs and LVs in order to get the later.
So apart from different textual "debug" output, do all the same, i.e.
scanning over all configured block devices, looking for PVs and
scanning their VG-descriptors in order to get the information about al
LVs?


Is there ever the need to rund pvscan/vgscan/lvscan manually and if so
in which cases? I mean the vgscan manpage says that this happens
automatically in lvm2, so if I e.g. have my init-scripts and want to
make the LVs available, is it generally enough to do
vgchange -an
or can there be cases when the preceding vgscan is still required?


Thanks,
Philippe.


      
--0-584773965-1277930088=:70848
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;"><span class="Apple-style-span" style="font-family: arial, sans-serif; font-size: 10px; border-collapse: collapse; ">Hi.<br><br>(Talking always about lvm2...)<br><br>Is there a real technical difference between pvscan, vgscan and lvscan?<br>I mean as far as I understand one always needs all information about<br>PVs,VGs and LVs in order to get the later.<br>So apart from different textual "debug" output, do all the same, i.e.<br>scanning over all configured block devices, looking for PVs and<br>scanning their VG-descriptors in order to get the information about al<br>LVs?<br><br><br>Is there ever the need to rund pvscan/vgscan/lvscan manually and if so<br>in which cases? I mean the vgscan manpage says that this happens<br>automatically in lvm2, so if I e.g. have my init-scripts and want to<br>make the LVs available, is it generally enough to do<br>vgchange
 -an<br>or can there be cases when the preceding vgscan is still required?<br><br><br>Thanks,<br><font color="#888888">Philippe.</font></span></td></tr></table><br>

      
--0-584773965-1277930088=:70848--
