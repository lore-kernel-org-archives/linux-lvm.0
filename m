Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1SF928E001961
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2009 10:09:02 -0500
Received: from hermes1.cf.ac.uk (hermes1.cf.ac.uk [131.251.0.112])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1SF8i6H026043
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2009 10:08:45 -0500
Received: from mdomsmp02.cf.ac.uk ([10.255.228.31])
	by hermes1.cf.ac.uk with esmtp (Exim 4.69)
	(envelope-from <Rees@cardiff.ac.uk>) id 1LdQo0-0006oc-C5
	for linux-lvm@redhat.com; Sat, 28 Feb 2009 15:08:44 +0000
MIME-Version: 1.0
From: Lyn Rees <Rees@cardiff.ac.uk>
Message-ID: <OFC63CB88B.451A38A4-ON8025756B.005311F0-8025756B.00532FC0@cardiff.ac.uk>
Date: Sat, 28 Feb 2009 15:08:37 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 00532F088025756B_="
Subject: [linux-lvm] LVM iostat readings
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

This is a multipart message in MIME format.
--=_alternative 00532F088025756B_=
Content-Type: text/plain; charset="US-ASCII"

Hi,

I've had a good look around for answers but found nothing useful.

I've collected data using iostat from a production server. I've got 3 
disks stitched together as a linear LVM, 250GB+500GB+500GB, with data on 
only the first 2 disks at the moment.

Under load, the PV's get busy showing high utilisation (%util) and quite 
high queue depths (avgqu-sz). the LV however hits 100% utilisation and the 
queue depth gets huge! Performance becomes poor at these times, suggesting 
the values are representative of what is actually happening.

Can someone help me understand what's going on here please? Could LVM be 
causing a bottleneck, or is a physical bottleneck causing this?

Thanks,
Lyn Rees.
--------------------------------------------------
Mr Lyn Rees
Senior Engineer, UIG
Information Services Computing Centre
Cardiff University, 40-41 Park Place,
Cardiff. CF10 3BB.
--------------------------------------------------
Contact numbers:
 (029) 2087 9188 (direct)
 (029) 2087 4875 (reception)
 (029) 2087 4285 (fax)
--------------------------------------------------
Email: rees@cardiff.ac.uk
Web: www.cardiff.ac.uk
--=_alternative 00532F088025756B_=
Content-Type: text/html; charset="US-ASCII"

<font size=2 face="sans-serif">Hi,</font>
<br>
<br><font size=2 face="sans-serif">I've had a good look around for answers
but found nothing useful.</font>
<br>
<br><font size=2 face="sans-serif">I've collected data using iostat from
a production server. I've got 3 disks stitched together as a linear LVM,
250GB+500GB+500GB, with data on only the first 2 disks at the moment.</font>
<br>
<br><font size=2 face="sans-serif">Under load, the PV's get busy showing
high utilisation (%util) and quite high queue depths (avgqu-sz). the LV
however hits 100% utilisation and the queue depth gets huge! Performance
becomes poor at these times, suggesting the values are representative of
what is actually happening.</font>
<br>
<br><font size=2 face="sans-serif">Can someone help me understand what's
going on here please? Could LVM be causing a bottleneck, or is a physical
bottleneck causing this?</font>
<br>
<br><font size=2 face="sans-serif">Thanks,</font>
<br><font size=2 face="sans-serif">Lyn Rees.</font>
<br><font size=2 face="sans-serif">
--------------------------------------------------<br>
Mr Lyn Rees<br>
Senior Engineer, UIG<br>
Information Services Computing Centre<br>
Cardiff University, 40-41 Park Place,<br>
Cardiff. CF10 3BB.<br>
--------------------------------------------------<br>
Contact numbers:<br>
 (029) 2087 9188 (direct)<br>
 (029) 2087 4875 (reception)<br>
 (029) 2087 4285 (fax)<br>
--------------------------------------------------<br>
Email: rees@cardiff.ac.uk<br>
Web: </font><a href=www.cardiff.ac.uk><font size=2 face="sans-serif">www.cardiff.ac.uk</font></a>
--=_alternative 00532F088025756B_=--
