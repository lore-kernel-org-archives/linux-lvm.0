Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA99iNwT008206
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2011 04:44:24 -0500
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA99iMd1027726
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2011 04:44:23 -0500
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1RO4Gu-0000BC-Jg
	for linux-lvm@redhat.com; Wed, 09 Nov 2011 09:16:40 +0000
Message-ID: <4EBA4B6F.5010905@ankh.org>
Date: Wed, 09 Nov 2011 09:44:15 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <1291287654.2006642.1320778326879.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <1291287654.2006642.1320778326879.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot unmount logical volume to reduce it
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

Dan White wrote:
> Thanks.  I'll try it and see what I get.
> I may be able to customize a rescue disc.
>   
IF you don't mount the disks, you may need to so a pvscan and a vgchange 
-a y

the other alturnative when you use a rescue disk is to just inmount the 
filesystems, you will not have a problem as the disks are not in use.

The third alturnative is to take out the disks from the fstab, and use 
grub to boot the machine single user however, newer OS like centos 6 
will not like this rather than dropping to a shell will just throw a 
wobbly and reboot.

James
