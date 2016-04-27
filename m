Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3REXJlA004591
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 10:33:20 -0400
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5720CDAF.1020604@redhat.com>
Date: Wed, 27 Apr 2016 16:33:19 +0200
MIME-Version: 1.0
In-Reply-To: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Lvm think provisioning query
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
To: linux-lvm@redhat.com

On 27.4.2016 14:33, Bhasker C V wrote:
> Hi,
>
>   I am starting with investigating about the lvm thin provisioning
>   (repeat post from https://lists.debian.org/debian-user/2016/04/msg00852.html )
>   (apologies for html mail)
>
>   I have done the following
>
> 1.Create a PV
> vdb    252:16   0   10G  0 disk
> ├─vdb1 252:17   0  100M  0 part
> └─vdb2 252:18   0  9.9G  0 part
> root@vmm-deb:~# pvcreate /dev/vdb1
>    Physical volume "/dev/vdb1" successfully created.
> root@vmm-deb:~# pvs
>    PV         VG   Fmt  Attr PSize   PFree
>    /dev/vdb1       lvm2 ---  100.00m 100.00m
>
> 2. create a VG
> root@vmm-deb:~# vgcreate virtp /dev/vdb1
>    Volume group "virtp" successfully created
> root@vmm-deb:~# vgs
>    VG    #PV #LV #SN Attr   VSize  VFree
>    virtp   1   0   0 wz--n- 96.00m 96.00m
>
> 3. create a lv pool  and a over-provisioned volume inside it
> root@vmm-deb:~# lvcreate -n virtpool -T virtp/virtpool -L40M
>    Logical volume "virtpool" created.
> root@vmm-deb:~# lvs
>    LV       VG    Attr       LSize  Pool Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>    virtpool virtp twi-a-tz-- 40.00m             0.00   0.88
> root@vmm-deb:~# lvcreate  -V1G -T virtp/virtpool -n vol01
>    WARNING: Sum of all thin volume sizes (1.00 GiB) exceeds the size of thin
> pool virtp/virtpool and the size of whole volume group (96.00 MiB)!
>    For thin pool auto extension activation/thin_pool_autoextend_threshold
> should be below 100.
>    Logical volume "vol01" created.
> root@vmm-deb:~# lvs
>    LV       VG    Attr       LSize  Pool     Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>    virtpool virtp twi-aotz-- 40.00m                 0.00   0.98
>    vol01    virtp Vwi-a-tz--  1.00g virtpool        0.00
>
> ---------- Now the operations
> # dd if=/dev/urandom of=./fil status=progress
> 90532864 bytes (91 MB, 86 MiB) copied, 6.00005 s, 15.1 MB/s^C
> 188706+0 records in
> 188705+0 records out
> 96616960 bytes (97 MB, 92 MiB) copied, 6.42704 s, 15.0 MB/s
>
> # df -h .
> Filesystem               Size  Used Avail Use% Mounted on
> /dev/mapper/virtp-vol01  976M   95M  815M  11% /tmp/x
> # sync
> # cd ..
> root@vmm-deb:/tmp# umount x
> root@vmm-deb:/tmp# fsck.ext4 -f -C0  /dev/virtp/vol01
> e2fsck 1.43-WIP (15-Mar-2016)
> Pass 1: Checking inodes, blocks, and sizes
> Pass 2: Checking directory structure
> Pass 3: Checking directory connectivity
> Pass 4: Checking reference counts
> Pass 5: Checking group summary information
> /dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 36544/262144 blocks
>
> <mount>
> # du -hs fil
> 93M    fil
>
> # dd if=./fil of=/dev/null status=progress
> 188705+0 records in
> 188705+0 records out
> 96616960 bytes (97 MB, 92 MiB) copied, 0.149194 s, 648 MB/s
>
>
> # vgs
>    VG    #PV #LV #SN Attr   VSize  VFree
>    virtp   1   2   0 wz--n- 96.00m 48.00m
>
> Definetly the file is occupying 90+MB.
>
> What i expect is that the pool is 40M and the file must NOT exceed 40M. Where
> does the file get 93M space ?
> I know the VG is 96M but the pool created was max 40M (also VG still says 48M
> free). Is the file exceeding the boundaries ?
> or am I doing anything wrong ?
>


Hi

Answer is simple ->  nowhere - they are simply lost - check your kernel dmesg 
log - you will spot lost of async write error.
(page cache is tricky here...    - dd ends just in page-cache which is later 
asynchronously sync to disk)

There is also 60s delay before thin-pool target starts to error all queued 
write operations if there is not enough space in pool.

So whenever you write something and you want to be 100% 'sure' it landed on 
disk you have to 'sync'  your writes.

i.e.
dd if=/dev/urandom of=./fil status=progress  conf=fsync

and if you want to know 'exactly' what's the error place -

dd if=/dev/urandom of=./fil status=progress oflags=direct

Regards

Zdenek
