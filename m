Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5KD2sH5029290
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 09:02:54 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.181])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5KD2rTq008355
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 09:02:54 -0400
Received: by py-out-1112.google.com with SMTP id b29so1476972pya
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 06:02:53 -0700 (PDT)
Message-ID: <5485940d0606200602w421d092bod9008cf67513ade9@mail.gmail.com>
Date: Tue, 20 Jun 2006 14:02:53 +0100
From: "C'est Pierre" <cestpierre@gmail.com>
Subject: Re: [linux-lvm] LVM and Device Mapper
In-Reply-To: <20060617004234.GB31760@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5485940d0606152014i4f309594o70efbe2568641b2a@mail.gmail.com>
	<4492B150.8070604@fastenal.com>
	<5485940d0606160814v2b7396a5ld96eb69e96bafe71@mail.gmail.com>
	<4492CC31.9060909@fastenal.com>
	<20060617004234.GB31760@percy.comedia.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank all of you for the support! I finally made it (I hope I have no
more questions to put up here ;-)

Pierre


On 6/17/06, Luca Berra <bluca@comedia.it> wrote:
> On Fri, Jun 16, 2006 at 10:20:17AM -0500, Kelly Sauke wrote:
> >C'est Pierre wrote:
> >> That kinda worked out. I tried your example as-is, and it still shows
> >> 'Found duplicate PV' messages and additionally it said "vg sucessfully
> >> created" but in fact, when I issue a vgdisplay, it doesn't show the vg
> >> created.
> >>
> >
> >Try excluding all of your sd paths in the filter line.  If you look at my
> >example, it seems my local disk /dev/sda2, my mpath devices and then it hides
> >everything else.  Thats how I got the 'Found duplicate PV' errors to go away.
> >
> >After setting that, run an lvmdiskscan to verify that its seeing your multipath
> >devices and excuding the sd devices.
>
> yes, please edit your filter line, so it will ignore the /dev/sd*
> devices
> >
> ....
> >>  (erased the other VG)
> >>  --- Volume group ---
> >>  VG Name               clusterfs
> >>  System ID
> >>  Format                lvm2
> >>  Metadata Areas        1
> >>  Metadata Sequence No  2
> >>  VG Access             read/write
> >>  VG Status             resizable
> >>  MAX LV                0
> >>  Cur LV                1
> >>  Open LV               0
> >>  Max PV                0
> >>  Cur PV                1
> >>  Act PV                1
> >>  VG Size               50.00 GB
> >>  PE Size               4.00 MB
> >>  Total PE              12799
> >>  Alloc PE / Size       25 / 100.00 MB
> >>  Free  PE / Size       12774 / 49.90 GB
> >>  VG UUID               QxEuzf-SJMU-mmlo-c4mr-6SLs-AU6X-X8A6Fi
> >>
> >>
> >> # lvdisplay
> >>  (skipped the others)
> >>  --- Logical volume ---
> >>  LV Name                /dev/clusterfs/ora1
> >>  VG Name                clusterfs
> >>  LV UUID                hAt2Tx-Tf2U-oD10-3W77-sIo6-Q3nf-5fG3AT
> >>  LV Write Access        read/write
> >>  LV Status              available
> >>  # open                 0
> >>  LV Size                100.00 MB
> >>  Current LE             25
> >>  Segments               1
> >>  Allocation             inherit
> >>  Read ahead sectors     0
> >>  Block device           253:8
> >>
> seems the lv was not activated, i don't know why, maybe some interaction
> with udev?
>
> >>
> >> # mkfs.ext3  /dev/clusterfs/ora1
> >> mke2fs 1.38 (30-Jun-2005)
> >> mkfs.ext3: Device size reported to be zero.  Invalid partition
> >> specified, or
> >>        partition table wasn't reread after running fdisk, due to
> >>        a modified partition being busy and in use.  You may need to reboot
> >>        to re-read your partition table.
> >>
> try vgchange -a y again after fixing your lvm.conf as explained above.
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
