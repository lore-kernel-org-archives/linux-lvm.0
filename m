Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2ABTB803149
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 06:29:11 -0500
Received: from zaphod.bangor.ac.uk (zaphod42.bangor.ac.uk [147.143.42.245])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2ABT807022145
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 06:29:08 -0500
Received: from sbs.bangor.ac.uk (milliways [147.143.41.38])
	by zaphod.bangor.ac.uk (Postfix) with ESMTP id 49088182D4
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:29:07 +0000 (GMT)
Message-ID: <404EFC03.5030006@sbs.bangor.ac.uk>
From: Simeon Walker <simeon@sbs.bangor.ac.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] unknown ioctl problems
References: <871xpynzwy.fsf@freezer.burling>
In-Reply-To: <871xpynzwy.fsf@freezer.burling>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 06:27:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Jason Parker-Burlingham wrote:

>I'm running LVM (version 1 with 1.0.7 tools) on a 2.4 system
>(2.4.24-pre1, recently upgraded to 2.4.25-pre4).  When the initrd
>boots (/ is an LVM filesystem, /boot is a standard block device) I see 
>
>   lvm -- lvm_blk_ioctl: unknown cmd 0x5310
>
>which I guess is something to do with mounting the ramdisk.
>
>But at other times I have noticed that the machine will lock up; I'm
>not sure if it's a hardware problem but lately it seems to be related
>to disk activity.  I turned off screen blanking before the most recent
>crash and saw no kernel oops, but a couple of repetitions of
>
>   lvm -- lvm_blk_ioctl: unknown cmd 0x801c6d02
>
>Is it possible that this is some sort of reasonable ioctl?  Is it
>possible that this is what's crashing the machine?  How can I find out
>what the system is trying do (and maybe even why)?  I don't see any
>reports of exactly this problem through google, so I'm pretty lost.
>
>jason
>  
>
I have just seen your latter problem. I am running Debian unstable (as 
of late Feb) and building Kernel 2.4.24. I use debian's make-kpg, when 
doing dpkg -i I get the above error. Because I had not yet installed the 
matching modules package (for i2c) I get some unresolved symbols. The 
lockup seems to occur during or just after the depmod. I'm still looking 
into it...

Sim

-- 
Simeon Walker,                      email: simeon@sbs.bangor.ac.uk
School of Biological Sciences,      phone: +44 (0)1248 383702
University of Wales, Bangor,        fax: +44 (0)1248 382569
Gwynedd, LL57 2UW, UK.              www: http://biology.bangor.ac.uk/
