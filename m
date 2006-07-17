Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6H6BS4j008344
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 02:11:28 -0400
Received: from mail2.renkhoff.de (mail2.renkhoff.de [62.157.182.252])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6H6BP3a015423
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 02:11:26 -0400
Received: from s01edv50.warema.de (localhost [127.0.0.1])
	by mail2.renkhoff.de (Postfix) with ESMTP id E314F9BCBD
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 08:11:17 +0200 (CEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: AW: [linux-lvm] SAN setup with host mirrored disks
Date: Mon, 17 Jul 2006 08:11:17 +0200
Message-ID: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DA7@s01edv50.warema.de>
In-Reply-To: <44B68AF6.30004@fastenal.com>
From: "Fiederling, Daniel" <daniel.fiederling@warema.de>
Content-Transfer-Encoding: quoted-printable
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

thank you all for your answers. I currently test a setup with md for failov=
er.
To clarify: we have two Clariions in two different locations that are used =
for failover. Of course on each Clariion the disks are set up as raid 5. My=
 question was about setting up a mirror that "copies" the data on each Clar=
iion.

Currently I use OpenSuSE 10.1 as distribution so unfortunately I can't use =
PowerPath because I only get rpms for sles or rhel that can't be installed.=
 I know it's the wrong place for this question but: had someone success on =
installing PowerPath on non supported systems?

Kelly, I installed a package called multipath-tools version 0.4.6 which con=
tains multipath and multipathd by Christophe Varoqui. Is that the mpio pack=
age you mentioned? Why do I have to expect io errors when using md? What is=
 special about the Clariion setup? I would expect that the san disks are on=
ly "normal" scsi disks for linux...

Ciao
Daniel



-----Urspr=EF=BF=BDngliche Nachricht-----
Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] Im =
Auftrag von Kelly Sauke
Gesendet: Donnerstag, 13. Juli 2006 20:04
An: LVM general discussion and development
Betreff: Re: [linux-lvm] SAN setup with host mirrored disks

Do the Raiding on the Clariion.  Then use either PowerPath or mpio (on=20
RHEL 4 U3 or newer) to do your failover.  If you use md for your=20
failover layer you may get IO errors on the non-active paths.  You need=20
something that is aware of the clariion setup and that would be=20
PowerPath or the shipped mpio.
