Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m99A0aHx023504
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2008 06:00:36 -0400
Received: from smtp003.apm-internet.net (smtp003.apm-internet.net
	[85.119.248.52])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m99A02op008197
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2008 06:00:14 -0400
Received: from bernoulli.globalphasing.com (bernoulli.globalphasing.com
	[192.168.131.101])
	by mailserv1.globalphasing.com (Postfix) with ESMTP id A335615C08
	for <linux-lvm@redhat.com>; Thu,  9 Oct 2008 11:00:00 +0100 (BST)
Date: Thu, 9 Oct 2008 11:00:00 +0100 (BST)
From: Peter Keller <pkeller@globalphasing.com>
Subject: Re: [linux-lvm] device-mapper may have read performance issue
In-Reply-To: <alpine.LNX.1.10.0810091047140.19362@bernoulli.globalphasing.com>
Message-ID: <alpine.LNX.1.10.0810091059120.19362@bernoulli.globalphasing.com>
References: <707730.45497.qm@web92201.mail.cnh.yahoo.com>
	<8CAF7DA7F1BC4D8-320-1D40@WEBMAIL-DZ13.sysops.aol.com>
	<alpine.LNX.1.10.0810091047140.19362@bernoulli.globalphasing.com>
MIME-Version: 1.0
Content-Type: MULTIPART/Mixed; BOUNDARY="8323584-1835138233-1223545988=:19362"
Content-ID: <alpine.LNX.1.10.0810091059121.19362@bernoulli.globalphasing.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323584-1835138233-1223545988=:19362
Content-Type: TEXT/PLAIN; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-ID: <alpine.LNX.1.10.0810091059122.19362@bernoulli.globalphasing.com>

On Thu, 9 Oct 2008, Peter Keller wrote:

> Hi all,
>
> On Wed, 8 Oct 2008, thomas62186218@aol.com wrote:
>
>>  Ben,
>>
>>  I have seen this same issue as well. I have created an md device capable
>>  of 425MB/sec using the hdparm -t command, yet an LVM volume fully
>>  comprising this md device only got about 150MB/sec. I am not sure what the
>>  issue is. I am running Ubuntu Hardy 804 server edition, 64-bit.
>>
>>  -Thomas
>
> I have fixed this kind of problem by tweaking the readahead of the LVM volume 
> using 'blockdev --setra' and/or 'blockdev --setfra'.
>
> I originally found this tip here: 
> http://www.beowulf.org/archive/2007-May/018359.html
>
> Good luck,
> Peter.

I should also have said: don't forget to use 'blockdev --flushbufs' 
between tests.

Regards,
Peter.

