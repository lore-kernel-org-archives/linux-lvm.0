Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8A6ZSLF002129
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 02:35:28 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8A6ZCCH029448
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 02:35:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 5FF6C86F12
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 08:35:11 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id pRglBSLRustq for <linux-lvm@redhat.com>;
	Thu, 10 Sep 2009 08:35:11 +0200 (CEST)
Date: Thu, 10 Sep 2009 08:35:11 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Understanding if a disk is partioned with LVM or not
Message-ID: <20090910063511.GA7247@maude.comedia.it>
References: <352f9c2a0909092319h2e115e07lbf867825c68c102e@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <352f9c2a0909092319h2e115e07lbf867825c68c102e@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Sep 10, 2009 at 09:19:29AM +0300, pent 5971 wrote:
>Hi,
>Im new to this LVM stuff and still couldnt read and understand enough.
>But i have a RHEL 5x box (which i didnt installed) and we have

rhel uses lvm by default
>phsically added a new disk which i have to create a file system to be
>able to use it.  df -h command gives normal /var /data / partions, but
first column of df output is the device, if it looks like /dev/sd?? or
/dev/hd?? it is a normal partition
if it looks like /dev/mapper/xxxxx-yyyy or /dev/xxxxx/yyyy it is
probably an lvm
also the commands vgs, lvs, and pvs help, i.e.
root@Moskowskaya # vgs
   VG   #PV #LV #SN Attr  VSize   VFree
   vg00   1   7   0 wz--n 232.81G 10.81G
root@Moskowskaya # pvs
   PV         VG   Fmt  Attr PSize   PFree
   /dev/sda   vg00 lvm2 a-   232.81G 10.81G


>id like ask how can i understand if the first disk/sytem is created
>with LVM , and if so (any other box can be so in the future) what is
>best way to add the disk and crete the file system?
woah, well, the simple answer is: there is no best way, you have to
evaluate the pros and cons yourself.

you could add the new disk to the existing volume group, which would
give you the advantage of using avaliable space as a single pool and
being able to create/extend existing logical volumes/filesystems using
both disks. with the disadvantage of being more painful to recover in
case one of the disks fails.
you could create a new volume group using the new disk, or create a
partition if you are more confortable, or even use the whole device for
the new filesystem.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
