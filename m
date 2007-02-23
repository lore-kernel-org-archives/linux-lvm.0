Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1NHWSJ7022095
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 12:32:28 -0500
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1NHWODL000935
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 12:32:24 -0500
Received: from soda (unknown [86.59.100.100])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B9A92E084DA
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 18:32:18 +0100 (CET)
Date: Fri, 23 Feb 2007 18:32:20 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] moving logical volumes to another system *remotely*
	-	how?
Message-ID: <20070223173220.GD9124@soda.linbit>
References: <45DED477.8040809@wpkg.org>
	<20070223124452.GB22388@homer.panici.net>
	<45DF0F5B.6000506@wpkg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45DF0F5B.6000506@wpkg.org>
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
To: linux-lvm@redhat.com

/ 2007-02-23 16:59:23 +0100
\ Tomasz Chmielewski:
> paddy@panici.net schrieb:
> >On Fri, Feb 23, 2007 at 12:48:07PM +0100, Tomasz Chmielewski wrote:
> >>I have a server which stores several LVM-2 logical volumes.
> >>
> >>As this system is pretty loaded, I'd like to move some of the logical
> >>volumes to another machine. It has to be done remotely, so I can't do it
> >>as described in the LVM HOWTO (where one basically adds/replaces disks in one machine).
> >>
> >>My common sense tells me that I should:
> >>
> >>1. Unmount/not use the logical volumes on the source server
> >>2. Make volumes of the same size on the target server
> >>3. Copy it somehow over network
> >>
> >>
> >>I'm not sure of 2 (make volumes of exactly the same size) 
> >check your PE size, otherwise does what it says on the tin.
> 
> Hmm, how? I just want to move some (not all) logical volumes.
> 
> I guess fdisk is a good idea?
> 
> # fdisk -l /dev/LVM2/ocsi1
> 
> Disk /dev/LVM2/ocsi1: 3221 MB, 3221225472 bytes
> 
> 
> 3221225472 / 1024 = 3145728
> 
> 
> lvcreate -L3145728k -n ocsi1 LVM2
> 
> Hmm, hopefully, it's the right size?


how about:
lvs --units k

> >>and 3 (how to copy it all over network, if possible, using SSH only).
> >netcat and dd over forwarded port
> 
> Thanks for the idea.

dd if=/dev/$vg/$lv bs=32M |
	buffer -S 10m -s 512k |
	gzip -1 |
ssh -T $target -- \
	"gunzip |
	buffer -s 512k |
	dd bs=32M of=/dev/$t_vg/$t_lv"

-- 
: Lars Ellenberg                            Tel +43-1-8178292-55 :
: LINBIT Information Technologies GmbH      Fax +43-1-8178292-82 :
: Vivenotgasse 48, A-1120 Vienna/Europe    http://www.linbit.com :
