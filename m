Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6HDaWIN022936
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 09:36:32 -0400
Received: from bob.fastenal.com (bob.fastenal.com [205.243.112.24])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6HDaOHI014602
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 09:36:24 -0400
Message-ID: <44BB924F.7010301@fastenal.com>
Date: Mon, 17 Jul 2006 08:36:15 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: AW: [linux-lvm] SAN setup with host mirrored disks
References: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DA7@s01edv50.warema.de>
In-Reply-To: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DA7@s01edv50.warema.de>
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
> Hi,
>
> thank you all for your answers. I currently test a setup with md for fail=
over.
> To clarify: we have two Clariions in two different locations that are use=
d for failover. Of course on each Clariion the disks are set up as raid 5. =
My question was about setting up a mirror that "copies" the data on each Cl=
ariion.
>  =20
We use either Veritas Volume Manager or EMC MirrorView to accomplish=20
this.  We've had no luck in our lab getting mirrored LVM volumes to work=20
properly.

> Currently I use OpenSuSE 10.1 as distribution so unfortunately I can't us=
e PowerPath because I only get rpms for sles or rhel that can't be installe=
d. I know it's the wrong place for this question but: had someone success o=
n installing PowerPath on non supported systems?
>  =20
There used to be a tarball install for PowerPath.  I haven't used it for=20
about 3 years now since all we have are RHEL systems and the RPMs work=20
fine but they might still be shipping the tarball.
> Kelly, I installed a package called multipath-tools version 0.4.6 which c=
ontains multipath and multipathd by Christophe Varoqui. Is that the mpio pa=
ckage you mentioned?=20
Yes, that is the package that I was talking about.

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

> Ciao
> Daniel
>
>
>
> -----Urspr=EF=BF=BDngliche Nachricht-----
> Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] I=
m Auftrag von Kelly Sauke
> Gesendet: Donnerstag, 13. Juli 2006 20:04
> An: LVM general discussion and development
> Betreff: Re: [linux-lvm] SAN setup with host mirrored disks
>
> Do the Raiding on the Clariion.  Then use either PowerPath or mpio (on=20
> RHEL 4 U3 or newer) to do your failover.  If you use md for your=20
> failover layer you may get IO errors on the non-active paths.  You need=20
> something that is aware of the clariion setup and that would be=20
> PowerPath or the shipped mpio.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  =20
