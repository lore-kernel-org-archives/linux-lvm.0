Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAKMg102402
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:22:42 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.21])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jBAKMfoX015108
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:22:41 -0500
Received: from pc8.trash.bin (pc8.trash.bin [192.168.4.8])
	by pc1.trash.bin (Postfix) with ESMTP id 3826642D9
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 21:22:33 +0100 (CET)
Date: Sat, 10 Dec 2005 21:22:32 +0100
From: Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <20051210202232.GG3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
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

On Sat, 10 Dec 2005 at 13:14 (-0700), Michael Loftis wrote:
> --On December 10, 2005 9:06:46 PM +0100 Marc-Jano Knopp <pub_ml_lvm@marc-=
jano.de> wrote:
> >On Sat, 10 Dec 2005 at 13:03 (-0700), Michael Loftis wrote:
> >>--On December 10, 2005 8:48:27 PM +0100 Marc-Jano Knopp
> >><pub_ml_lvm@marc-jano.de> wrote:
> >>> On Sat, 10 Dec 2005 at 14:38 (-0500), Mag Gam wrote:

[Resizing of file systems]

[...]
> ReiserFS has hot expansion capabilities, but no (yet?) hot shrinking=20
> capabilities.  One of the reasons it has these features and ext2/3 does n=
ot=20
> is because ext2/3 are very old filesystems designed on a different=20
> mentality of a static filesystem.  On-line expansion of ext2 based=20
> filesystems is an extremely complicated venture, it might honestly even b=
e=20
> impossible.
>=20
> ReiserFS has the advantage here because it doesn't necessarily pre-write =

> out a lot of filesystem meta-information (superblocks, inodes, bitmaps,=20
> etc), instead these structures are entirely dynamic to begin with, so=20
> enlarging them at runtime is trivial, requires a very short lock and a=20
> change to a few numbers.  Ext2 resizing requires actually rewriting a lot=
=20
> of filesystem metadata.

Thanks for the detailled explanation!

Yes, I would *love* to use a totally new file system with a new,
dynamic, good design, but - just as many others - had my experiences
with ReiserFS and it will take a *lot* of time for ReiserFS to restore
confidence. So for now, I'll probably stay with ext3, with which I had
no problems so far.

JFS/XFS should also both be capable of growing, XFS of online-growth,
IIRC.


Gru=EF=BF=BD

  Marc-Jano
