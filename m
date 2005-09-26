Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8Q7OLV29653
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2005 03:24:21 -0400
Received: from dgate2.fujitsu-siemens.com (dgate2.fujitsu-siemens.com
	[217.115.66.36])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8Q7OAZK029800
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2005 03:24:11 -0400
Received: from pdbzex1e.pdb.fsc.net (pdbzex1e.pdb.fsc.net [172.25.96.71])
	by plim.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	j8Q7O2PT024020
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2005 09:24:05 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 26 Sep 2005 09:24:01 +0200
Message-ID: <ADC8F7AA316AF74EBEC87590CCDA6162060C5164@PDBEX02E.pdb.fsc.net>
From: <Dirk.Laurenz@fujitsu-siemens.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pvmove - how dangerously
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

Hello everbody,

i have a question concerning pvmove (eithet lvm1 or 2).
How dangerously is it to move a complete vg from one disk=20
others online (running apps (e.g. Databases)).

Should i do that? Normally pvmove should do that without
any interruption of the app, right? Should i expect dataloss?


=20

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
