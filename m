Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB5F90kr018301
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 10:09:04 -0500
Received: from web38304.mail.mud.yahoo.com (web38304.mail.mud.yahoo.com
	[209.191.125.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mB5F63FZ009626
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 10:06:32 -0500
Date: Fri, 5 Dec 2008 07:06:03 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-731663886-1228489563=:8018"
Message-ID: <405732.8018.qm@web38304.mail.mud.yahoo.com>
Subject: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
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

--0-731663886-1228489563=:8018
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Earlier attempts at being able to get a storage based snapshot on the same =
server as its master failed because -
- the master is always mounted (production)
- the utilities recognize both master and snap and declare duplicate
- manual edits of the header and label field failed because both are "wrapp=
ed" with CRC that is calculated and checked by the utilities
=A0
I have found the appropriate sections of the source where the header and la=
bel are checked and CRC calc'd.
=A0
Are there any lvm developers on the list that could advise best way to carv=
e up a utility to perform these changes=A0 - pv uuid, lv uuid, vg name,...=
=A0=20
=A0
Thanks,
Mike
=A0=0A=0A=0A      
--0-731663886-1228489563=:8018
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;"><DIV>Earlier attempts at being able to get a storage based snapshot on the same server as its master failed because -</DIV>
<DIV>- the master is always mounted (production)</DIV>
<DIV>- the utilities recognize both master and snap and declare duplicate</DIV>
<DIV>- manual edits of the header and label field failed because both are "wrapped" with CRC that is calculated and checked by the utilities</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have found the appropriate sections of the source where the header and label are checked and CRC calc'd.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Are there any lvm developers on the list that could advise best way to carve up a utility to perform these changes&nbsp; - pv uuid, lv uuid, vg name,...&nbsp; </DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>Mike</DIV>
<DIV>&nbsp;</DIV></td></tr></table><br>

      
--0-731663886-1228489563=:8018--
