Received: from [172.16.59.2] (dogpound.rdu.redhat.com [172.16.59.2])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j9RCTxff000943
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 08:29:59 -0400
Message-ID: <4360C635.60307@redhat.com>
Date: Thu, 27 Oct 2005 08:21:09 -0400
From: Josef Whiter <jwhiter@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing LVM Revisited
References: <43609147.7090205@snow.email.ne.jp>
In-Reply-To: <43609147.7090205@snow.email.ne.jp>
Content-Transfer-Encoding: 7bit
Reply-To: linux-lvm@redhat.com
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

Mark Sargent wrote:

> Hi All,
>
> to resize a LV in CentOS4.0, I had to use the 1st install CD and Linux 
> Rescue. I then had to umount /mnt/sysimage/dev, /mnt/sysimage/proc, 
> /mnt/sysimage/boot, /mnt/sysimage/sys before I could umount 
> /mnt/sysimage. After doing this, I lose the commands, vgscan, lvscan 
> and resize2fs. Why is this, and how can I get around it.? Cheers.
>
> Mark Sargent.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Hello,

It sounds like rescue mode doesn't come with its own copy of the lvm and 
ext2 commands, which I find odd.  Did you chroot /mnt/sysimage?  If so 
don't do that, in fact there should be an option when you are booting 
into rescue mode where you can tell it to skip finding/mounting your 
OS.  Try that and see if you have your commands.  If not, I know that 
the Fedora rescue disk has these commands, and rescue mode is rescue 
mode so it still should work, just burn the first FC4 cd and use that 
rescue mode.  Thank you,

Josef

-- 
Josef Whiter, RHCE
Global Support Services
Red Hat, Inc.
919-754-3700 x44429
