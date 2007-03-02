Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22BhsWL029190
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:43:54 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22BhpOw028589
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:43:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id B81BC545D5
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:43:35 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27236-14 for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 12:42:25 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:42:25 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 95291946C
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:42:22 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id aCo3GEdZyhwL for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 12:41:21 +0100 (CET)
Received: from [81.173.142.58] (xdsl-81-173-142-58.netcologne.de
	[81.173.142.58]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:42:19 +0100 (CET)
Message-ID: <45E80D9A.6050409@wpkg.org>
Date: Fri, 02 Mar 2007 12:42:18 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] moving logical volumes to another system *remotely*
	-	how?
References: <45DED477.8040809@wpkg.org>	<20070223124452.GB22388@homer.panici.net>	<45DF0F5B.6000506@wpkg.org>
	<20070223173220.GD9124@soda.linbit>
In-Reply-To: <20070223173220.GD9124@soda.linbit>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Lars Ellenberg schrieb:
> / 2007-02-23 16:59:23 +0100
> \ Tomasz Chmielewski:
>> paddy@panici.net schrieb:
>>> On Fri, Feb 23, 2007 at 12:48:07PM +0100, Tomasz Chmielewski wrote:
>>>> I have a server which stores several LVM-2 logical volumes.
>>>>
>>>> As this system is pretty loaded, I'd like to move some of the logical
>>>> volumes to another machine. It has to be done remotely, so I can't do it
>>>> as described in the LVM HOWTO (where one basically adds/replaces disks in one machine).
>>>>
>>>> My common sense tells me that I should:
>>>>
>>>> 1. Unmount/not use the logical volumes on the source server
>>>> 2. Make volumes of the same size on the target server
>>>> 3. Copy it somehow over network
>>>>
>>>>
>>>> I'm not sure of 2 (make volumes of exactly the same size) 
>>> check your PE size, otherwise does what it says on the tin.
>> Hmm, how? I just want to move some (not all) logical volumes.
>>
>> I guess fdisk is a good idea?
>>
>> # fdisk -l /dev/LVM2/ocsi1
>>
>> Disk /dev/LVM2/ocsi1: 3221 MB, 3221225472 bytes
>>
>>
>> 3221225472 / 1024 = 3145728
>>
>>
>> lvcreate -L3145728k -n ocsi1 LVM2
>>
>> Hmm, hopefully, it's the right size?
> 
> 
> how about:
> lvs --units k

Indeed this one is more LVM-specific.
Didn't work for me though - my kernel oopsed a while ago, and all lvm 
commands stopped to work. When started, they were just in a "D" state.

The kernel oopsed after I created a snapshot, made it full 
(invalidated), and tried to remove it.
The kernel I used was 2.6.17.8 running on Debian-ARM:

# lvremove /dev/LVM2/pdc-backup-new
   /dev/sda2: Checksum error
Do you really want to remove active logical volume "pdc-backup-new"? 
[y/n]: y
Segmentation fault

