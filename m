Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6HEXnRa009565
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 10:33:49 -0400
Received: from bob.fastenal.com (bob.fastenal.com [205.243.112.24])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6HEXgUw030980
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 10:33:42 -0400
Message-ID: <44BB9FBC.4080700@fastenal.com>
Date: Mon, 17 Jul 2006 09:33:32 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: AW: AW: [linux-lvm] SAN setup with host mirrored disks
References: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DB3@s01edv50.warema.de>
In-Reply-To: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DB3@s01edv50.warema.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Fiederling, Daniel wrote:
> Currently I have only one path to each disk but further on I'd like to te=
st a setup with multiple paths. But am I right that I have to use md on top=
 of multipathd for getting the two disks mirrored?
>  =20
Yes, multipathd only handles the multiple paths on a per disk basis.  If=20
you need them mirrored you have to use something on top of the multipath=20
layer.  Using md is one option that should work just fine.=20

> I tested different qla2xxx drivers (SuSE shipped, origanal download packa=
ges from qlogic, packages from hp) and the non suse offered much more modul=
e parameters - one of them was about en-/disabling failover. I would guess =
that the qla2xxx driver or the card firmware can handle multiple paths. But=
 I'm not sure about that...
>
>
>  =20
I've yet to meet an HBA that doesn't work with multiple paths.   I would=20
check EMC's support matrix for your particular card.  I know that we=20
have to run specific EMC firmware on our HBAs to be fully supported.  I=20
think by running the non EMC firmware you lose some of the functionality=20
and may run into some stability issues.  I can't comment on that further=20
since we've never done any testing with non-EMC firmware.

> -----Urspr=EF=BF=BDngliche Nachricht-----
> Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] I=
m Auftrag von Kelly Sauke
> Gesendet: Montag, 17. Juli 2006 15:36
> An: LVM general discussion and development
> Betreff: Re: AW: [linux-lvm] SAN setup with host mirrored disks
>
>  =20
>> Why do I have to expect io errors when using md? What is special about t=
he Clariion setup? I would expect that the san disks are only "normal" scsi=
 disks for linux...
>>  =20
>>    =20
> The difference comes in how the multiple paths to the same disk are=20
> handled under linux.  If you only have one path to each disk, then this=20
> doesn't apply to you. I guess I forgot to clarify if you had more than=20
> one path.   Anyway, if you have multiple paths mpio knows which is the=20
> Active path and which is the Passive path.  Sending IO down a passive=20
> path will result in IO errors.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  =20
