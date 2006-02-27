Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1RC9T103419
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 07:09:29 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1RC9SP5014426
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 07:09:28 -0500
Message-ID: <4402EBFE.3080807@gmx.net>
Date: Mon, 27 Feb 2006 13:09:34 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk size reporting.
References: <4402E842.9070509@watford53.freeserve.co.uk>
In-Reply-To: <4402E842.9070509@watford53.freeserve.co.uk>
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

Hi Jim,

Jim Ford schrieb:
> I think I've extended a logical volume correctly, but DF shows no change.
>=20
> lvs output:
>  LV     VG     Attr   LSize   Origin Snap%  Move Copy%
>  root   Ubuntu -wi-ao  25.13G
>  swap_1 Ubuntu -wi-ao 656.00M
>=20
> df output:
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/mapper/Ubuntu-root
>                      18715076   2909852  14854544  17% /
> tmpfs                   112264         0    112264   0% /dev/shm
> tmpfs                   112264     12588     99676  12%=20
> /lib/modules/2.6.12-10-386/volatile
> /dev/hda1               233335     19166    201721   9% /boot
>=20
> Have I extended my Ubuntu volume correctly, please?
>=20
> <sigh> Life was _so_ much simpler without lvm and udev! </sigh>
You just extended your volume, not your filesystem, don't you ;-). I=20
don't know, which filesystem Ubunto uses for root and if it's ext2/ext3,=20
if they use the online-resize patches.

So, seak for into how to resize/extend the filesystem you use.

Cheers
Klaus

--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
