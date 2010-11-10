Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAAGqdIl005707
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 11:52:39 -0500
Received: from ecollab3.amat.com (ecollab3.amat.com [152.135.148.11])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAGqO0A019103
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 11:52:24 -0500
MIME-Version: 1.0
From: Matt_Murdock@amat.com
Message-ID: <OF27444FD0.DB7A9C66-ON872577D7.005C505D-872577D7.005CB030@amat.com>
Date: Wed, 10 Nov 2010 10:52:24 -0600
Content-Type: multipart/alternative;
	boundary="=_alternative 005CA07B872577D7_="
Subject: [linux-lvm] owner and group being reset back to root
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

This is a multipart message in MIME format.
--=_alternative 005CA07B872577D7_=
Content-Type: text/plain; charset="US-ASCII"

        Not sure if the cluster logical volume manager is a seperate group 
list or not, but, when a volume group is imported in a clustered 
environment, on RHEL 5.5 Enterprise w/cluster suite, the previously set 
permissions get reset back to root/root. 
        I understand this is a bug in the CLVMD, but was wondering the 
status of a fix for this. Anyone?


Matthew Murdock
Server Systems Admin III
Applied Materials
5245 W. Yeager Rd. Suite #100
Salt Lake City, UT 84116
(801) 736-3340
Applied Direct Dial - 63340
Helpdesk URL - http://rem-amat2/MASTechnicalSupport
The content of this message is Applied Materials Confidential.  If you are 
not the intended recipient and have received this message in error, any 
use or distribution is prohibited.  Please notify me immediately by reply 
e-mail and delete this message from your computer system.  Thank you.

Save paper and trees!  Please consider the environment before printing 
this e-mail.
--=_alternative 005CA07B872577D7_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Not
sure if the cluster logical volume manager is a seperate group list or
not, but, when a volume group is imported in a clustered environment, on
RHEL 5.5 Enterprise w/cluster suite, the previously set permissions get
reset back to root/root. </font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; I
understand this is a bug in the CLVMD, but was wondering the status of
a fix for this. Anyone?</font>
<br>
<br>
<br><font size=2 face="sans-serif">Matthew Murdock<br>
Server Systems Admin III<br>
Applied Materials<br>
5245 W. Yeager Rd. Suite #100<br>
Salt Lake City, UT 84116<br>
(801) 736-3340<br>
Applied Direct Dial - 63340<br>
Helpdesk URL - http://rem-amat2/MASTechnicalSupport<br>
The content of this message is Applied Materials Confidential. &nbsp;If
you are not the intended recipient and have received this message in error,
any use or distribution is prohibited. &nbsp;Please notify me immediately
by reply e-mail and delete this message from your computer system. &nbsp;Thank
you.<br>
<br>
Save paper and trees! &nbsp;Please consider the environment before printing
this e-mail.</font>
--=_alternative 005CA07B872577D7_=--
