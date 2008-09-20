Received: from [192.168.1.104] (vpn-12-138.rdu.redhat.com [10.11.12.138])
	by int-mx01.intranet.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id m8K3e5YC010898
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 23:40:06 -0400
Message-Id: <C6403FD1-E3EE-45EC-B294-F8C55FB07896@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <1221861679.4718.1.camel@localhost>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Mirrored LV
Date: Fri, 19 Sep 2008 22:39:52 -0500
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
	<1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
	<1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
	<20080919173108.GA15000@us.ibm.com>
	<1221861679.4718.1.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Just to answer some questions:

You can use just 2 disks to create a mirror and a disk log:
prompt> lvcreate --alloc anywhere -m1 -L 500M -n my_lv my_vg

I wish the allocation policy 'normal' (which is the default) would  
also do this... but instead you must choose a looser allocation policy  
to get what you want.

The reason that you want the disk-based log is to prevent all the  
extra work when you machine comes up.

The reason that LVM wants a separate disk for the log is so the head  
on the storage device doesn't need to go ping-ponging around the  
device.  (The log is touched for almost every write.)  So, its a  
performance thing... and possibly a not-wear-out-your-hardware thing  
too.

It won't matter if the master disk with the log dies.  Your mirror  
will simply become a linear device composed of the last remaining disk  
anyway.

  brassow


On Sep 19, 2008, at 5:01 PM, Koen Vermeer wrote:

> Op vrijdag 19-09-2008 om 10:31 uur [tijdzone -0700], schreef
> malahal@us.ibm.com:
>> It needs it own PV. Create an extra partition on your master disk and
>> add the PV tou the volume group.  Then run lvcreate again with out
>> corelog option. By default the command would create a disklog. You  
>> can
>> also specify where you want your log.
>
> OK, did that! I guess I need one additional partition for each volume
> group, then.
>
> Now, what happens if the master disk (which includes the log) dies?
> Won't LVM complain that it cannot find the log? I'm not saying I  
> expect
> it too, but with this stuff I guess it's better to be safe than sorry!
>
> Best,
> Koen
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
