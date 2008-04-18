Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3ILqkEP005976
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:52:46 -0400
Received: from smtp05.atlngahp.sys.nuvox.net (smtp-out5.atlngahp.sys.nuvox.net
	[70.43.63.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3ILqAIr001831
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:52:30 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp05.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3ILpvLK002864
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:51:57 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 0F17F17C553
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:51:57 -0400 (EDT)
Message-ID: <480917FD.60002@Media-Brokers.com>
Date: Fri, 18 Apr 2008 17:51:57 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>
In-Reply-To: <48091663.2070404@Media-Brokers.com>
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

On 4/18/2008, Charles Marcus (CMarcus@Media-Brokers.com) wrote:
> 
> Ports 0 & 1 are mirrored, and contain:
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sda1               1         100      803218+  83  Linux
> /dev/sda2             101         163      506047+  82  Linux swap
> /dev/sda3             164        2654    20008957+  83  Linux
> /dev/sda4            2655       19450   134913870   83  Linux

Should have been more specific...

/dev/sda1 = /boot
/dev/sda2 = swap
/dev/sda3 = /
/dev/sda4 = /backups

> The other 6 are set up in a Raid 10, and contain:
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1               1       24900   200009218+  8e  Linux LVM
> /dev/sdb2           24901       58352   268703190   8e  Linux LVM 

These are:

/dev/sdb1 = /home, /usr, and /var
/dev/sdb2 = nothing (was being used for backups)

-- 

Best regards,

Charles
