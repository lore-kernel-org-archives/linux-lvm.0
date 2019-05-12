Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95C0418205
	for <linux-lvm@redhat.com>; Sun, 12 May 2019 00:09:14 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6060A8667B
	for <linux-lvm@redhat.com>; Sun, 12 May 2019 00:09:13 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id r76so7950668lja.12
	for <linux-lvm@redhat.com>; Sat, 11 May 2019 17:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
In-Reply-To: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sat, 11 May 2019 19:09:00 -0500
Message-ID: <CAAMCDecEcAyXpjbv6j740SUHeOJJjT8q96_B=4Mv3mm6HvuvGg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] recover volume group & locical volumes from PV?
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

check to see if there are LVM copies in
/etc/lvm/{archive,backup,cache}. if you find one that looks right then
you can use vgcfgrestore to put it back onto the correct pv.  The
copies should document the last command ran before the copy was made,
you need to make sure that no critical commands were run after the
copy was made for it to be the right copy.  The file will have the
full layout of the vg/pv/lv in it, and contains all of information
that made the pv/vg/lv.

On Sat, May 11, 2019 at 5:49 PM "Rainer F=C3=BCgenstein" <rfu@oudeis.org> w=
rote:
>
> hi,
>
> I am (was) using Fedora 28 installed in several LVs on /dev/sda5 (=3D PV),
> where sda is a "big" SSD.
>
> by accident, I attached (via SATA hot swap bay) an old harddisk
> (/dev/sdc1), which was used about 2 months temporarily to move the volume
> group / logical volumes from the "old" SSD to the "new" SSD (pvadd,
> pvmove, ...)
>
> this combination of old PV and new PV messed up the filesystems. when I
> noticed the mistake, I did a shutdown and physically removed /dev/sdc.
> this also removed VG and LVs on /dev/sda5, causing the system crash on
> boot.
>
> the layout was something like this:
>
> /dev/sda3 =3D=3D> /boot
> /dev/fedora_sh64/lv_home
> /dev/fedora_sh64/lv_root
> /dev/fedora_sh64/lv_var
> ...
>
> [root@localhost-live ~]# pvs
>   PV         VG Fmt  Attr PSize   PFree
>   /dev/sda5     lvm2 ---  <47.30g <47.30g
>
> [root@localhost-live ~]# pvdisplay
>   "/dev/sda5" is a new physical volume of "<47.30 GiB"
>   --- NEW Physical volume ---
>   PV Name               /dev/sda5
>   VG Name
>   PV Size               <47.30 GiB
>   Allocatable           NO
>   PE Size               0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               EOi5Ln-W26D-SER2-tLke-xNMP-Prgq-aUfLPz
>
> (please note "NEW Physical Volume" ?!?!)
>
> [root@localhost-live ~]# vgdisplay
> [root@localhost-live ~]# lvdisplay
>
> [root@localhost-live ~]# pvscan
>   PV /dev/sda5                      lvm2 [<47.30 GiB]
>   Total: 1 [<47.30 GiB] / in use: 0 [0   ] / in no VG: 1 [<47.30 GiB]
>
> [root@localhost-live ~]# pvck /dev/sda5
>   Found label on /dev/sda5, sector 1, type=3DLVM2 001
>   Found text metadata area: offset=3D4096, size=3D1044480
>
> after re-adding the old /dev/sdc1 disk, VG and LVs show up, filesystems a
> bit damaged, but readable. content is about two months old.
>
> [root@localhost-live ~]# pvs
>   PV         VG              Fmt  Attr PSize    PFree
>   /dev/sda5                  lvm2 ---   <47.30g <47.30g
>   /dev/sdc1  fedora_sh64     lvm2 a--  <298.09g 273.30g
>
> is there any chance to get VG and LVs back?
>
> thanks in advance.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
