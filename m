Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j29HfMn05546
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2005 12:41:22 -0500
Received: from psmtp.com (exprod6og2.obsmtp.com [64.18.1.122])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j29HfLl1025557
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2005 12:41:21 -0500
From: linux-lvm-bounces@redhat.com
Received: from uswm.myoverland.net (unverified) by
	SD-MIS-S36.overland.myoverland.net
	(Content Technologies SMTPRS 4.3.14) with ESMTP id
	<T6f931954060a0108295e8@SD-MIS-S36.overland.myoverland.net> for
	<linux-lvm@redhat.com>; Wed, 9 Mar 2005 09:41:20 -0800
Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])	by
	int-mx1.corp.redhat.com
	(8.11.6/8.11.6) with ESMTP id j25Ej2n14615	for <linux-lvm@redhat.com>;
	Sat, 5 Mar 2005 09:45:02 -0500
Received: from WS0005.indiatimes.com (smtp5.indiatimes.com [203.199.93.15])	by
	mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j25EirQ4017495	for
	<linux-lvm@redhat.com>; Sat, 5 Mar 2005 09:44:55 -0500
Received: from 192.168.57.15 ([192.168.57.73])	by WS0005.indiatimes.com
	(8.9.3/8.9.3) with SMTP id TAA26825	for "LVM general discussion and
	development"<linux-lvm@redhat.com>; Sat, 5 Mar 2005 19:04:38 +0530
MIME-Version: 1.0
Subject: Re: Re: [linux-lvm] mirroring in LVM2
Message-ID: <OF2B022FD7.481B2DD5-ON88256FBF.0050256F-88256FBF.00612E88@myoverland.net>
Sender: lIvey@overlandstorage.com
Date: Wed, 9 Mar 2005 09:41:29 -0800
Content-type: multipart/mixed; 
	Boundary="0__=07BBE52CDFC3A3FF8f9e8a93df938690918c07BBE52CDFC3A3FF"
Content-Disposition: inline
Reply-To: pritambhavsar <pritambhavsar@indiatimes.com>,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0__=07BBE52CDFC3A3FF8f9e8a93df938690918c07BBE52CDFC3A3FF
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable



I am trying to implement the concept of RAID 1 that is the mirroring in=
 the
LVM2 on 2.6.7 kernel version. LVM2 is implemented with the help of the
device-mapper. What is the exact reason for adding the device mapper in=
 2.6
kernel source tree and throwing LVM2 out of kernel source tree.




-Pritam

"LVM general discussion and development" wrote:




 Le 02.03.2005 09:49:17, pritambhavsar a =E9crit :
 > Hello to all
 >
 >
 > I am new to LVM2 and trying do the mirroring, please tell me how to
 > do that.

 As mirroring is not yet available in lvm, you have to install a lvm
 over a raid1.

 >
 >
 > I have Fedora Core 2 with LVM2 2.00.25.
 >
 >
 > -Pritam

 Jean-Luc

Indiatimes Email now powered by APIC Advantage. Help!
(Embedded image moved to file: pic25547.gif)H! elp

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=

--0__=07BBE52CDFC3A3FF8f9e8a93df938690918c07BBE52CDFC3A3FF
Content-type: image/gif; 
	name="pic25547.gif"
Content-Disposition: attachment; filename="pic25547.gif"
Content-transfer-encoding: base64

R0lGODlhcwAnAKIAAHJyctvb2xgYGJ2dnTc3N7q6ugAAAP///yH5BAAAAAAALAAAAABzACcAAAP/
eLrc/jDKSeMQperNu/+DATjA+J1oWgVD0BQC0QSxq954CgO2EhCC3qFgkOWOSA1N1AAYMj4AhlHg
Ja9YmGDACHF9RSpQiC3faMEFcRRgGVqBQoEgIpvvykO7LeXF5wByc2+CdIFQeIkTgoxyA42NBIeD
k4qWEZCZjo+PjIaddpeXmowABEACMZKCpow9baKjpBcGtakCtQZbmnynsZZ/kE66AAPGxqa1kwUD
pqiSv4qawwSaA0AihbiSLdGKwazKpHLDh8YFod5l4My4h8WkTrty6qLsTtXtk/Ce2fT1wCL5YyYo
xLIqRQQBDFhQVydIDwviepRuYRJw+MZlMvTP/yKeUgk1CjzkUcG/OG0QIeqQktxAkS4DVXxQzKQV
ltckCaFjYIgyOgrozJQAEgNMR+7QcQhzQMpQB0tO1fqyJmjPHz0PNHsKIdiFeTBD7OK6gKkAExvQ
QMHqouoBoG+zpmgp55OUXFIJFfJHVkEYIgtMSdmCj4xBKkzonKVFAKsCU0FL6LKB9SxUkISa5V0s
UW/fA2FgWS021Qnax08ahMH3yJ3juH5FhDCSqtkbB4yuhRynO5/SDUwZwP3LpMvtBQGIm4DLPCtT
4tyC+2hE6yB1OgQefpZu1a8Mt8hjCE/ttnl30Eagl6j5opG8iKVwgf2tgTts9D5PKxBbwp3J4pvm
3fccbRhcY0cmtWVCDXzbGTGed/k9MEgRX0R4X4AD+qCYfiZBQgd87bwkyGclnQDRNsU8NBsvJX5E
nS6nxJCKVNZ1FMEpOOao44489ujjj0ACCZ9YxzRjSlIbBankkkw26eRBPD1zSjI1zgFkiyqwo1iR
R06lCZZ3sKNbEevdNR8jYJrBDjPY5GILiAqlWUY8ZZ4jB0roiCZBAgA7

--0__=07BBE52CDFC3A3FF8f9e8a93df938690918c07BBE52CDFC3A3FF--
