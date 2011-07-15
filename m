Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6FE4C6G015806
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 10:04:12 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6FE4BMb018338
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 10:04:11 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=flexo.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Qhizx-0001PL-LO
	for linux-lvm@redhat.com; Fri, 15 Jul 2011 15:04:10 +0100
Message-ID: <4E2048D2.6060909@ankh.org>
Date: Fri, 15 Jul 2011 15:04:02 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <CAH5HgO9aRwAsjH2hprM=HhnKhZV4h1hewNp8G_VEm0Fvs8bptQ@mail.gmail.com>
In-Reply-To: <CAH5HgO9aRwAsjH2hprM=HhnKhZV4h1hewNp8G_VEm0Fvs8bptQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Recovery from a failed motherboard
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tom Epperly wrote:
> I am wondering if there is a way I can plug these two physical disks
> into another Linux box and access the file system that's on the
> logical volume group. I looked at the LVM FAQ about moving groups, but
> it assumes you can run commands on the old system before moving to the
> new system. In this case, the old system is gone.
>   
That is not a problem, it just helps if you export them first, as then 
they will not clash with any existing volume group, if you have 
different volume group names, just plug them into the new machine. On 
booting you might just get lucky and it will activate the volume group. 
If you have the same names, your need to boot from a rescue disk, then 
rename the volume group to something else (vgrename). Then they should 
work fine with the alternative system. If you don't have root on LVM 
your alternative systems "rescue" mode might be enough to bring things 
online.

If you do boot from a rescue disk you can use
pvscan
vgscan
vgchange -a y

To bring up the disks if it does not do it automatically. You need to do 
a vgchange -a n before you can rename a volume group.

You rescue disk may require you to type

lvm pvscan
lvm vgscan

etc. Some

James
