Message-ID: <389F12F7.AE269634@osp.nl>
Date: Mon, 07 Feb 2000 19:46:15 +0100
From: Jos Visser <josv@osp.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Configuring boot partition with LVM
References: <Pine.LNX.4.20.0002041218580.416-100000@claudius.mgmt-inc.com> <20000207103719.A1170@suse.de> <389EF4DE.68165A11@osp.nl> <000d01bf7196$61aca240$d700a8c0@alizes.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Denis JARRIL <djarril@alizes.com>
Cc: linux-lvm@msede.com

In HP-UX, your boot lvol (/stand) must be an HFS, and it must *not* be
striped. It may be mirrored, but to boot from the mirrored lvol you must
create a complete secondary boot disks (using pvcreate -B and then after
having created the mirrors running lvlnboot).

In my opinion, mirroring should be made a part of the LVM because then
the LVM will be in complete control of the mirrors, which allows other
nice things such as lvsplit/lvmerge and others.

++Jos

Denis JARRIL wrote:
> 
> I don't agree.
> With HP-UX, you can boot from anywhere. You just have to create a contiguous
> and HFS LV to boot on. I don't know where the problem comes from on Linux
> but I tried to make a root miror and it didn't work. The test of the md
> volumes was good but the system stopped just after, when it passes from the
> ramdisk to the disk. Bad thing. If this problem is resolved, LVM on Linux
> will be able to work.
> 
> ----- Message d'origine -----
> De : Jos Visser <josv@osp.nl>
> � : <Fabian.Herschel@suse.de>
> Cc : <linux-lvm@msede.com>
> Envoy� : lundi 7 f�vrier 2000 17:37
> Objet : Re: [linux-lvm] Configuring boot partition with LVM
> 
> >  Lilo
> > should also learn how to boot a kernel fom a striped volume...
> 
> Hi,
> 
> I don't think you fully appreciate the request you're making here.
> Commercial Unices such as HP-UX and Solaris can not boot from striped
> volumes for about the same reasons why it would be difficult to have
> LILO read from a striped volume: the implications are just too
> horrendous to comtemplate.
> 
> Typically I don't care that my boot partition/lv can not be striped. The
> I/O rates into that volume are just not high enough to need striping.
> Why not put our efforts to something else which is more important right
> now.?
> 
> ++Jos
> 
> --
> All the rivers run into the sea; yet the sea is not full; unto
> the place from whence the rivers come, thither they return again.

-- 
All the rivers run into the sea; yet the sea is not full; unto
the place from whence the rivers come, thither they return again.
