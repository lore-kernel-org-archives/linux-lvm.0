Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF355D96F
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 19:35:07 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14B7B34337F
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 19:35:02 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 5573D5FFF9
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 15:35:01 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <23018.20452.919839.109594@quad.stoffel.home>
Date: Fri, 20 Oct 2017 15:35:00 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Oleg" == Oleg Cherkasov <o1e9@member.fsf.org> writes:

Oleg> On 19. okt. 2017 21:09, John Stoffel wrote:
>> 
Oleg> Recently I have decided to try out LVM cache feature on one of
Oleg> our Dell NX3100 servers running CentOS 7.4.1708 with 110Tb disk
Oleg> array (hardware RAID5 with H710 and H830 Dell adapters).  Two
Oleg> SSD disks each 256Gb are in hardware RAID1 using H710 adapter
Oleg> with primary and extended partitions so I decided to make ~240Gb
Oleg> LVM cache to see if system I/O may be improved.  The server is
Oleg> running Bareos storage daemon and beside sshd and Dell
Oleg> OpenManage monitoring does not have any other services.
Oleg> Unfortunately testing went not as I expected nonetheless at the
Oleg> end system is up and running with no data corrupted.
>> 
>> Can you give more details about the system.  Is this providing storage
>> services (NFS) or is it just a backup server?

Oleg> It is just a backup server, Bareos Storage Daemon + Dell
Oleg> OpenManage for LSI RAID cards (Dell's H7XX and H8XX are LSI
Oleg> based).  That host deliberately do no share any files or
Oleg> resources for security reasons, so no NFS or SMB.

Well... if it's a backup server, then I suspect that using caching
won't help much because you're mostly doing streaming writes, with
very few reads.  The Cache is designed to help the *read* case more.
And for a backup server, you're writing one or just a couple of
streams at once, which is a fairly ideal state for RAID5.

Oleg> Server has 2x SSD drives by 256Gb each and 10x 3Tb drives.  In
Oleg> addition there are two MD1200 disk arrays attached with 12x 4Tb
Oleg> disks each.  All disks exposed to CentOS as Virtual so there are
Oleg> 4 disks in total:

Oleg> NAME                                      MAJ:MIN RM   SIZE RO TYPE
Oleg> sda                                         8:0    0 278.9G  0 disk
Oleg> ├─sda1                                      8:1    0   500M  0 part /boot
Oleg> ├─sda2                                      8:2    0  36.1G  0 part
Oleg> │ ├─centos-swap                           253:0    0  11.7G  0 lvm  [SWAP]
Oleg> │ └─centos-root                           253:1    0  24.4G  0 lvm
Oleg> ├─sda3                                      8:3    0     1K  0 part
Oleg> └─sda5                                      8:5    0 242.3G  0 part
Oleg> sdb                                         8:16   0    30T  0 disk
Oleg> └─primary_backup_vg-primary_backup_lv     253:5    0 110.1T  0 lvm
Oleg> sdc                                         8:32   0    40T  0 disk
Oleg> └─primary_backup_vg-primary_backup_lv     253:5    0 110.1T  0 lvm
Oleg> sdd                                         8:48   0    40T  0 disk
Oleg> └─primary_backup_vg-primary_backup_lv     253:5    0 110.1T  0 lvm

Oleg> RAM 12Gb, swap around 12Gb as well.  /dev/sda is a hardware RAID1, the 
Oleg> rest are RAID5.

Interesting, it's all hardware RAID devices from what I can see.  

Oleg> I did make a cache and cache_meta on /dev/sda5.  It used to be a
Oleg> partition for Bareos spool for quite some time and because after
Oleg> upgrading to 10GbBASE network I do not need that spooler any
Oleg> more so I decided to try LVM cache.

Can you should the *exact* commands you used to make the cache?  Are
you using lvcache, or bcache?  they're two totally different beasts.
I looked into bcache in the past, but since you can't remove it from
an LV, I decided not to use it.  I use lvcache like this:

