Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB3DPYdd024876
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 08:25:34 -0500
Received: from mout2.freenet.de (mout2.freenet.de [194.97.50.155])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kB3DPWd3000921
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 08:25:32 -0500
Received: from [194.97.50.135] (helo=mx2.freenet.de)
	by mout2.freenet.de with esmtpa (Exim 4.62)
	(envelope-from <Richard.Kampmann@freenet.de>) id 1GqrLX-0006eq-9D
	for linux-lvm@redhat.com; Sun, 03 Dec 2006 14:25:31 +0100
Received: from p54abd1d5.dip.t-dialin.net ([84.171.209.213]:6978
	helo=mars.rkampmann.local)
	by mx2.freenet.de with esmtpsa (ID Richard.Kampmann@freenet.de)
	(TLSv1:AES256-SHA:256) (port 25) (Exim 4.62 #12) id 1GqrLX-0005I6-2g
	for linux-lvm@redhat.com; Sun, 03 Dec 2006 14:25:31 +0100
From: Richard Kampmann <Richard.Kampmann@freenet.de>
Subject: Re: [linux-lvm] LVM problem - how to recover?
Date: Sun, 3 Dec 2006 14:26:24 +0100
References: <200611282115.15335.Richard.Kampmann@freenet.de>
In-Reply-To: <200611282115.15335.Richard.Kampmann@freenet.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1278660.hivsGq9S2Z";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200612031426.30561.Richard.Kampmann@freenet.de>
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
To: linux-lvm@redhat.com

--nextPart1278660.hivsGq9S2Z
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi everybody,

I'm a bit disappointed, because there was really no feedback to my mail.

The situation is a real problem for me - is there anything missing? Or is=20
there no way to recover (can't believe that ...)?
Wrong way or place to ask? Then please tell me where to go ...

I tried to find a solution myself (also with help of Google ...), but it di=
d=20
not help me.

Bye

Richard Kampmann

Am Dienstag, 28. November 2006 21:15 schrieb Richard Kampmann:
> Hi everybody ...
>
> I recently had a lvm crash from which I now have to recover. So now I need
> your help ...
>
> The system is a SUSE 10.1 system with actual patches.
> # uname -rio
> 2.6.16.21-0.25-default i386 GNU/Linux
> # lvm version
>   LVM version:     2.02.02 (2006-02-07)
>   Library version: 1.02.03 (2006-02-08)
>   Driver version:  4.5.0
> #
>
> There was the unenlightened crash and before there was a volume goup
> spanning two physical partitions (sda2, sdb2), each on one physical disk
> (sda, sdb). The system froze (maybe in coincidence with some
> snapshot-handling) and I had to press the reset button. When rebooting lvm
> told me he could not open the volume group because one pv was missing. The
> partition looked OK when checking the partition table. I tried several
> things - and to do a vgcfgrestore but it did not help.
>
> The volume group (system_vg) contained the root partition, so I installed=
 a
> new system on a third disc and tried to recover the old volume group.
> Unfortunately when doing the pvcreate for the two physical volumes I did
> NOT choose the "--zero n" switch.
>
> Fact is: I now have the volume group containing two physical discs and two
> physical volumes with the correct PV UUIDs. But the first sectors are
> zeroed, aren't they?
>
> Any way to recover the LVs of the old volume group? A vgcfgrestore (YES,
> there was a vgcfgbackup before!) does not work ... bad luck.
>
> Ah - and all logical volumes contain Reiser Filesystems V 3.6 - they MUST
> still be there ...
>
> So - what could be my next steps?
>
> Bye
>
> Richard Kampmann

--nextPart1278660.hivsGq9S2Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBFctCGyBq3/LsKGjcRAt/4AKCvxugooEewthDAFKqzca6xlWBUEACeKIZB
sRuqHidPpS9xTWqz1CjL5iI=
=R0Eo
-----END PGP SIGNATURE-----

--nextPart1278660.hivsGq9S2Z--
