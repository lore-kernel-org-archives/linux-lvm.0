Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mASNgkSv000406
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 18:42:46 -0500
Received: from web38305.mail.mud.yahoo.com (web38305.mail.mud.yahoo.com
	[209.191.125.21])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mASNgXd8009370
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 18:42:33 -0500
Date: Fri, 28 Nov 2008 15:42:33 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1021642943-1227915753=:93298"
Message-ID: <501191.93298.qm@web38305.mail.mud.yahoo.com>
Subject: [linux-lvm] building debug versions of lvm cli utilities
Reply-To: beachhangar@yahoo.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

--0-1021642943-1227915753=:93298
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I would like to know what the general procedure would be to create gdb (deb=
ug) versions of several LVM utilities - pvscan, pvdisplay.
=A0
I am using RH 4.7 and have the sources.
=A0
Can I use the kernel based on the distributed binaries?
=A0
compile=A0the sources and do a make with the appropriate options?
=A0
Then invoke the debug version of the utility with a dbg command?
=A0
=A0
Not sure if the utilities run in user or kernel space ?
=A0
Thanks,
Mike
=A0=0A=0A=0A      
--0-1021642943-1227915753=:93298
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;"><DIV>I would like to know what the general procedure would be to create gdb (debug) versions of several LVM utilities - pvscan, pvdisplay.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am using RH 4.7 and have the sources.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Can I use the kernel based on the distributed binaries?</DIV>
<DIV>&nbsp;</DIV>
<DIV>compile&nbsp;the sources and do a make with the appropriate options?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Then invoke the debug version of the utility with a dbg command?</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Not sure if the utilities run in user or kernel space ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>Mike</DIV>
<DIV>&nbsp;</DIV></td></tr></table><br>

      
--0-1021642943-1227915753=:93298--
