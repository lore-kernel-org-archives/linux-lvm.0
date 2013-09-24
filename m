Date: Tue, 24 Sep 2013 17:01:22 +0200 (CEST)
From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner@redhat.com>
In-Reply-To: <alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
Message-ID: <alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-416690110-1380034885=:2049"
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?ISO-8859-15?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-416690110-1380034885=:2049
Content-Type: TEXT/PLAIN; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Sep 2013, Luk=EF=BF=BD Czerner wrote:

> Date: Tue, 24 Sep 2013 15:20:13 +0200 (CEST)
> From: Luk=EF=BF=BD Czerner <lczerner@redhat.com>
> Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
> To: Jorge F=EF=BF=BDbregas <jorge.fabregas@gmail.com>
> Cc: linux-lvm@redhat.com
> Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
>=20
> On Tue, 17 Sep 2013, Jorge F=EF=BF=BDbregas wrote:
>=20
> > Date: Tue, 17 Sep 2013 14:38:08 -0400
> > From: Jorge F=EF=BF=BDbregas <jorge.fabregas@gmail.com>
> > Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
> > To: linux-lvm@redhat.com
> > Subject: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
> >=20
> > Hi,
> >=20
> > I'm testing fstrim on an LVM volume but it only seems to work the first
> > time I run it (just after mounting the volume).  When I run "fstrim -v
> > /mnt" for the first time it prints all the free blocks that is trimming
> > (almost all of the filesystem as it is empty) but subsequent runs just
> > output "0 bytes trimmed" no matter how many files I create/sync & delete
> > afterwards.  The "issue_discards" is set in lvm.conf.
> >=20
> > If I do this over the raw device (/dev/sda3, same ext4 filesystem) I get
> > the output corresponding to the last deleted files every time I run fst=
rim.
> >=20
> > ## THIN ##
> >=20
> > I also created a thin pool and a logical volume on that pool.  If I
> > mount this volume with "discard", I can see that TRIM is working by
> > doing an "lvs vgthin" (the Data Usage% grows as I create files & shrinks
> > as I delete files).  However, If I mount it without the "discard" option
> > (in order to use fstrim) I only see the data-usage reduction when I run
> > fstrim *just* for the first time.
> >=20
> > Any help will be appreciated.
>=20
> Can you blktrace output for the devivce you're doing the fstrim on ?
> Both when you run fstrim for the first time and then when you run it
> again after releasing some blocks from the file system.
>=20
> blktrace -d /dev/sda -o - | blkparse -i -
>=20
> viz. man blktrace
>=20
> Can you share how many a what size are the files you're releasing
> before running fstrim again ? Are you using sync after removing
> those files and before running fstrim (that's pretty important since
> blocks are not released instantly from the ext4 file system - but you
> can force it with sync).
>=20
> I can confirm that fstrim on ext4 works as expected with loop image
> and I do not see behaviour described by Jorge. I'll try thinp as
> well to see what's going on.

I've tried it with thinp targer and it works as expected:


# mkfs.ext4 /dev/lvm_pool/thin_lv
# mount /dev/lvm_pool/thin_lv /mnt/test
# dd if=3D/dev/zero of=3D/mnt/test/file bs=3D1M count=3D1024
# dd if=3D/dev/zero of=3D/mnt/test/file1 bs=3D1M count=3D1024
# dd if=3D/dev/zero of=3D/mnt/test/file2 bs=3D1M count=3D1024
# sync
# lvs
pool    lvm_pool twi-a-tz-   9,00g              35,83                      =
 =20
thin_lv lvm_pool Vwi-aotz-  50,00g pool          6,45                      =
 =20

# rm -f /mnt/test/file
# sync
# fstrim -v /mnt/test
/mnt/test: 47 GiB (50508640256 bytes) trimmed

# lvs
pool    lvm_pool twi-a-tz-   9.00g              33.54                      =
 =20
thin_lv lvm_pool Vwi-aotz-  50.00g pool          6.04                      =
 =20

# rm -f /mnt/test/file*
# sync
# fstrim -v /mnt/test
/mnt/test: 47 GiB (50508640256 bajt=EF=BF=BD) trimmed

# lvs
pool    lvm_pool twi-a-tz-   9.00g              16.44                      =
 =20
thin_lv lvm_pool Vwi-aotz-  50.00g pool          2.96                      =
 =20

# lvm version
LVM version:     2.02.98(2) (2012-10-15)
Library version: 1.02.77 (2012-10-15)
Driver version:  4.24.0

-Lukas


>=20
> Thanks!
> -Lukas
>=20
>=20
> >=20
> > Thanks,
> > Jorge
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >=20
--8323328-416690110-1380034885=:2049--
