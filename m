Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAF4Qu8q027721
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 23:26:56 -0500
Received: from mail8.sea5.speakeasy.net (mail8.sea5.speakeasy.net
	[69.17.117.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAF4Qnu0028980
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 23:26:50 -0500
Received: from dsl093-060-083.pit1.dsl.speakeasy.net (HELO [192.168.0.5])
	([66.93.60.83]) (envelope-sender <jerith@speakeasy.org>)
	by mail8.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-lvm@redhat.com>; 15 Nov 2006 04:26:44 -0000
Date: Tue, 14 Nov 2006 23:26:55 -0500 (EST)
From: Matt McHenry <jerith@speakeasy.org>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
In-Reply-To: <20061114184712.GJ30653@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.64.0611142320560.8557@localhost>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<20061114183159.GI30653@agk.surrey.redhat.com>
	<Pine.LNX.4.58.0611141334290.18875@shell3.speakeasy.net>
	<20061114184712.GJ30653@agk.surrey.redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


> Use vgreduce to remove sda12 from the volume group.
> Then edit the partition table to put things back i.e. delete 12 and
> extend 11, then reboot.
> (You may have some data corruption from what got written to sda12.)

 	I was still a bit nervous about this suggestion.  As it happens, 
the only LV that was using sda11 was 'gen-website', which (as the name 
suggests) can be regenerated from other data.  So instead, I just deleted 
the 'gen-website' LV.  That allowed me to delete and re-create both the 
sda11 and sda12 PVs.  This seems to have fixed everything.  I was able to 
recreate the 'gen-website' LV and create my long-awaited 'dvd' LV as well.

 	Thanks again to Alasdair and Jonathan for all the help and 
patience!

----------------------
Matt McHenry
http://www.speakeasy.org/~jerith/
jerith@speakeasy.org
be052@scn.org
