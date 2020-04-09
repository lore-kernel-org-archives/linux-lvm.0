References: <a96a317d-103d-ce37-6d5d-6b71190f3128@gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <405cf4d8-b1ec-8182-849a-2eca1892da49@redhat.com>
Date: Thu, 9 Apr 2020 12:24:08 +0200
MIME-Version: 1.0
In-Reply-To: <a96a317d-103d-ce37-6d5d-6b71190f3128@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] lvcreate: adding devices causes an alignment
 inconsistencies
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Bernhard Sulzer <micraft.b@gmail.com>
Cc: Mike Snitzer <snitzer@redhat.com>

Bernhard,

the block device stacking limits check failed because of queue alignment 
offset 512
when a start at 0 has been configured probably causing performance 
issues with your
RaidLV (bdev_stack_limits() in dm-table.c returning error causes the 
messages you see).

You won't see any data corruption issues with that kind of error.


Mike,
is this a known issue yet (not seeing a related bz)?


Heinz


On 3/28/20 5:59 PM, Bernhard Sulzer wrote:
> I wanted to create a raid5 array from 3x 7.3TiB drives but whatever I 
> do, I seemingly can't align the devices in my lvm raid. Am I doing it 
> wrong, or may there be a bug hiding somewhere?
>
> # sudo vgcreate test --dataalignment 1M /dev/sd{c,d,e}
>   Volume group "test" successfully created
>
> # sudo lvcreate --type raid5 -L 4T --nosync -n test_data test
>   Using default stripesize 64.00 KiB.
>   WARNING: New raid5 won't be synchronised. Don't read what you didn't 
> write!
>   Logical volume "test_data" created.
>
> As far as output from lvm commands is concerned, it all looks fine to 
> me. But why, when looking at lsblk is there so much strange alignment 
> going on?Is this normal or should I be concerned? (I don't know what 
> performance I should expect with my setup so I can't say anything 
> about that). Note, that the same thing happens when I try to create a 
> raid0
>
> # lsblk -t
> NAME                      ALIGNMENT MIN-IO OPT-IO PHY-SEC LOG-SEC ROTA 
> SCHED       RQ-SIZE  RA WSAME
> sdc                               0   4096      0    4096 512    1 
> mq-deadline      60 128   32M
> ├─test-test_data_rmeta_0          0   4096      0    4096 512 
> 1                 128 128   32M
> │ └─test-test_data               -1  65536 131072    4096 512 
> 1                 128 384    0B
> └─test-test_data_rimage_0         0   4096      0    4096 512 
> 1                 128 128   32M
>   └─test-test_data               -1  65536 131072    4096 512 
> 1                 128 384    0B
> sdd                               0   4096      0    4096 512    1 
> mq-deadline      60 128   32M
> ├─test-test_data_rmeta_1          0   4096      0    4096 512 
> 1                 128 128   32M
> │ └─test-test_data               -1  65536 131072    4096 512 
> 1                 128 384    0B
> └─test-test_data_rimage_1         0   4096      0    4096 512 
> 1                 128 128   32M
>   └─test-test_data               -1  65536 131072    4096 512 
> 1                 128 384    0B
> sde                               0   4096      0    4096 512    1 
> mq-deadline      60 128   32M
> ├─test-test_data_rmeta_2        512   4096      0    4096 512 
> 1                 128 128   32M
> │ └─test-test_data               -1  65536 131072    4096 512 
> 1                 128 384    0B
> └─test-test_data_rimage_2       512   4096      0    4096 512 
> 1                 128 128   32M
>
> # dmesg -wH
> [  +0.275210] device-mapper: raid: Superblocks created for new raid set
> [  +0.002796] md/raid:mdX: device dm-1 operational as raid disk 0
> [  +0.000004] md/raid:mdX: device dm-3 operational as raid disk 1
> [  +0.000002] md/raid:mdX: device dm-5 operational as raid disk 2
> [  +0.000801] md/raid:mdX: raid level 5 active with 3 out of 3 
> devices, algorithm 2
> [  +0.010185] device-mapper: table: 254:6: adding target device dm-5 
> caused an alignment inconsistency: physical_block_size=4096, 
> logical_block_size=512, alignment_offset=512, start=0
> [  +0.000005] device-mapper: table: 254:6: adding target device dm-5 
> caused an alignment inconsistency: physical_block_size=4096, 
> logical_block_size=512, alignment_offset=512, start=0
> [  +0.000084] device-mapper: table: 254:6: adding target device dm-5 
> caused an alignment inconsistency: physical_block_size=4096, 
> logical_block_size=512, alignment_offset=512, start=0
> [  +0.000003] device-mapper: table: 254:6: adding target device dm-5 
> caused an alignment inconsistency: physical_block_size=4096, 
> logical_block_size=512, alignment_offset=512, start=0
> [  +0.070102] mdX: bitmap file is out of date, doing full recovery
>
>
> Platform:
> Arch Linux 5.6.0-rc7-1-git-00151-g67d584e33e54 (also tested with 
> Debian on 4.19, same results)
> LVM version:     2.02.186(2) (2019-08-27)
> Library version: 1.02.164 (2019-08-27)
> Driver version:  4.42.0
>
>
> Any advice would be much appreciated, thanks
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
