Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2MGplOd011498
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2011 12:51:47 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2MGpdCD001922
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2011 12:51:39 -0400
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p2MGoeQ6032750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2011 11:50:40 -0500
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p2MGpaBv018109
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2011 11:51:37 -0500
Message-ID: <4D88D398.9060003@gmail.com>
Date: Tue, 22 Mar 2011 11:51:36 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net>
	<20110314171726.GA18249@redhat.com>	<4D812183.6000901@cfl.rr.com>
	<20110316225539.GA3662@redhat.com>	<4D8151EF.5020301@cfl.rr.com>	<yq1vczivauz.fsf@sermon.lab.mkp.net>
	<4D829D86.3050001@cox.net> <20110322102322.GK21093@nb.net.home>
In-Reply-To: <20110322102322.GK21093@nb.net.home>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
To: linux-lvm@redhat.com

On 3/22/2011 5:23 AM, Karel Zak wrote:
>
> It seems (according to feedback from users) that newer WDxxEARS disks
> are already fixed.
> http://community.wdc.com/t5/Desktop/Problem-with-WD-Advanced-Format-drive-in-LINUX-WD15EARS/m-p/20675#M1245
>
>
> Try
>
>    hdparm -I /dev/<disk>
>
> to see more details, for example:
>
>      Logical  Sector size:                   512 bytes
>      Physical Sector size:                  4096 bytes
>
> and
>
>     # cat /sys/block/<disk>/queue/physical_block_size
>     4096

This isn't exactly an LVM issue (but I suppose it could be, and at least 
some people understand the problem here...).  I'd like to do RAID1 with 
a WD 'Scorpio' laptop-size 750 gig drive which has 4k sectors but 
reports 512 as both the physical and logical size as one member with a 
full size Seagate with a matching number of sectors as the other.  And 
I'd like to periodically swap the small drive, rotate offsite, and 
resync a different one.   As things stand, it would take days for this 
sync to complete so I've been using full size drives for both instances. 
   Is there some hope of getting the sync time down to 8 hours or so? 
And is that going to involve both updating to a fairly recent Linux 
distro (it's Centos 5.x now) and starting from scratch with new 
partition alignment?

For full disclosure, this is a backuppc archive with a bizallion 
hardlinks that would take many days to copy with a file-oriented 
approach and it's really a 3-member raid1 where 2 drives are always 
present and one swapped in long enough to resync.  But those things 
shouldn't matter except for the difficulty in changing the partition 
alignment.  The existing one runs to the end of the disk so I can't 
offset the start and still match up in size.

-- 
   Les Mikesell
    lesmikesell@gmail.com
