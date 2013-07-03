Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r63Dwx7K010393
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 09:58:59 -0400
Received: from nm19-vm6.access.bullet.mail.gq1.yahoo.com
	(nm19-vm6.access.bullet.mail.gq1.yahoo.com [216.39.63.167])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r63DwvYS032739
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 09:58:58 -0400
References: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
	<1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
	<51D4222E.1020809@deriva.de>
Message-ID: <1372859936.18752.YahooMailNeo@web181505.mail.ne1.yahoo.com>
Date: Wed, 3 Jul 2013 06:58:56 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <51D4222E.1020809@deriva.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is cLVM necessary when accessing different logical
	volumes on a shared iSCSI target?
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

>>  1) edit lvm.conf and disable all metadata caching

> 
> I have searched the lvm documentation, but could not find anything about 
> metadata caching.

write_cache_state = 0
use_lvmetad = 0


I also move the cache_dir out of /etc to a ephemeral location. /var/lock is tmpfs on my machines.
cache_dir = "/var/lock/subsys"


>>  2) edit lvm.conf and set the locking style to '4' and set 
> wait_for_locks=0
> 
> The clients have a local volume group besides the shared one. Setting the 
> locking style to 4 prevents
> modification of this local volume group, too, so it does not seem to be an 
> option.


You need 2 different lvm.conf's. Use the filter directive so that one can only see the local devices, and the other one only the shared devices.

filter = [ "a|local_devices|", ... "r|shared_devices" ]

vs
filter = [ "a|shared_devices|", ...�"r|local_devices"�]

Run pvscan and pvs and make sure the exclusions are happening correctly.

> Each LV is statically assigned to one single host.


That's an important distinction! You can use just a single lvm.conf and a well crafted volume_list. I haven't played with tags but that might be rather useful as well.


volume_list = [ "vglocal", "vg_shared/lv_mine", "@mytag1" ]


> As I tried to describe above, the hosts do not behave as master or slave.�


Nevermind then. I was implementing a full-on Active/Active storage head that could take over each other's volumes at will.

> Is this possible with or without cLVM?

without.
