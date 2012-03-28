Message-ID: <4F72C38E.2080806@redhat.com>
Date: Wed, 28 Mar 2012 09:53:50 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
	<4F7100EC.6070406@nuclearwinter.com> <4F71CFFF.6090909@redhat.com>
	<4F722FFF.4010703@nuclearwinter.com>
In-Reply-To: <4F722FFF.4010703@nuclearwinter.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
Content-Type: text/plain; charset="us-ascii"
To: Larkin Lowrey <llowrey@nuclearwinter.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.3.2012 23:24, Larkin Lowrey napsal(a):
> I'll try the patches when I get a chance. In the mean time, I've
> provided the info you requested as well as a "profiled" run of "lvcreate
> -vvvv" attached as lvcreate.txt.gz. The file is pipe delimited with the
> 2nd field being the delta timestamps in ms between the current line and
> the prior line. When that lvcreate was run all arrays, except md0, were
> doing a check.
> 
> # pvs -a
>   PV               VG   Fmt  Attr PSize   PFree
>   /dev/Raid/Boot             ---       0       0
>   /dev/Raid/Root             ---       0       0
>   /dev/Raid/Swap             ---       0       0
>   /dev/Raid/Videos           ---       0       0
>   /dev/md0         Raid lvm2 a--  496.00m      0
>   /dev/md1         Raid lvm2 a--    2.03t 100.00g
>   /dev/md10        Raid lvm2 a--    1.46t      0
>   /dev/md2         Raid lvm2 a--    9.10t      0
> 
> # cat /proc/mdstat
> Personalities : [raid6] [raid5] [raid4]
> md10 : active raid5 sdt1[6] sds1[5] sdm1[0] sdn1[1] sdl1[2] sdk1[4]
>       1562845120 blocks super 1.2 level 5, 64k chunk, algorithm 2 [6/6]
> [UUUUUU]
> 
> md2 : active raid5 sdr1[5] sdo1[4] sdq1[0] sdp1[3] sdg1[2] sdh1[1]
>       9767559680 blocks level 5, 64k chunk, algorithm 2 [6/6] [UUUUUU]
> 
> md0 : active raid6 sde1[4] sdc1[2] sdf1[5] sda1[1] sdb1[0] sdd1[3]
>       509952 blocks super 1.2 level 6, 512k chunk, algorithm 2 [6/6]
> [UUUUUU]
> 
> md1 : active raid5 sdb2[10] sde2[1] sdc2[3] sda2[9] sdd2[0] sdi2[6]
> sdf2[4] sdj2[8]
>       2180641792 blocks super 1.2 level 5, 64k chunk, algorithm 2 [8/8]
> [UUUUUUUU]
> 
> unused devices: <none>
> 
> 


So I've just quickly checked the log - and it seems in many case it takes even
upto 4 seconds to finish single  read/write operation.

All the reads from block devices must by directio (older versions have had
some bugs there, where some reads were from buffer cache - that's why your
older F15 might have been giving you faster results - but it's been bug giving
inconsistent results in some situation - mainly virtualization)

It seems that your  cfq scheduler should be tuned better for raid arrays - I
assume you allow the system to create very large queues of buffers and your
mdraid isn't fast enough to store dirty pages on disk - I'd probably suggest
to significantly lower the maximum amount of dirty pages - as creation of
snapshot requires fs sync operation it will need to wait till all buffers
before the operation are in place.

Check for these sysctl options like:

vm.dirty_ratio
vm.dirty_background_ratio
vm.swappiness

and try to do some experiments with those values - if you have a huge RAM -
and large percentage of RAM could be dirtied, then you have a problem
(personally I'd try to keep dirty size in the range of MB, not GB) - but it
depends on the workload....

And another thing which might help a bit 'scan' perfomance is usage of udev.
Check you setting of  lvm.cong   devices/obtain_device_list_from_udev  value.
Are you using it set to 1 ?


Zdenek
