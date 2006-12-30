Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBU2IASP031146
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 21:18:10 -0500
Received: from mta17.adelphia.net (mta17.mail.adelphia.net [68.168.78.99])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBU2HrZv018830
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 21:18:09 -0500
Received: from [192.168.1.13] (really [68.71.105.29]) by mta13.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20061230021731.KGPM2904.mta13.adelphia.net@[192.168.1.13]>
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 21:17:31 -0500
Message-ID: <4595CC40.2040500@adelphia.net>
Date: Fri, 29 Dec 2006 21:17:36 -0500
From: Toby Bluhm <tkb9@adelphia.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Hot backup for boot/root disk
References: <45942F64.9050502@hacksaw.org>
In-Reply-To: <45942F64.9050502@hacksaw.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hacksaw wrote:
> I have a Linux system with 2 identical disks for the OS portion. The 
> goal is to have them essentially mirrored, but not continuously. I want 
> to be able to rsync them on occasion.
> 
> I need this disk to be bootable on a moments notice, in case the main 
> one dies.
> 
> The layout of the current boot disk is a partition for /boot which is 
> ext3, and then the rest as a LVM set, of essentially one large partition.
> 
> My first thought is to create the second disk pretty much as the first 
> was created, do the rsyncs, and make some script that will maintain the 
> configuration files which mention the physical disks.
> 
> I have to admit that it's unclear what they all are.
> 
> In fact, I'd prefer something clever with disk labels.
> 
> In the best of all possible worlds, the system would recognize the 
> bootable partitions, and fail over to the backup one if there was a 
> problem with the main one.
> 
> I would appreciate some advice here. I need this machine to go live in a 
> few days, as the server it's replacing is close to just falling over 
> after more than 6 years of active service, all honor to it.
> 

Some people like using LVM for system/OS disks - I don't. So I would
ditch the LVM and use software raid1. I don't understand why you
wouldn't want the disks to be constantly in sync. What if they're out of
sync when a disk dies? However, you could break and rebuild the mirror
at your whim when using sw raid.


--Toby
