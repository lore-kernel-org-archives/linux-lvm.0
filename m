Date: Fri, 20 Oct 2017 22:55:00 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20171021025459.GD31049@redhat.com>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
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
To: Oleg Cherkasov <o1e9@member.fsf.org>
Cc: linux-lvm@redhat.com

On Thu, Oct 19 2017 at  5:59pm -0400,
Oleg Cherkasov <o1e9@member.fsf.org> wrote:

> On 19. okt. 2017 21:09, John Stoffel wrote:
> >
> > Oleg> Recently I have decided to try out LVM cache feature on one of
> > Oleg> our Dell NX3100 servers running CentOS 7.4.1708 with 110Tb disk
> > Oleg> array (hardware RAID5 with H710 and H830 Dell adapters).  Two
> > Oleg> SSD disks each 256Gb are in hardware RAID1 using H710 adapter
> > Oleg> with primary and extended partitions so I decided to make ~240Gb
> > Oleg> LVM cache to see if system I/O may be improved.  The server is
> > Oleg> running Bareos storage daemon and beside sshd and Dell
> > Oleg> OpenManage monitoring does not have any other services.
> > Oleg> Unfortunately testing went not as I expected nonetheless at the
> > Oleg> end system is up and running with no data corrupted.
> >
> > Can you give more details about the system.  Is this providing storage
> > services (NFS) or is it just a backup server?
> 
> It is just a backup server, Bareos Storage Daemon + Dell OpenManage
> for LSI RAID cards (Dell's H7XX and H8XX are LSI based).  That host
> deliberately do no share any files or resources for security
> reasons, so no NFS or SMB.
> 
> Server has 2x SSD drives by 256Gb each and 10x 3Tb drives.  In
> addition there are two MD1200 disk arrays attached with 12x 4Tb
> disks each.  All disks exposed to CentOS as Virtual so there are 4
> disks in total:
> 
> NAME                                      MAJ:MIN RM   SIZE RO TYPE
> sda                                         8:0    0 278.9G  0 disk
> ├─sda1                                      8:1    0   500M  0 part /boot
> ├─sda2                                      8:2    0  36.1G  0 part
> │ ├─centos-swap                           253:0    0  11.7G  0 lvm  [SWAP]
> │ └─centos-root                           253:1    0  24.4G  0 lvm
> ├─sda3                                      8:3    0     1K  0 part
> └─sda5                                      8:5    0 242.3G  0 part
> sdb                                         8:16   0    30T  0 disk
> └─primary_backup_vg-primary_backup_lv     253:5    0 110.1T  0 lvm
> sdc                                         8:32   0    40T  0 disk
> └─primary_backup_vg-primary_backup_lv     253:5    0 110.1T  0 lvm
> sdd                                         8:48   0    40T  0 disk
> └─primary_backup_vg-primary_backup_lv     253:5    0 110.1T  0 lvm
> 
> RAM 12Gb, swap around 12Gb as well.  /dev/sda is a hardware RAID1,
> the rest are RAID5.
> 
> I did make a cache and cache_meta on /dev/sda5.  It used to be a
> partition for Bareos spool for quite some time and because after
> upgrading to 10GbBASE network I do not need that spooler any more so
> I decided to try LVM cache.
> 
> > How did you setup your LVM config and your cache config?  Did you
> > mirror the two SSDs using MD, then add the device into your VG and use
> > that to setup the lvcache?
> All configs are stock CentOS 7.4 at the moment (incrementally
> upgraded from 7.0 of course), so I did not customize or tried to
> make any optimization on config.
> > I ask because I'm running lvcache at home on my main file/kvm server
> > and I've never seen this problem.  But!  I suspect you're running a
> > much older kernel, lvm config, etc.  Please post the full details of
> > your system if you can.
> 3.10.0-693.2.2.el7.x86_64
> 
> CentOS 7.4, as been pointed by Xen, released about a month ago and I
> had updated about a week ago while doing planned maintenance on
> network so had a good excuse to reboot it.
> 
> > Oleg> Initially I have tried the default writethrough mode and after
> > Oleg> running dd reading test with 250Gb file got system unresponsive
> > Oleg> for roughly 15min with cache allocation around 50%.  Writing to
> > Oleg> disks it seems speed up the system however marginally, so around
> > Oleg> 10% on my tests and I did manage to pull more than 32Tb via
> > Oleg> backup from different hosts and once system became unresponsive
> > Oleg> to ssh and icmp requests however for a very short time.
> >
> > Can you run 'top' or 'vmstat -admt 10' on the console while you're
> > running your tests to see what the system does?  How does memory look
> > on this system when you're NOT runnig lvcache?
> 
> Well, it is a production system and I am not planning to cache it
> again for test however if any patches would be available then try to
> run a similar system test on spare box before converting it to
> FreeBSD with ZFS.
> 
> Nonetheless I tried to run top during the dd reading test however
> with in first few minutes I did not notice any issues with RAM.
> System was using less then 2Gb of 12GB and the rest are wired
> (cache/buffers). After few minutes system became unresponsive even
> dropping ICMP ping requests and ssh session frozen and then dropped
> after time out, so no way to check top measurements.
> 
> I have recovered some of SAR records and I may see the last 20
> minutes SAR did not manage to log anything from 2:40pm to 3:00pm
> before system got rebooted and back online at 3:10pm:
> 
> User stat:
> 02:00:01 PM     CPU     %user     %nice   %system   %iowait
> %steal  %idle
> 02:10:01 PM     all      0.22      0.00      0.08      0.05
> 0.00  99.64
> 02:20:35 PM     all      0.21      0.00      5.23     20.58
> 0.00  73.98
> 02:30:51 PM     all      0.23      0.00      0.43     31.06
> 0.00  68.27
> 02:40:02 PM     all      0.06      0.00      0.15     18.55
> 0.00  81.24
> Average:        all      0.19      0.00      1.54     17.67
> 0.00  80.61
> 
> I/O stat:
> 02:00:01 PM       tps      rtps      wtps   bread/s   bwrtn/s
> 02:10:01 PM      5.27      3.19      2.08    109.29    195.38
> 02:20:35 PM   4404.80   3841.22    563.58 971542.00 140195.66
> 02:30:51 PM   1110.49    586.67    523.83 148206.31 131721.52
> 02:40:02 PM    510.72    211.29    299.43  51321.12  76246.81
> Average:      1566.86   1214.43    352.43 306453.67  88356.03
> 
> DMs:
> 02:00:01 PM       DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz
> avgqu-sz    await     svctm     %util
> Average:       dev8-0    370.04    853.43  88355.91    241.08
> 85.32   230.56      1.61     59.54
> Average:      dev8-16      0.02      0.14      0.02      8.18
> 0.00     3.71      3.71      0.01
> Average:      dev8-32   1196.77 305599.78      0.04    255.35
> 4.26     3.56      0.09     11.28
> Average:      dev8-48      0.02      0.35      0.06     18.72
> 0.00    17.77     17.77      0.04
> Average:     dev253-0    151.59    118.15   1094.56      8.00
> 13.60    89.71      2.07     31.36
> Average:     dev253-1     15.01    722.81     53.73     51.73
> 3.08   204.85     28.35     42.56
> Average:     dev253-2   1259.48 218411.68      0.07    173.41
> 0.21     0.16      0.08      9.98
> Average:     dev253-3    681.29      1.27  87189.52    127.98
> 163.02   239.29      0.84     57.12
> Average:     dev253-4      3.83     11.09     18.09      7.61
> 0.09    22.59     10.72      4.11
> Average:     dev253-5   1940.54 305599.86      0.07    157.48
> 8.47     4.36      0.06     11.24
> 
> dev253:2 is the cache or actually was ...
> 
> Queue stat:
> 02:00:01 PM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
> 02:10:01 PM         1       302      0.09      0.05      0.05         0
> 02:20:35 PM         0       568      6.87      9.72      5.28         3
> 02:30:51 PM         1       569      5.46      6.83      5.83         2
> 02:40:02 PM         0       568      0.18      2.41      4.26         1
> Average:            0       502      3.15      4.75      3.85         2
> 
> RAM stat:
> 02:00:01 PM kbmemfree kbmemused  %memused kbbuffers  kbcached
> kbcommit  %commit  kbactive   kbinact   kbdirty
> 02:10:01 PM    256304  11866580     97.89     66860   9181100
> 2709288    11.10   5603576   5066808        32
> 02:20:35 PM    185160  11937724     98.47     56712     39104
> 2725476    11.17    299256    292604        16
> 02:30:51 PM    175220  11947664     98.55     56712     29640
> 2730732    11.19    113912    113552        24
> 02:40:02 PM  11195028    927856      7.65     57504     62416
> 2696248    11.05    119488    164076        16
> Average:      2952928   9169956     75.64     59447   2328065
> 2715436    11.12   1534058   1409260        22
> 
> SWAP stat:
> 02:00:01 PM kbswpfree kbswpused  %swpused  kbswpcad   %swpcad
> 02:10:01 PM  12010984    277012      2.25     71828     25.93
> 02:20:35 PM  11048040   1239956     10.09     88696      7.15
> 02:30:51 PM  10723456   1564540     12.73     38272      2.45
> 02:40:02 PM  10716884   1571112     12.79     77928      4.96
> Average:     11124841   1163155      9.47     69181      5.95

So aside from SAR outout: you don't have any system logs?  Or a vmcore
of the system (assuming it crashed?) -- in it you could access the
kernel log (via 'log' command in crash utility.

More specifics on the workload would be useful.  Also, more details on
the LVM cache configuration (block size?  writethrough or writeback?
etc).

I'll be looking very closely for any sign of memory leaks (both with
code inspection and testing while kemmleak is enabled).

But the more info you can provide on the workload the better.

Thanks,
Mike

p.s. RHEL7.4 has all of upstream's dm-cache code.
p.p.s.:
I've implemented parallel submission of write IO for writethrough mode.
It needs further testing and review but so far it seems to be working;
yet to see a huge improvement in writethrough mode throughput but
overall IO latencies on writes may be improved (at least closer to that
of the slow device in the cache).  Haven't looked at latency yet (will
test further with fio on Monday).
