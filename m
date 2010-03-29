Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2TKP6js008009
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 16:25:06 -0400
Received: from mail.cegepsth.qc.ca (mail.cegepsth.qc.ca [207.162.116.112])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2TKOoUh018018
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 16:24:50 -0400
Message-Id: <4BB0D44A.1F8D.00A2.0@cegepsth.qc.ca>
Date: Mon, 29 Mar 2010 16:24:43 -0400
From: "Mathieu Chartier" <mchartier@cegepsth.qc.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=__Part052FF29B.0__="
Subject: [linux-lvm] Reduce an LVM volume split on two physical disks
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

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__Part052FF29B.0__=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,
 
I have an LVM volume of 1.8TB split on two physical disk that have a
900 someting GB partition on each of them.
 
I need to change the second disk, and only 396GB og the 1.8TB is
used...so can I reduce the size of the LVM volume to only the first
disk, change the second disk and expand after the LVM volume to the
second disk?
 
The volume is in LVM2 
 
Regards,
 
Mathieu Chartier
Technicien Informatique
Cégep de Saint-Hyacinthe
tél:  450 773-6800 Poste 153
ligne Mtl (514) 875-4445 Poste 153

--=__Part052FF29B.0__=
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Description: HTML

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8">
<META content=3D"MSHTML 6.00.6000.16981" name=3DGENERATOR></HEAD>
<BODY style=3D"MARGIN: 4px 4px 1px; FONT: 10pt Tahoma">
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have an LVM volume of 1.8TB split on two physical disk that have a =
900 someting GB partition on each of them.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I need to change the second disk, and only 396GB og the 1.8TB is =
used...so can I reduce the size of the LVM volume to only the first disk, =
change the second disk and expand after the LVM volume to the second =
disk?</DIV>
<DIV>&nbsp;</DIV>
<DIV>The volume is in LVM2 </DIV>
<DIV>&nbsp;</DIV>
<DIV>Regards,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Mathieu Chartier<BR>Technicien Informatique<BR>C=C3=A9gep de =
Saint-Hyacinthe<BR>t=C3=A9l:&nbsp; 450 773-6800 Poste 153<BR>ligne Mtl =
(514) 875-4445 Poste 153</DIV></BODY></HTML>

--=__Part052FF29B.0__=--