>
>> 
>>
>>  -----Original Message-----
>>  From: Ben Huang <ben_devel@yahoo.cn>
>>  To: linux-lvm@redhat.com
>>  Sent: Wed, 8 Oct 2008 12:51 am
>>  Subject: [linux-lvm] device-mapper may have read performance issue
>> 
>> 
>> 
>> 
>> 
>> 
>> 
>> 
>>
>>  HI all,
>>       I found a LVM+dm read performance issue on my storage server. On my
>>  system, I have a 12+0 RAID5 md, which was created by the following command
>>       mdadm -C /dev/md0 -l5 -n12 /dev/sd{a,b,l,d,e,f,g,h,i,j,k,o}
>>  --assume-clean --metadata=1
>>
>>     My first test was
>>     dd if=/dev/md0 of=/dev/null bs=1M
>>     And I got around 780MB/s sequence read performance
>>
>>  vmstat 1
>>
>>  procs -----------memory---------- ---swap-- -----io---- -system--
>>  ----cpu----
>>   r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id
>>  wa
>>   2  0      0  31272 3369856 258728    0    0
>>  794680     0 3223 4120  0 35 61  3
>>   1  0      0  24980 3371104 258664A
>>  0   0    0 788484     0 3271 3909  0 31 67  2
>>   1  0      0  35208 3363600 258760    0    0 792572     0 3288 4056  0 34
>>  65  1
>>   0  1      0  22304 3380164 258560    0    0 753668     0 2875 3775  0 29
>>  70  1
>>   1  0      0  41272 3361048 258660    0    0 770048     0 3124 3977  0 32
>>  66  2
>>   1  0      0  32636 3366976 258536    0    0 759485     0 2920 3823  0 33
>>  64 
>>  3
>>   1  0      0  21796 3376132 258632    0    0 776184     0 3053 3995  0 33
>>  66  2
>>   1  0      0  28612 3373608 258872    0    0 758148     0 3050 3907  0 30
>>  68  3
>>   3  0      0  35768 3366948 258504    0    0 778240     0 3154 3873  0 32
>>  66  1
>>   1  0      0  25588 3377328 258864    0    0 737296     0 2913 3262  0 30
>>  68  2
>>   1  0      0  31264 3370300 258828    0 =C
>>  2  0 792832     0 3339 2934  0 34 63  2
>>   0  1      0  21532 3380072
>>  258708    0    0 755512     0 3067 2986  0 29 68  3
>>
>>      my second test is,
>>      pvcreate /dev/md0
>>      vgcreate DG5 /dev/md0
>>      lvcreate -L 200G -n vd1 DG5
>>      dd if=/dev/mapper/DG5-vd1 of=/dev/null bs=1M
>>      The sequence read performance dropped to 340MB/s
>>
>>  vmstat 1
>>
>>  procs -----------memory---------- ---swap-- -----io---- -system--
>>  ----cpu----
>>   r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id
>>  wa
>>   1  0      0  76440 3327728 258884    0    0 344612     0 3319 7564  0 19
>>  65 16
>>   0  1      0  29920 3374372 258636    0    0 345088     0 3290 7620  0 21
>>  67 12
>>   1  0      0  32608 3371800 258856    0    0 334464     0 3154 7513  0 19
>>  67 14
>>   0  1      0  32340 3371800 258784    0    0 341176     0 3289 7538  0 17
>>  69 14
>>   0  1      0  31812 3372424258516    0    0 337664     0 3148 7443  0 19
>>  68 13
>>   2  0      0  23964 3380052
>>  258372    0    0 337792     0 3227 7656  0 19 67 14
>>   1  0      0  38496 3365564 258696    0    0 344564     0 3297 7690  0 20
>>  66 13
>>   2  0      0  24120 3379592 258584    0    0 339468     0 3191 7448  0 19
>>  68 13
>>   1  1      0  25072 3378380 258640    0    0 338360     0 3153 7471  0 17
>>  73 11
>>   1  1      0  61488 3341904 258808    0    0 340992     0 3257 7721  0 21
>>  64 15
>>   0  1      0  51504 3352048 258568    0    0 342528     0 3270 7648  0
>>  20 65 15
>>   1  0      0  89064 3314560 258508    0    0 340224     0 3222 7764  0 20
>>  68 13
>>   1  0      0  32008 3371572 258740    0    0 337716     0 3218 7302  0 21
>>  63 17
>>   0  1      0  80608 3322828 258972    0    0 335364   A
>>  0 0 3157 7661  0 18 62 21
>> 
>>
>>  root:~# uname -a
>>  Linux ustor 2.6.26.2 #1 SMP PREEMPT Sun Sep 28 11:58:17 CST 2008 x86_64
>>  x86_64 x86_64 GNU/Linux
>>
>>  root:~# lvm version
>>    LVM version:     2.02.39 (2008-06-27)
>>    Library version: 1.02.27 (2008-06-25)
>>    Driver version:  4.13.0
>>  (The lvm snapshot merging patches has been applied)
>> 
>>
>>  I used the fowllowing scripts to monitor the
>>  /proc/diskstats,
>> 
>> root:~  # while true; do clear; cat /proc/diskstats |grep -E "sd|md|dm" 
>> root:~  |awk '{printf "[%4s] %10s %10s %10s %10s\t%10s %10s %10s %10s\t%10s 
>> root:~  %10s %10s\n",$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14}'; sleep 1; 
>> root:~  done
>>
>>  I found that dm may hold too many IOs in its queue
>>
>>  Has anyone met with the same issues?
>>  Sorry for my poor english
>> 
>> 
>>
>>    
>> 
>> 
>> 
>> 
>> 
>> 
>>
>>  ------------------------------------------------------------
>>  雅虎邮箱，您的终生邮箱！
>> 
>> 
>> 
>> 
>> 
>> 
>> 
>> 
>>
>>  _______________________________________________
>>  linux-lvm mailing list
>>  linux-lvm@redhat.com
>>  https://www.redhat.com/mailman/listinfo/linux-lvm
>>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
>> 
>> 
>> 
>> 
>>
>>  _______________________________________________
>>  linux-lvm mailing list
>>  linux-lvm@redhat.com
>>  https://www.redhat.com/mailman/listinfo/linux-lvm
>>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
>
> --
> Peter Keller                                     Tel.: +44 (0)1223 353033
> Global Phasing Ltd.,                             Fax.: +44 (0)1223 366889
> Sheraton House,
> Castle Park,
> Cambridge CB3 0AX
> United Kingdom
>

--
Peter Keller                                     Tel.: +44 (0)1223 353033
Global Phasing Ltd.,                             Fax.: +44 (0)1223 366889
Sheraton House,
Castle Park,
Cambridge CB3 0AX
United Kingdom
--8323584-1835138233-1223545988=:19362
Content-Type: TEXT/PLAIN; CHARSET=us-ascii
Content-ID: <alpine.LNX.1.10.0810091059123.19362@bernoulli.globalphasing.com>
Content-Description: 
Content-Disposition: INLINE

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--8323584-1835138233-1223545988=:19362--
