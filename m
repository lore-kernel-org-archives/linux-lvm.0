Return-Path: <frodet@nvg.org>
From: Frode =?iso-8859-1?q?Tenneb=F8?= <frodet@nvg.org>
Date: Thu, 2 Aug 2001 23:42:34 +0200
References: <01080123240507.01440@leia>
In-Reply-To: <01080123240507.01440@leia>
MIME-Version: 1.0
Message-Id: <01080223423400.05532@leia>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re: Kernel Oops
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wednesday 01 August 2001 23:24, Frode Tenneb=F8 wrote:
> I have tested SGI's linux-2.4-xfs in it's 2.4.7 incarnation.
> Compilled with gcc-2.96-81 on a Dell Latitude CPt400 with an Adaptec
> 1460A PCMCIA SCSI adapter.
>
> I can do whatever I want until I mount an LVM volume. After some time
> or immediately it will panic with a dump like this:

It appeard that a filesystem error caused the panic when mounting one=20
of the LVs. A fsck on a newly booted system cured that problem.

> Aug  1 18:57:26 localhost kernel: Unable to handle kernel paging
> request at virtual address c489c4f0
> Aug  1 18:57:26 localhost kernel:  printing eip:
> Aug  1 18:57:26 localhost kernel: c489c4f0
> Aug  1 18:57:26 localhost kernel: *pde =3D 03bd1067
> Aug  1 18:57:26 localhost kernel: *pte =3D 00000000
> Aug  1 18:57:26 localhost kernel: Oops: 0000
> Aug  1 18:57:26 localhost kernel: CPU:    0
> Aug  1 18:57:26 localhost kernel: EIP:
> 0010:[fat:__insmod_fat_S.bss_L2264+450160/60315488]

[snap]

> This also happens with 2.4.8-pre3-xfs. I'm not sure if this is a LVM
> issue, a general kernel issue or an SGi/XFS issue, but I thought I'd
> bring it up here before I talked to the XFS guys as this is directly
> related to LVM (#define LVM_RELEASE_NAME "0.9.1_beta6" - perhaps a
> known problem?)

Furhtermore the oops happening after doing some work (eg. compiling)=20
while the LV in question was mounted, but working on a different=20
filesystem, also seems to have dissappeard. However, doing some work on=20
the filesystem of the LV in question (from simple ls, to compilations)=20
brings back the oops. I'm unable to umount the filesystem and=20
eventually everything hangs.

What could be wrong?

Regards,
 -Frode
--=20
^ Frode Tenneb=F8 | email: frodet@nvg.org | Frode@IRC  ^
| with Standard.Disclaimer; use Standard.Disclaimer; |