> sudo lvs data
  LV          VG   Attr       LSize   Pool           Origin        Data%  Meta%  Move Log Cpy%Sync Convert
      home        data Cwi-aoC--- 650.00g home_cache     [home_corig]
      home_cache  data Cwi---C--- 130.00g
      local       data Cwi-aoC--- 335.00g [localcacheLV] [local_corig]
	    
so I'm wondering exactly which caching setup you're using. 

>> How did you setup your LVM config and your cache config?  Did you
>> mirror the two SSDs using MD, then add the device into your VG and use
>> that to setup the lvcache?

Oleg> All configs are stock CentOS 7.4 at the moment (incrementally upgraded 
Oleg> from 7.0 of course), so I did not customize or tried to make any 
Oleg> optimization on config.

Ok, good to know.

>> I ask because I'm running lvcache at home on my main file/kvm server
>> and I've never seen this problem.  But!  I suspect you're running a
>> much older kernel, lvm config, etc.  Please post the full details of
>> your system if you can.
Oleg> 3.10.0-693.2.2.el7.x86_64

Oleg> CentOS 7.4, as been pointed by Xen, released about a month ago
Oleg> and I had updated about a week ago while doing planned
Oleg> maintenance on network so had a good excuse to reboot it.

Oleg> Initially I have tried the default writethrough mode and after
Oleg> running dd reading test with 250Gb file got system unresponsive
Oleg> for roughly 15min with cache allocation around 50%.  Writing to
Oleg> disks it seems speed up the system however marginally, so around
Oleg> 10% on my tests and I did manage to pull more than 32Tb via
Oleg> backup from different hosts and once system became unresponsive
Oleg> to ssh and icmp requests however for a very short time.

This isn't good.  Can you post more details about your LV setup please?  

>> Can you run 'top' or 'vmstat -admt 10' on the console while you're
>> running your tests to see what the system does?  How does memory look
>> on this system when you're NOT runnig lvcache?

Oleg> Well, it is a production system and I am not planning to cache
Oleg> it again for test however if any patches would be available then
Oleg> try to run a similar system test on spare box before converting
Oleg> it to FreeBSD with ZFS.

How was the performance before your caching tests?  Are you looking
for better compression of your backups?  I've used bacula (which
Bareos is based on) for years, but recently gave up because the
restores sucked to do.  Sorry for the side note.  :-)

Oleg> Nonetheless I tried to run top during the dd reading test
Oleg> however with in first few minutes I did not notice any issues
Oleg> with RAM.  System was using less then 2Gb of 12GB and the rest
Oleg> are wired (cache/buffers).  After few minutes system became
Oleg> unresponsive even dropping ICMP ping requests and ssh session
Oleg> frozen and then dropped after time out, so no way to check top
Oleg> measurements.

Any messages from the console?  

Oleg> I have recovered some of SAR records and I may see the last 20 minutes 
Oleg> SAR did not manage to log anything from 2:40pm to 3:00pm before system 
Oleg> got rebooted and back online at 3:10pm:

Oleg> User stat:
Oleg> 02:00:01 PM     CPU     %user     %nice   %system   %iowait    %steal 
Oleg>   %idle
Oleg> 02:10:01 PM     all      0.22      0.00      0.08      0.05      0.00 
Oleg>   99.64
Oleg> 02:20:35 PM     all      0.21      0.00      5.23     20.58      0.00 
Oleg>   73.98
Oleg> 02:30:51 PM     all      0.23      0.00      0.43     31.06      0.00 
Oleg>   68.27
Oleg> 02:40:02 PM     all      0.06      0.00      0.15     18.55      0.00 
Oleg>   81.24
Oleg> Average:        all      0.19      0.00      1.54     17.67      0.00 
Oleg>   80.61

That looks ok to me... nothing obvious there at all.

Oleg> I/O stat:
Oleg> 02:00:01 PM       tps      rtps      wtps   bread/s   bwrtn/s
Oleg> 02:10:01 PM      5.27      3.19      2.08    109.29    195.38
Oleg> 02:20:35 PM   4404.80   3841.22    563.58 971542.00 140195.66
Oleg> 02:30:51 PM   1110.49    586.67    523.83 148206.31 131721.52
Oleg> 02:40:02 PM    510.72    211.29    299.43  51321.12  76246.81
Oleg> Average:      1566.86   1214.43    352.43 306453.67  88356.03


