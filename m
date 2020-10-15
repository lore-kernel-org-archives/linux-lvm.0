Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67ED2166BA0
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 15:40:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E069181E3E3
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 15:40:49 +0000 (UTC)
References: <b482a655-342c-86f9-085d-e09a1ffe8bb0@suse.com>
	<20200720175416.GB8135@redhat.com>
	<5b0ded0a-8fda-96e1-1582-f2dbf7a91e2e@suse.com>
	<20201015151634.GA6291@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <88157f57-1855-d909-0850-6c6d990628e0@suse.com>
Date: Thu, 15 Oct 2020 23:40:32 +0800
In-Reply-To: <20201015151634.GA6291@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Suggestion: lvm2 filters lib needs to show some
 readable info for end user
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

I just built & ran tag 2.3.10 code, the behavior like before.
(looks it should output: "device has a signature")
```
[tb-clustermd1 ~]# dd if=/dev/zero of=/dev/vdb bs=1M
dd: error writing '/dev/vdb': No space left on device
101+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.0600205 s, 1.7 GB/s
[tb-clustermd1 ~]# dd if=/dev/zero of=/dev/vdc bs=1M
dd: error writing '/dev/vdc': No space left on device
101+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.0566928 s, 1.8 GB/s
[tb-clustermd1 ~]# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
vda    253:0    0   40G  0 disk 
├─vda1 253:1    0    8M  0 part 
├─vda2 253:2    0   38G  0 part /
└─vda3 253:3    0    2G  0 part [SWAP]
vdb    253:16   0  100M  0 disk 
vdc    253:32   0  100M  0 disk 
[tb-clustermd1 ~]# parted -s /dev/vdb mklabel gpt
[tb-clustermd1 ~]# parted -s /dev/vdb mkpart parimary 0% 100%
Warning: The resulting partition is not properly aligned for best performance: 34s % 2048s != 0s
[tb-clustermd1 ~]# mkfs.ext4 /dev/vdb1 
mke2fs 1.45.6 (20-Mar-2020)
Creating filesystem with 102364 1k blocks and 25688 inodes
Filesystem UUID: 56f60edd-a235-460b-b868-3c3d1b5e4e01
Superblock backups stored on blocks: 
        8193, 24577, 40961, 57345, 73729

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done 

[tb-clustermd1 ~]# parted -s /dev/vdb rm 1
[tb-clustermd1 ~]# vgcreate testvg /dev/vdc /dev/vdb
  Device /dev/vdb excluded by a filter.
```


btw, I just built & ran latest master branch code, I saw lots of logs, it looks the code buggy/unstable.
```
# ./tools/lvm vgcreate testvg /dev/vdc /dev/vdb
  Device open /dev/sda already open with di -8193 fd -1
  Device open /dev/vda already open with di -8193 fd -1
  Device open /dev/vda1 already open with di -8193 fd -1
  Device open /dev/vda2 already open with di -8193 fd -1
  Device open /dev/vda3 already open with di -8193 fd -1
  Device open /dev/sdb already open with di -8193 fd -1
  Device open /dev/vdb already open with di -8193 fd -1
  Device open /dev/sdc already open with di -8193 fd -1
  Device open /dev/vdc already open with di -8193 fd -1
  Device open /dev/sdd already open with di -8193 fd -1
  Device open /dev/sde already open with di -8193 fd -1
  Device open /dev/sdf already open with di -8193 fd -1
  Device open /dev/sda already open with di -8193 fd -1
  Device open /dev/vda already open with di -8193 fd -1
  Device open /dev/vda1 already open with di -8193 fd -1
  Device open /dev/vda2 already open with di -8193 fd -1
  Device open /dev/vda3 already open with di -8193 fd -1
  Device open /dev/sdb already open with di -8193 fd -1
  Device open /dev/vdb already open with di -8193 fd -1
  Device open /dev/sdc already open with di -8193 fd -1
  Device open /dev/vdc already open with di -8193 fd -1
  Device open /dev/sdd already open with di -8193 fd -1
  Device open /dev/sde already open with di -8193 fd -1
  Device open /dev/sdf already open with di -8193 fd -1
  Device open /dev/vdc already open with di -8193 fd -1
  Device open /dev/vdc already open with di -8193 fd -1
  Device open /dev/vdb already open with di -8193 fd -1
  Device open /dev/vdb already open with di -8193 fd -1
  Device open /dev/vdc already open with di -8193 fd -1
  Device open /dev/vdb already open with di -8193 fd -1
  Device open /dev/vdc already open with di -8193 fd -1
  Device open /dev/vdb already open with di -8193 fd -1
```

On 10/15/20 11:16 PM, David Teigland wrote:
> On Thu, Oct 15, 2020 at 11:05:38PM +0800, heming.zhao@suse.com wrote:
>> Hello David,
>>
>> I don't know why I could use "git show 1fa48ba9d60ad34c5957b80024ef660ffb11161f" to
>> see your patch, but I can't find the commit in "git log" output (in master branch).
>> And the related code also doesn't be changed in master branch.
> 
> See these commits in the master branch:
> 450f272b31ef95bd7cb61812d9ef0525c7c1c341
> 74ed6e8a9969bb7d20c21f88b53e6134d81eab1d
> 0143c7aebe2389ceada6ca0a314a3ff0fd9cdfef
> 
> (The link I sent previously wasn't merged.)
> 
