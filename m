Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8OGPtg8029822
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2010 12:25:55 -0400
Received: from smtp101.sbc.mail.re3.yahoo.com (smtp101.sbc.mail.re3.yahoo.com
	[66.196.96.84])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o8OGPhHN019008
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2010 12:25:43 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with ESMTP id 9C3174B0024F
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2010 09:25:41 -0700 (PDT)
Received: from pebblebeach.thenewhams.com ([127.0.0.1])
	by localhost (pebblebeach.thenewhams.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id JZJ3h54YAojl for <linux-lvm@redhat.com>;
	Fri, 24 Sep 2010 09:25:39 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with ESMTP id 7468F4B00250
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2010 09:25:39 -0700 (PDT)
Received: from [129.46.70.138] (129-46-70-138.qualcomm.com [129.46.70.138])
	by pebblebeach.thenewhams.com (Postfix) with ESMTPSA id 2469B4B0024F
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2010 09:25:39 -0700 (PDT)
Message-ID: <4C9CD102.4030207@thenewhams.com>
Date: Fri, 24 Sep 2010 09:25:38 -0700
From: Adam Newham <adam@thenewhams.com>
MIME-Version: 1.0
References: <4C9B91A5.5020908@thenewhams.com>
	<20100923211234.GA17638@maude.comedia.it>
In-Reply-To: <20100923211234.GA17638@maude.comedia.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small
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

  Many thanks for the assistance. With the this I should be pointed me 
in the right direction. As this now looks like a RAID related versus LVM 
issue I'll continue this on the RAID message list. For those interested, 
the thread can be found here:

http://marc.info/?l=linux-raid&m=128528502831454&w=2

Once again, thanks

On 09/23/2010 02:12 PM, Luca Berra wrote:
>> I also don't remember ever seeing /dev/md0p1 before, just a /dev/md0
> i guessed as much
>
>> root@adam-desktop:~# mdadm --examine --scan --verbose
>> ARRAY /dev/md0 level=raid5 num-devices=4
>> UUID=b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
>>     devices=/dev/sde,/dev/sdd,/dev/sdc,/dev/sdb
> the above is the wrong md0 using whole disks
>
> this one is the correct one
>> ARRAY /dev/md0 level=raid5 num-devices=4
>> UUID=08558923:881d9efd:464c249d:988d2ec6
>>     devices=/dev/sde1,/dev/sdd1,/dev/sdc1,/dev/sdb1
>>
>> root@adam-desktop:~# mdadm --examine --verbose /dev/sdb
>> root@adam-desktop:~# mdadm --examine --verbose /dev/sdc
>> root@adam-desktop:~# mdadm --examine --verbose /dev/sdd
>> root@adam-desktop:~# mdadm --examine --verbose /dev/sde
> you did not dump the partitions, but i guess you couldn't since the
> device files disappeared
>
>> root@adam-desktop:~# cat /proc/mdstat
>> Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5]
>> [raid4] [raid10]
>> md0 : active raid5 sde[3] sdb[0] sdc[1] sdd[2]
>>        2930287488 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]
>>
>> unused devices:<none>
>>
> put
> DEVICE /dev/sd?1
> ARRAY /dev/md0 level=raid5 num-devices=4 UUID=08558923:881d9efd:464c249d:988d2ec6
>
> into /etc/mdadm.conf (or /etc/mdadm/mdadm.conf, whatever ubuntu places
> it) and reboot, you should be able to see your data.
>
> after this ask on linux-raid ml for advice on how to zero the duplicate
> superblock.
>
> L.
>
