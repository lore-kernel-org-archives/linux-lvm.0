Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6HDsEi8027553
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 09:54:14 -0400
Received: from mail2.renkhoff.de (mail2.renkhoff.de [62.157.182.252])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6HDsDQm013337
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 09:54:13 -0400
Received: from s01edv50.warema.de (localhost [127.0.0.1])
	by mail2.renkhoff.de (Postfix) with ESMTP id C3DB599230
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 15:54:07 +0200 (CEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: AW: AW: [linux-lvm] SAN setup with host mirrored disks
Date: Mon, 17 Jul 2006 15:54:07 +0200
Message-ID: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DB3@s01edv50.warema.de>
In-Reply-To: <44BB924F.7010301@fastenal.com>
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

Currently I have only one path to each disk but further on I'd like to test=
 a setup with multiple paths. But am I right that I have to use md on top o=
f multipathd for getting the two disks mirrored?
I tested different qla2xxx drivers (SuSE shipped, origanal download package=
s from qlogic, packages from hp) and the non suse offered much more module =
parameters - one of them was about en-/disabling failover. I would guess th=
at the qla2xxx driver or the card firmware can handle multiple paths. But I=
'm not sure about that...


-----Urspr=EF=BF=BDngliche Nachricht-----
Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] Im =
Auftrag von Kelly Sauke
Gesendet: Montag, 17. Juli 2006 15:36
An: LVM general discussion and development
Betreff: Re: AW: [linux-lvm] SAN setup with host mirrored disks

> Why do I have to expect io errors when using md? What is special about th=
e Clariion setup? I would expect that the san disks are only "normal" scsi =
disks for linux...
>  =20
The difference comes in how the multiple paths to the same disk are=20
handled under linux.  If you only have one path to each disk, then this=20
doesn't apply to you. I guess I forgot to clarify if you had more than=20
one path.   Anyway, if you have multiple paths mpio knows which is the=20
Active path and which is the Passive path.  Sending IO down a passive=20
path will result in IO errors.
