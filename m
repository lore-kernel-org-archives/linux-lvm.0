Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAUFC5r29116
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2004 10:12:05 -0500
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iAUFBxNU004030
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2004 10:11:59 -0500
Message-ID: <41AC8DB9.4010301@gmx.net>
Date: Tue, 30 Nov 2004 16:11:53 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Installation of LVM on AS 2.1 - kernel 2.4.9-e.3
References: <5EA812BF44E06D4B818A8EEEDDE12B7F0448BFA4@EX2BEL86MBX02>
In-Reply-To: <5EA812BF44E06D4B818A8EEEDDE12B7F0448BFA4@EX2BEL86MBX02>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Johan.SEGERS@cec.eu.int schrieb:
> During the configure part, i always get a message that it did not find =20
> a Makefile in the /usr/src/linux directory.
> My source directory of the redhat is /usr/src/linux/SOURCES and there is =

> no Makefile there. The Makefile for the
> Lvm package is in the direvctory from where i try to install LVM nl=20
> /tmp/lvm/LVM/1.0.3.
>=20
> Any idea what is missing here ?
Hi Johan,

yep, he's looking for the Makefile of your Linux-Kernel (that's usually=20
at /usr/src/linux) - he's getting the Kernel-config from there (read the=20
build instrunctions ??? ).

Perhaps, you'd rather play around with compiling own kernels before=20
trying to patch it ;-).

Ciao
Klaus

--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
