Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6RDfVvt013466
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:41:31 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6RDfEIq010731
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:41:15 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n6RDbXrW017837
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 07:37:33 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6RDfARQ215670
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 07:41:10 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6RDf9j4030475
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 07:41:09 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6RDf9Xp030470
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 07:41:09 -0600
Date: Mon, 27 Jul 2009 06:41:09 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] lvm2 confused about double UUID
Message-ID: <20090727134109.GC3136@us.ibm.com>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
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

Christian Kujau [lists@nerdbynature.de] wrote:
> The subject says LVM is confused, but maybe it's me who is confused:
> 
> I once had a PV made from a single /dev/sdb and all was well. This sdb 
> however was really a 2 disk RAID1 which is now split up, the system now 
> sees both disks, sdb and sdc. Of course, sdb and sdc still have the same 
> UUID:
> 
> # blkid  | egrep 'sd[bc]'
> /dev/sdb1: UUID="1O2Tkq-9Jy8-VfuZ-uzFh-1f6v-iVBD-hcK6Vq" TYPE="lvm2pv" 
> /dev/sdc1: UUID="1O2Tkq-9Jy8-VfuZ-uzFh-1f6v-iVBD-hcK6Vq" TYPE="lvm2pv"
> 
> I decided to continue to use the VG that was set up on the PV, but since 
> lvm comlained[0] about finding the same UUID on more than one device, I 
> tried to instruct lvm to just use sdb for the VG:
> 
> # grep filter /etc/lvm/lvm.conf | grep -v \#
>    filter = [ "r|^/dev/sdc1$|", "r|/dev/.*/by-path/.*|", \
>               "r|/dev/.*/by-id/.*|", "a/.*/" ]
> 
> Now everything looks fine, no more lvm warnings, vg02 seems to use sdb1, 
> exactly as I wanted:
> 
> # pvs
>   PV         VG   Fmt  Attr PSize   PFree  
>   /dev/sda2  vg01 lvm2 a-   111.67G   9.27G
>   /dev/sdb1  vg02 lvm2 a-   931.46G 137.46G

I believe, "pvs" always rescans and just prints names it finds. It
doesn't really tell what is used. To really know what disk is really
being used, you need to get down to 'device mapper' level. Run 'dmsetup
table' and see what disks are actually used. You can post the output
here.

--Malahal.
