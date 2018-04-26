Message-Id: <5AE1A4F4020000F9000B8935@prv1-mh.provo.novell.com>
Date: Wed, 25 Apr 2018 20:07:48 -0600
From: "Gang He" <ghe@suse.com>
References: <CAGmFzSc8a8TZq7LtTuwwA+zrKmgQ722KubjHBeu4M2WW2KAZew@mail.gmail.com>
In-Reply-To: <CAGmFzSc8a8TZq7LtTuwwA+zrKmgQ722KubjHBeu4M2WW2KAZew@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Pvmove can work on cluster with LVM 2.02.120(2)
 (2015-05-15), or not?
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
To: linux-lvm@redhat.com, zkabelac@redhat.com

Hello Zdenek,

Do you remember LVM for this version supports PVmove, or not?
Since there is a user which is pinging this question.

Thanks
Gang


>>> 
> Hello List,
> 
> This is another pvmove problem, the LVM version is 2.02.120(2) (2015-05-15).
> This bug can be reproduced (not each time, but very easy),
> the problem is, online pvmove brings the upper file system hang.
> the environment is a three-node cluster (CLVM+OCFS2).
> 1) create two PV, create one VG, create one LV.
> sles12sp3r1-nd1:/ # pvs
>   PV         VG          Fmt  Attr PSize   PFree
>   /dev/sda1  cluster-vg2 lvm2 a--  120.00g 60.00g
>   /dev/sda2              lvm2 ---   30.00g 30.00g
>   /dev/sdb1  cluster-vg2 lvm2 a--  120.00g 60.00g
>   /dev/sdb2              lvm2 ---   30.00g 30.00g
> sles12sp3r1-nd1:/ # vgs
>   VG          #PV #LV #SN Attr   VSize   VFree
>   cluster-vg2   2   2   0 wz--nc 239.99g 119.99g
> sles12sp3r1-nd1:/ # lvs
>   LV       VG          Attr       LSize  Pool Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>   test-lv  cluster-vg2 -wI-ao---- 20.00g
> 
> 2) mkfs.ocfs2 test-lv LV, and mount this LV on each node.
> mkfs.ocfs2 -N 4 /dev/cluster-vg2/test-lv (on one node)
> mount /dev/cluster-vg2/test-lv  /mnt/shared (on each node)
> 
> 3) write/truncate some files in /mnt/shared from each node continually.
> 
> 4) run pvmove command on node1 while step 3) is in progress on each node.
> sles12sp3r1-nd1:/ # pvmove -i 5 /dev/sda1 /dev/sdb1
> Pvmove process will enter this stack,
> sles12sp3r1-nd1:/ # cat /proc/12748/stack
> [<ffffffff810f429f>] hrtimer_nanosleep+0xaf/0x170
> [<ffffffff810f43b6>] SyS_nanosleep+0x56/0x70
> [<ffffffff8160916e>] entry_SYSCALL_64_fastpath+0x12/0x6d
> [<ffffffffffffffff>] 0xffffffffffffffff
> 
> 5)Then, I can encounter ocfs2 file system write/truncate process hang
> problem on each node,
> The root cause is blocked at getting journal lock.
> but the journal lock is being used by ocfs2_commit thread, this thread is
> blocked at flushing journal to the disk (LVM disk).
> sles12sp3r1-nd3:/ # cat /proc/2310/stack
> [<ffffffffa021ab4a>] jbd2_log_wait_commit+0x8a/0xf0 [jbd2]
> [<ffffffffa021e5c7>] jbd2_journal_flush+0x47/0x180 [jbd2]
> [<ffffffffa04d2621>] ocfs2_commit_thread+0xa1/0x350 [ocfs2]
> [<ffffffff8109b627>] kthread+0xc7/0xe0
> [<ffffffff8160617f>] ret_from_fork+0x3f/0x70
> [<ffffffff8109b560>] kthread+0x0/0xe0
> [<ffffffffffffffff>] 0xffffffffffffffff
> 
> So, I want to confirm if online pvmove is supported by LVM 2.02.120(2)
> (2015-05-15)?
> If yes, how to debug this bug? it looks ocfs2 journal thread can not flush
> data to the underlying LVM disk.
> 
> Thanks
> Gang
