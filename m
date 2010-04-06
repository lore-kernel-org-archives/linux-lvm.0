Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o36DXD7D004701
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2010 09:33:13 -0400
Received: from mail.cegepsth.qc.ca (mail.cegepsth.qc.ca [207.162.116.112])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o36DWwvZ017536
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2010 09:32:58 -0400
Message-Id: <4BBAFFD0.1F8D.00A2.0@cegepsth.qc.ca>
Date: Tue, 06 Apr 2010 09:32:51 -0400
From: "Mathieu Chartier" <mchartier@cegepsth.qc.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=__PartB3994E13.0__="
Subject: [linux-lvm] pvmove issue
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

--=__PartB3994E13.0__=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,
 
I did this command to move a physical volume to anoter :
 
pvmove /dev/sdb1 /dev/sdc
 
The pvmove has crashed at 49.9% and now the both physical drive are in
use...
 
I re-launch the command and the software says that a move was in
progress and now it display every 15 seconds /dev/sdb1: Moved: 100.0%
 
Is it normal?
 
Mathieu Chartier
Technicien Informatique
Cégep de Saint-Hyacinthe
tél:  450 773-6800 Poste 153
ligne Mtl (514) 875-4445 Poste 153

--=__PartB3994E13.0__=
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Description: HTML

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8">
<META content=3D"MSHTML 6.00.6000.16981" name=3DGENERATOR></HEAD>
<BODY style=3D"MARGIN: 4px 4px 1px; FONT: 10pt Tahoma">
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I did this command to move a physical volume to anoter :</DIV>
<DIV>&nbsp;</DIV>
<DIV>pvmove /dev/sdb1 /dev/sdc</DIV>
<DIV>&nbsp;</DIV>
<DIV>The pvmove has crashed at 49.9% and now the both physical drive are =
in use...</DIV>
<DIV>&nbsp;</DIV>
<DIV>I re-launch the command and the software says that a move was in =
progress and now it display every 15 seconds /dev/sdb1: Moved: 100.0%</DIV>=

<DIV>&nbsp;</DIV>
<DIV>Is it normal?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Mathieu Chartier<BR>Technicien Informatique<BR>C=C3=A9gep de =
Saint-Hyacinthe<BR>t=C3=A9l:&nbsp; 450 773-6800 Poste 153<BR>ligne Mtl =
(514) 875-4445 Poste 153</DIV></BODY></HTML>

--=__PartB3994E13.0__=--
