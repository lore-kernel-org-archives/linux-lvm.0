Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6MFY7hp008151
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 16:34:07 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BnfaC-0005L4-86
	for linux-lvm@redhat.com; Thu, 22 Jul 2004 16:34:08 +0100
Date: Thu, 22 Jul 2004 16:34:08 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Message-ID: <20040722153408.GG10840@tykepenguin.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
Sender: Patrick <patrick@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jul 22, 2004 at 09:42:58AM -0400, Zachary Hamm wrote:
> 
> Hello, I'm running Fedora Core 2 on a Dell Poweredge 1750 with three 36G
> SCSI drives setup with two volumes, /boot and /, setup with software RAID 1
> with online spare.  This was setup at install, which reported no errors.
> I've done a yum update as well.
> 
> The problem is that only one of the to volume groups is recognized and
> mirrored (/boot), as apparently vgscan does not like the the large drives
> (which aren't that large...).   Any help is appreciated.
> 

It looks to me like you need to stop LVM looking at the "real" disks, and make
it only look at the MD devices.

Either add a filter like "a/md*/" or add "md_component_detection = 1" to the
devices section of the lvm.conf file - if you're running a recent lvm2
userspace.

-- 

patrick
