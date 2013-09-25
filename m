Date: Wed, 25 Sep 2013 10:39:04 +0200 (CEST)
From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner@redhat.com>
In-Reply-To: <5241D3E0.9090904@gmail.com>
Message-ID: <alpine.LFD.2.00.1309250926590.1893@localhost.localdomain>
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
	<alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
	<5241D3E0.9090904@gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1712348445-1380098347=:1893"
Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: =?ISO-8859-15?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
Cc: linux-lvm@redhat.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1712348445-1380098347=:1893
Content-Type: TEXT/PLAIN; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Sep 2013, Jorge F=EF=BF=BDbregas wrote:

> Date: Tue, 24 Sep 2013 14:03:12 -0400
> From: Jorge F=EF=BF=BDbregas <jorge.fabregas@gmail.com>
> To: linux-lvm@redhat.com
> Cc: Luk=EF=BF=BD Czerner <lczerner@redhat.com>
> Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
>=20
> ok Luk=EF=BF=BD I think I found where the problem is. I just realized tha=
t I
> created that filesystem without journaling (in order to increase perform
> for the VM disks).  I created it with:
>=20
> mkfs.ext4 -O ^has_journal /dev/vgthin1/lvol2
>=20
> I went back and created the filesystem again (on a thin lvol) with
> default options and indeed fstrim works as expected.  I created ANOTHER
> thinvol (without journaling) and fstrim doesn't work.
>=20
> Is this a bug or does fstrim requires ext4 with journal by design?

Oh that's useful information :) Yes, it is a bug and here is
untested fix.


diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index a41e3ba..4d113ef 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -4794,8 +4794,8 @@ do_more:
 					 " group:%d block:%d count:%lu failed"
 					 " with %d", block_group, bit, count,
 					 err);
-		}
-
+		} else
+			EXT4_MB_GRP_CLEAR_TRIMMED(e4b.bd_info);
=20
 		ext4_lock_group(sb, block_group);
 		mb_clear_bits(bitmap_bh->b_data, bit, count_clusters);

>=20
> My apologies for not stating this since the beginning!

No problem, important is that we've got to the bottom of this.
Thanks for reporting it!

-Lukas

>=20
>=20
--8323328-1712348445-1380098347=:1893--
