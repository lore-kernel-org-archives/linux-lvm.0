Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k137Vb130357
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 02:31:37 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k137VZZS018480
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 02:31:36 -0500
Date: Fri, 3 Feb 2006 08:31:27 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Ubuntu distro with lvm2, raid 1, not booting anymore.
Message-ID: <20060203073127.GD5971@percy.comedia.it>
References: <43E254B5.5080107@poczta.onet.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43E254B5.5080107@poczta.onet.pl>
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

On Thu, Feb 02, 2006 at 07:51:33PM +0100, Maciej S?ojewski wrote:
>Welcome!
>
>I have the serious problem with booting of my machine. It is run on 
>Ubuntu distro (5.10), with lvm2 raid 1 on two identical sata hard disks. 
>Lilo bootloader. The problem is that after small change in lilo.conf and 
>running /sbin/lilo my system is no longer bootable. I see 'kernel panic' 
>message. When I try to run lilo again (from Ubuntu Live! cd) I see some 
>comments somehow related to dev-mapper:
>
>Warning: /proc/partitions does not match /dev directory structure
>Name change: /dev/cloop 0 -> /tmp/dev.0
>(...)
>Fatal: is_primary: Not a valid device

what is exactly that you are doing to reinstall lilo?
i don't use ubuntu, but generally:
you should mount your original root fs on, say, /root
mount --bind /dev /root/dev
mount --bind /proc /root/proc
mount --bind /sys /root/sys
chroot /root /sbin/lilo


>
>I will quote the kernel messages:
>RAMDISK: ran out of compressed data
>invalid compressed format (err=1)
looks like your initrd is hosed
check that lilo is pointing to a correct initrd and/or regenerate
initrd. (no i don't remember the debian way to regenerate initrd)

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
