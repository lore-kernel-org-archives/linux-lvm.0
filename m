Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n25EJkgd025526
	for <linux-lvm@redhat.com>; Thu, 5 Mar 2009 09:19:46 -0500
Received: from hermes1.cf.ac.uk (hermes1.cf.ac.uk [131.251.0.112])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n25EJRl3012937
	for <linux-lvm@redhat.com>; Thu, 5 Mar 2009 09:19:28 -0500
Received: from mdomsmp01.cf.ac.uk ([10.255.228.22])
	by hermes1.cf.ac.uk with esmtp (Exim 4.69)
	(envelope-from <Rees@cardiff.ac.uk>) id 1LfEQ3-0008O9-76
	for linux-lvm@redhat.com; Thu, 05 Mar 2009 14:19:27 +0000
MIME-Version: 1.0
From: Lyn Rees <Rees@cardiff.ac.uk>
Message-ID: <OF225E8B06.ABEB6C57-ON80257570.004EA632-80257570.004EADBC@cardiff.ac.uk>
Date: Thu, 5 Mar 2009 14:19:25 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 004EAD6C80257570_="
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
--=_alternative 004EAD6C80257570_=
Content-Type: text/plain; charset="US-ASCII"

Anyone?

__________________

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
--=_alternative 004EAD6C80257570_=
Content-Type: text/html; charset="US-ASCII"

<font size=2 face="sans-serif">Anyone?</font>
<br>
<br><font size=2 face="sans-serif">__________________</font>
<br>
<br><font size=2 face="sans-serif">Hi,</font>
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
--=_alternative 004EAD6C80257570_=--