Are you writing to a spool disk, before you then write the data into
bacula's backup system?


Oleg> DMs:
Oleg> 02:00:01 PM       DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz 
Oleg>     await     svctm     %util
Oleg> Average:       dev8-0    370.04    853.43  88355.91    241.08     85.32 
Oleg>    230.56      1.61     59.54
Oleg> Average:      dev8-16      0.02      0.14      0.02      8.18      0.00 
Oleg>      3.71      3.71      0.01
Oleg> Average:      dev8-32   1196.77 305599.78      0.04    255.35      4.26 
Oleg>      3.56      0.09     11.28
Oleg> Average:      dev8-48      0.02      0.35      0.06     18.72      0.00 
Oleg>     17.77     17.77      0.04
Oleg> Average:     dev253-0    151.59    118.15   1094.56      8.00     13.60 
Oleg>     89.71      2.07     31.36
Oleg> Average:     dev253-1     15.01    722.81     53.73     51.73      3.08 
Oleg>    204.85     28.35     42.56
Oleg> Average:     dev253-2   1259.48 218411.68      0.07    173.41      0.21 
Oleg>      0.16      0.08      9.98
Oleg> Average:     dev253-3    681.29      1.27  87189.52    127.98    163.02 
Oleg>    239.29      0.84     57.12
Oleg> Average:     dev253-4      3.83     11.09     18.09      7.61      0.09 
Oleg>     22.59     10.72      4.11
Oleg> Average:     dev253-5   1940.54 305599.86      0.07    157.48      8.47 
Oleg>      4.36      0.06     11.24


That's really bursty traffic... 


Oleg> dev253:2 is the cache or actually was ...

Oleg> Queue stat:
Oleg> 02:00:01 PM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
Oleg> 02:10:01 PM         1       302      0.09      0.05      0.05         0
Oleg> 02:20:35 PM         0       568      6.87      9.72      5.28         3
Oleg> 02:30:51 PM         1       569      5.46      6.83      5.83         2
Oleg> 02:40:02 PM         0       568      0.18      2.41      4.26         1
Oleg> Average:            0       502      3.15      4.75      3.85         2

Oleg> RAM stat:
Oleg> 02:00:01 PM kbmemfree kbmemused  %memused kbbuffers  kbcached  kbcommit 
Oleg>   %commit  kbactive   kbinact   kbdirty
Oleg> 02:10:01 PM    256304  11866580     97.89     66860   9181100   2709288 
Oleg>     11.10   5603576   5066808        32
Oleg> 02:20:35 PM    185160  11937724     98.47     56712     39104   2725476 
Oleg>     11.17    299256    292604        16
Oleg> 02:30:51 PM    175220  11947664     98.55     56712     29640   2730732 
Oleg>     11.19    113912    113552        24
Oleg> 02:40:02 PM  11195028    927856      7.65     57504     62416   2696248 
Oleg>     11.05    119488    164076        16
Oleg> Average:      2952928   9169956     75.64     59447   2328065   2715436 
Oleg>     11.12   1534058   1409260        22

Oleg> SWAP stat:
Oleg> 02:00:01 PM kbswpfree kbswpused  %swpused  kbswpcad   %swpcad
Oleg> 02:10:01 PM  12010984    277012      2.25     71828     25.93
Oleg> 02:20:35 PM  11048040   1239956     10.09     88696      7.15
Oleg> 02:30:51 PM  10723456   1564540     12.73     38272      2.45
Oleg> 02:40:02 PM  10716884   1571112     12.79     77928      4.96
Oleg> Average:     11124841   1163155      9.47     69181      5.95

I think you're running into a RedHat bug at this point.  I'd probably
move to Debian and run my own kernel with the latest patches for MD, etc.

You might even be running into problems with your HW RAID controllers
and how Linux talks to them.

Any chance you could post more details?

Good luck!
John
