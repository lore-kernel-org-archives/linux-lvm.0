Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88Cj0KN002679
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 08:45:00 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88CisRs023802
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 08:44:54 -0400
Received: from [192.168.0.2] (c-24-13-74-194.hsd1.il.comcast.net
	[24.13.74.194]) (authenticated bits=0)
	by mailmx.futuresource.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88CirIj000335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 07:44:53 -0500
Subject: Re: [linux-lvm] lvm on centos with raid1 and grub
From: Les Mikesell <lesmikesell@gmail.com>
In-Reply-To: <45012C0E.9080509@ambra.ro>
References: <45012C0E.9080509@ambra.ro>
Message-Id: <1157719492.27155.3.camel@les-home.futuresource.com>
Mime-Version: 1.0
Date: Fri, 08 Sep 2006 07:44:53 -0500
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2006-09-08 at 03:38, Sterpu Victor wrote:
> After a reboot I couldn't boot from none of my hdd's.
> I receive just a grub console. Now I must reinstall grub, but in order 
> to do this I need to know the name of the root partion in the LVM.
> To find out this I moved one of the hdd's in another computer and I 
> tried to mount the LVM partition.
> 
> I do "modprobe dm-mod" and when I do "vgchange -ay" I get the message:
>   File descriptor 3 left open
>   File descriptor 5 left open
>   File descriptor 7 left open
>   No volume groups found
> I have no LVM devices in /dev.
> The alternative is to reinstall the OS, but....
> 

The first thing to try is booting the Centos install
CD with 'linux rescue' at the boot prompt.  If it
detects the existing installation it will mount it and
suggest that you 'chroot /mnt/sysinstall' after which
you will be able to see your old /etc/grub.conf and
have all the usual tools to reinstall grub.

-- 
  Les Mikesell
   lesmikesell@gmail.com
