From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] help using LVM & md for RAID10
Message-ID: <20030510175708.GA3353@localhost>
References: <3EB07551.87856170@kasenna.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EB07551.87856170@kasenna.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat May 10 12:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

On Wednesday, 30 April 2003, at 18:16:02 -0700,
Alberto wrote:

> # cat /proc/mdstat
> Personalities : [linear] [raid0] [raid1] [raid5] [multipath]
> read_ahead 1024 sectors
> md4 : active raid0 md3[3] md2[2] md1[1] md0[0]
>       143372288 blocks 512k chunks
> md3 : active raid1 sdi[1] sdh[0]
>       35843584 blocks [2/2] [UU]
> md2 : active raid1 sdg[1] sdf[0]
>       35843584 blocks [2/2] [UU]
> md1 : active raid1 sde[1] sdd[0]
>       35843584 blocks [2/2] [UU]
> md0 : active raid1 sdc[1] sdb[0]
>       35843584 blocks [2/2] [UU]
> unused devices: <none>
> 
> # pvcreate /dev/md0
> # pvcreate /dev/md1
> # pvcreate /dev/md2
> # pvcreate /dev/md3
> # vgcreate vg01 /dev/md[0-3]
>
In short, you set up a RAID1+0, four RAID1 devices bounded together in
one big RAID0 (md4). But next, you configure md[0-3] as PVs, instead of
just creating a PV from md4, the higher level RAID device.

You should just do:
# pvcreate /dev/md4
# vgcreate vg01 /dev/md4

And then create LV from this new VG (vg01). Should work, and you get
high performance (RAID0 md4), protection agains physical disk failures
(between one and four disk crashes, depends on luck), and the ability to
hot create, modify and destroy "partitions" (LVM).

Hope it helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.5.69)