# dmesg
Unable to handle kernel paging request at virtual address 31376632
pgd = 8cce8000
[31376632] *pgd=00000000
Internal error: Oops: f3 [#1]
Modules linked in: iscsi_trgt bonding dm_snapshot dm_mirror loop
CPU: 0
PC is at exit_exception_table+0x44/0x70 [dm_snapshot]
LR is at exit_exception_table+0x40/0x70 [dm_snapshot]
pc : [<7f00bbe4>]    lr : [<7f00bbe0>]    Not tainted
sp : 8718dd24  ip : 31376632  fp : 8718dd48
r10: 804f14e0  r9 : 8718c000  r8 : 00000080
r7 : 90ba4218  r6 : 00000043  r5 : 8ee3577c  r4 : 31376632
r3 : 8e6e7000  r2 : 00000078  r1 : 8e6e7000  r0 : 804f14e0
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: ACCE8000  DAC: 00000015
Process lvremove (pid: 17844, stack limit = 0x8718c198)
Stack: (0x8718dd24 to 0x8718e000)
dd20:          8ee35740 8f643940 8f643944 90b9f020 00200200 00100100 
8718dd70
dd40: 8718dd4c 7f00bcb0 7f00bbac 90b9f020 8abc4460 00000001 00000034 
00000004
dd60: c134fd04 8718dd90 8718dd74 8016791c 7f00bc1c 8ee355c0 8abc4460 
00000000
dd80: 8016aab0 8718ddac 8718dd94 80166888 801678a8 8cf55aa0 8abc4460 
8718c000
dda0: 8718ddc4 8718ddb0 8016a284 80166828 90b98000 90b98000 8718ddd8 
8718ddc8
ddc0: 8016aaf4 8016a208 000ae5d8 8718df44 8718dddc 8016a888 8016aabc 
8be31468
dde0: 00000000 8718de00 8718ddf4 00000004 00000006 00000000 00004000 
00000134
de00: 00000000 00000000 0000020c 00000000 00000000 0000fd26 00000000 
00000000
de20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
de40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
de60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
de80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
dea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
dec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
dee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
df00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
df20: 8619d0a0 000ae5d8 c134fd04 00000005 8001fea4 2aadea7c 8718df5c 
8718df48
df40: 800826a8 8016a5ac 8619d0a0 000ae5d8 8718df84 8718df60 80082920 
8008264c
df60: ffffffff 8718dfac 8619d0a0 fffffff7 c134fd04 00000036 8718dfa4 
8718df88
df80: 80082990 800826c4 00000000 0004537c 2aad66d0 2aad5274 00000000 
8718dfa8
dfa0: 8001fd00 8008295c 0004537c 2aad66d0 00000005 c134fd04 000ae5d8 
00001220
dfc0: 0004537c 2aad66d0 2aad5274 000b8808 0000004e 2aad66cc 2aadea7c 
000ae5d8
dfe0: 2aadebec 7e987c3c 2aad44f8 2ac811e4 80000010 00000005 b7118d2a 
f2641dfd
Backtrace:
[<7f00bba0>] (exit_exception_table+0x0/0x70 [dm_snapshot]) from 
[<7f00bcb0>] (snapshot_dtr+0xa0/0xf4 [dm_snapshot])
[<7f00bc10>] (snapshot_dtr+0x0/0xf4 [dm_snapshot]) from [<8016791c>] 
(dm_table_put+0x80/0xe4)
[<8016789c>] (dm_table_put+0x0/0xe4) from [<80166888>] (dm_put+0x6c/0xcc)
  r7 = 8016AAB0  r6 = 00000000  r5 = 8ABC4460  r4 = 8EE355C0
[<8016681c>] (dm_put+0x0/0xcc) from [<8016a284>] (__hash_remove+0x88/0x9c)
  r6 = 8718C000  r5 = 8ABC4460  r4 = 8CF55AA0
[<8016a1fc>] (__hash_remove+0x0/0x9c) from [<8016aaf4>] 
(dev_remove+0x44/0x64)
  r5 = 90B98000  r4 = 90B98000
[<8016aab0>] (dev_remove+0x0/0x64) from [<8016a888>] (ctl_ioctl+0x2e8/0x3a8)
  r4 = 000AE5D8
[<8016a5a0>] (ctl_ioctl+0x0/0x3a8) from [<800826a8>] (do_ioctl+0x68/0x78)
[<80082640>] (do_ioctl+0x0/0x78) from [<80082920>] (vfs_ioctl+0x268/0x298)
  r5 = 000AE5D8  r4 = 8619D0A0
[<800826b8>] (vfs_ioctl+0x0/0x298) from [<80082990>] (sys_ioctl+0x40/0x60)
  r7 = 00000036  r6 = C134FD04  r5 = FFFFFFF7  r4 = 8619D0A0
[<80082950>] (sys_ioctl+0x0/0x60) from [<8001fd00>] 
(ret_fast_syscall+0x0/0x2c)
  r6 = 2AAD5274  r5 = 2AAD66D0  r4 = 0004537C
Code: e59c4000 ea000002 eb418145 e1a0c004 (e5944000)



So fdisk was the only way to read these partitions size - well, I also 
did "dd if=partition of=/dev/null" to measure the size :)

>>>> and 3 (how to copy it all over network, if possible, using SSH only).
>>> netcat and dd over forwarded port
>> Thanks for the idea.
> 
> dd if=/dev/$vg/$lv bs=32M |
> 	buffer -S 10m -s 512k |
> 	gzip -1 |
> ssh -T $target -- \
> 	"gunzip |
> 	buffer -s 512k |
> 	dd bs=32M of=/dev/$t_vg/$t_lv"
> 

I found netcat extremely slow (only 0.5-1 MB/s), perhaps same would be 
with SSH.

As I use iSCSI, I used such approach:


600 MHz ARM SAN <-iSCSI-> server <-iSCSI> 600 MHz Pentium mobile SAN



On "server" I just used:

dd if=iSCSI-ARM/part of=iSCSI-Pentium/part


With source/destination being the same size.

It was way faster, 6-8 MB/s (I had lots of gigabytes to copy).

Normal transfer rates between SAN <iSCSI> server are about 20-40 MB/s; 
perhaps it was that slow also because of an earlier kernel oops and a 
couple of lvm processes in "D" state.


-- 
Tomasz Chmielewski
http://wpkg.org
