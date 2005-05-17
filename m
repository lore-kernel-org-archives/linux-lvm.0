Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4H8s5O27025
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 04:54:05 -0400
Received: from dgate2.fujitsu-siemens.com (dgate2.fujitsu-siemens.com
	[217.115.66.36])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4H8rw1Z015496
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 04:53:58 -0400
Received: from pdbzex0e.pdb.fsc.net (pdbzex0e.pdb.fsc.net [172.25.96.69])
	by trulli.pdb.fsc.net (8.11.6/8.11.6) with ESMTP id j4H8rvE14118
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 10:53:57 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 17 May 2005 10:53:46 +0200
Message-ID: <ADC8F7AA316AF74EBEC87590CCDA616204F882DA@PDBEX02E.pdb.fsc.net>
From: <Dirk.Laurenz@fujitsu-siemens.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pvdisplay
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hello everybody!

i want to find out, which lvs are on a certain disk.
according to the manpage of pvdisplay the following command
should do this:

	pvdisplay -m /dev/sdd1

but the only thing i get is this:

	  --- Physical volume ---
  PV Name               /dev/sdd1
  VG Name               vgSMBFS
  PV Size               195.38 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       65536
  Total PE              3126
  Free PE               0
  Allocated PE          3126
  PV UUID               xpwmrT-1sL6-VKe5-iPvL-adP3-iNVA-OIXP0e

what i would expect is a list of lvs.
i want to find this out, because there's a high io on this disk.

	sdc               8.54       373.13        46.11  250261264   30927807
	sdd              19.53       566.22       165.54  379767705  111027923
	sde               0.55       138.77         0.53   93076209     358605

any help is appreciated..

Mit freundlichem Gru=EF=BF=BD,



Dirk Laurenz
Systems Engineer=09

Fujitsu Siemens Computers
S CE DE SE PS N/O
Sales Central Europe Deutschland=20
Professional Service Nord / Ost

Hildesheimer Strasse 25
30880 Laatzen
Germany

Telephone:	+49 (511) 84 89 - 18 08
Telefax:	+49 (511) 84 89 - 25 18 08
Mobile:	+49 (170) 22 10 781
Email:	mailto:dirk.laurenz@fujitsu-siemens.com
Internet:	http://www.fujitsu-siemens.com
            http://www.fujitsu-siemens.de/services/index.html
***************************************************************************=
****************************************
=20
