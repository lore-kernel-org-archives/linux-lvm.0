Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1437Ave001482
	for <linux-lvm@redhat.com>; Sun, 3 Feb 2008 22:07:10 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1436nhU015181
	for <linux-lvm@redhat.com>; Sun, 3 Feb 2008 22:06:50 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.68 #1 (Debian))
	id 1JLrfU-0006Qk-PW
	for <linux-lvm@redhat.com>; Sun, 03 Feb 2008 19:06:48 -0800
Date: Sun, 3 Feb 2008 19:06:48 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
Message-ID: <20080204030648.GA24285@old.davidb.org>
References: <1202005131.5857.18.camel@localhost.localdomain>
	<47A53FC6.2040007@gmail.com>
	<20080203122106.GD8075@agk.fab.redhat.com>
	<1202062464.14540.27.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1202062464.14540.27.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Feb 03, 2008 at 07:14:24PM +0100, Eckhard Kosin wrote:

>I just changed the filter rule to
>  
>  filter = [ "r|/dev/cdrom|", "r|^/dev/hda[1,6,7]$|" ]
>
>Now, hda10 will be found, but I get the "Incorrect metadata area header
>checksum" complain from the scanning of hda7:  A citation from the
>output of "vgdisplay -vvv":
>
>...
>        Opened /dev/hda7 RO O_DIRECT
>        /dev/hda7: block size is 1024 bytes
>      /dev/hda7: lvm2 label detected
>        Closed /dev/hda7
>        lvmcache: /dev/hda7 now orphaned
>        Opened /dev/hda7 RO O_DIRECT
>        /dev/hda7: block size is 1024 bytes
>  Incorrect metadata area header checksum
>        Closed /dev/hda7
>        Opened /dev/vg_uhu00/var_cache_rsnapshot RO O_DIRECT

Ok, the problem here isn't that you should have to create filter rules to
eliminate these volumes, but that it thinks it is finding an lvm2 label on
the volume.

I'm going to guess that at some point, these partitions had an LVM label on
them, and then a regular filesystem was placed on them.  Several
filesystems don't overwrite the first 1k or so of the volume, so the label
isn't going to be obliterated, just corrupted.

Can you do something like:

   dd if=/dev/hda7 bs=1k count=1 | hexdump -C

You'll probably find that there is a lvm2 label there.  I'm not sure of a
safe way of elminiating it.

David
