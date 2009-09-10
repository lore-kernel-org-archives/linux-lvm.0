Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8A8ZVFs023137
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 04:35:31 -0400
Received: from mail-fx0-f205.google.com (mail-fx0-f205.google.com
	[209.85.220.205])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8A8ZCXk021786
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 04:35:13 -0400
Received: by fxm1 with SMTP id 1so4439363fxm.7
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 01:35:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090910063511.GA7247@maude.comedia.it>
References: <352f9c2a0909092319h2e115e07lbf867825c68c102e@mail.gmail.com>
	<20090910063511.GA7247@maude.comedia.it>
Date: Thu, 10 Sep 2009 11:35:10 +0300
Message-ID: <352f9c2a0909100135i64ac861awaf7089ea27c1b3b3@mail.gmail.com>
Subject: Re: [linux-lvm] Understanding if a disk is partioned with LVM or not
From: pent 5971 <pent5971@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
Luca thanks for your answer . the disk seems to be regular one. So for
the new added disk
i have followed the
http://jamesthornton.com/redhat/linux/7.3/Reference-Guide/s1-filesystem-ext3-create.html
 and rebooted the server (edited the fstab ). But the disk doesnt seem
to be
mounted . So what can be the problem?

Regards

2009/9/10, Luca Berra <bluca@comedia.it>:
> On Thu, Sep 10, 2009 at 09:19:29AM +0300, pent 5971 wrote:
>>Hi,
>>Im new to this LVM stuff and still couldnt read and understand enough.
>>But i have a RHEL 5x box (which i didnt installed) and we have
>
> rhel uses lvm by default
>>phsically added a new disk which i have to create a file system to be
>>able to use it.  df -h command gives normal /var /data / partions, but
> first column of df output is the device, if it looks like /dev/sd?? or
> /dev/hd?? it is a normal partition
> if it looks like /dev/mapper/xxxxx-yyyy or /dev/xxxxx/yyyy it is
> probably an lvm
> also the commands vgs, lvs, and pvs help, i.e.
> root@Moskowskaya # vgs
>    VG   #PV #LV #SN Attr  VSize   VFree
>    vg00   1   7   0 wz--n 232.81G 10.81G
> root@Moskowskaya # pvs
>    PV         VG   Fmt  Attr PSize   PFree
>    /dev/sda   vg00 lvm2 a-   232.81G 10.81G
>
>
>>id like ask how can i understand if the first disk/sytem is created
>>with LVM , and if so (any other box can be so in the future) what is
>>best way to add the disk and crete the file system?
> woah, well, the simple answer is: there is no best way, you have to
> evaluate the pros and cons yourself.
>
> you could add the new disk to the existing volume group, which would
> give you the advantage of using avaliable space as a single pool and
> being able to create/extend existing logical volumes/filesystems using
> both disks. with the disadvantage of being more painful to recover in
> case one of the disks fails.
> you could create a new volume group using the new disk, or create a
> partition if you are more confortable, or even use the whole device for
> the new filesystem.
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>          Communication Media & Services S.r.l.
>   /"\
>   \ /     ASCII RIBBON CAMPAIGN
>    X        AGAINST HTML MAIL
>   / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
