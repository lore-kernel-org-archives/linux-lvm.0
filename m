Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB7H74jG020641
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 12:07:04 -0500
Received: from dunnewind.net (dunnewind.net [88.191.82.11])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB7H6qbx001229
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 12:06:53 -0500
Received: from maxence by dunnewind.net with local (Exim 4.69)
	(envelope-from <maxence@dunnewind.net>) id 1NHh2r-00059H-KV
	for linux-lvm@redhat.com; Mon, 07 Dec 2009 18:06:51 +0100
Resent-Message-ID: <20091207170645.GW21917@dunnewind.net>
Resent-To: linux-lvm@redhat.com
Date: Mon, 7 Dec 2009 17:40:18 +0100
From: Maxence DUNNEWIND <maxence@dunnewind.net>
Message-ID: <20091207164018.GV21917@dunnewind.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b+chlBtRKJDCtqTb"
Content-Disposition: inline
Subject: [linux-lvm] LVM crash maybe due to a drbd issue
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
To: drbd-user@lists.linbit.com


--b+chlBtRKJDCtqTb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using drbd with lv LVM. The layout is :=20
drbd -> lv -> vg -> pv . I'm trying to do a vgchange -ay on the underlying =
lv,
which is hanging and use 50% of a cpu. An echo w > /proc/sysrq-trigger give=
s me
an interesting thing :=20

Dec  7 13:35:26 z2-3 kernel: [8617743.246522] SysRq : Show Blocked State
Dec  7 13:35:26 z2-3 kernel: [8617743.246548]   task                       =
 PC
stack   pid father
Dec  7 13:35:26 z2-3 kernel: [8617743.246561] pdflush       D ffff880028035=
0c0
0 14401      2
Dec  7 13:35:26 z2-3 kernel: [8617743.246564]  ffff88012f04f8d0 00000000000=
00046
ffff88000150b808 ffffffff80215d6a
Dec  7 13:35:26 z2-3 kernel: [8617743.246566]  ffff88000150b7d0 00000000000=
120c0
000000000000e250 ffff88012f0ac770
Dec  7 13:35:26 z2-3 kernel: [8617743.246569]  ffff88012f0aca60 00000000000=
00003
0000000000000086 ffffffff8023bc87
Dec  7 13:35:26 z2-3 kernel: [8617743.246571] Call Trace:
Dec  7 13:35:26 z2-3 kernel: [8617743.246578]  [<ffffffff80215d6a>] ?
native_sched_clock+0x2e/0x5b
Dec  7 13:35:26 z2-3 kernel: [8617743.246582]  [<ffffffff8023bc87>] ?
try_to_wake_up+0x212/0x224
Dec  7 13:35:26 z2-3 kernel: [8617743.246585]  [<ffffffff8024accf>] ?
lock_timer_base+0x26/0x4c
Dec  7 13:35:26 z2-3 kernel: [8617743.246589]  [<ffffffff804b4500>] ?
schedule+0x9/0x1d
Dec  7 13:35:26 z2-3 kernel: [8617743.246592]  [<ffffffff804b46eb>] ?
schedule_timeout+0x90/0xb6
Dec  7 13:35:26 z2-3 kernel: [8617743.246594]  [<ffffffff8024adc8>] ?
process_timeout+0x0/0x5
Dec  7 13:35:26 z2-3 kernel: [8617743.246596]  [<ffffffff804b46e6>] ?
schedule_timeout+0x8b/0xb6
Dec  7 13:35:26 z2-3 kernel: [8617743.246598]  [<ffffffff804b3ac3>] ?
io_schedule_timeout+0x66/0xae
Dec  7 13:35:26 z2-3 kernel: [8617743.246601]  [<ffffffff802a26f0>] ?
congestion_wait+0x66/0x80
Dec  7 13:35:26 z2-3 kernel: [8617743.246604]  [<ffffffff8025473e>] ?
autoremove_wake_function+0x0/0x2e
Dec  7 13:35:26 z2-3 kernel: [8617743.246607]  [<ffffffff802d9836>] ?
writeback_inodes+0x9a/0xce
Dec  7 13:35:26 z2-3 kernel: [8617743.246610]  [<ffffffff8029888c>] ?
wb_kupdate+0xc8/0x121
Dec  7 13:35:26 z2-3 kernel: [8617743.246613]  [<ffffffff802994d7>] ?
pdflush+0x159/0x23b
Dec  7 13:35:26 z2-3 kernel: [8617743.246615]  [<ffffffff802987c4>] ?
wb_kupdate+0x0/0x121
Dec  7 13:35:26 z2-3 kernel: [8617743.246617]  [<ffffffff8029937e>] ?
pdflush+0x0/0x23b
Dec  7 13:35:26 z2-3 kernel: [8617743.246620]  [<ffffffff80254382>] ?
kthread+0x54/0x80
Dec  7 13:35:26 z2-3 kernel: [8617743.246622]  [<ffffffff80210aca>] ?
child_rip+0xa/0x20
Dec  7 13:35:26 z2-3 kernel: [8617743.246638]  [<ffffffffa02df103>] ?
handle_halt+0x0/0x12 [kvm_intel]
Dec  7 13:35:26 z2-3 kernel: [8617743.246641]  [<ffffffff80256fa5>] ?
hrtimer_cancel+0xc/0x16
Dec  7 13:35:26 z2-3 kernel: [8617743.246643]  [<ffffffff8025432e>] ?
kthread+0x0/0x80
Dec  7 13:35:26 z2-3 kernel: [8617743.246645]  [<ffffffff80210ac0>] ?
child_rip+0x0/0x20
Dec  7 13:35:26 z2-3 kernel: [8617743.246655] lvchange      D ffff88002804f=
0c0
0  4969      1
Dec  7 13:35:26 z2-3 kernel: [8617743.246657]  ffff88000150b7d0 ffffffff804=
b4484
0000000000000096 ffff880084255948
Dec  7 13:35:26 z2-3 kernel: [8617743.246659]  0000000000000001 00000000000=
120c0
000000000000e250 ffff88000145c040
Dec  7 13:35:26 z2-3 kernel: [8617743.246662]  ffff88000145c330 00000001802=
54747
ffff8800382154d0 ffffffff802348e4
Dec  7 13:35:26 z2-3 kernel: [8617743.246664] Call Trace:
Dec  7 13:35:26 z2-3 kernel: [8617743.246667]  [<ffffffff804b4484>] ?
thread_return+0x3e/0xb1
Dec  7 13:35:26 z2-3 kernel: [8617743.246670]  [<ffffffff802348e4>] ?
__wake_up_common+0x44/0x73
Dec  7 13:35:26 z2-3 kernel: [8617743.246672]  [<ffffffff804b4500>] ?
schedule+0x9/0x1d
Dec  7 13:35:26 z2-3 kernel: [8617743.246685]  [<ffffffffa0275491>] ?
inc_ap_bio+0xde/0x12e [drbd]
Dec  7 13:35:26 z2-3 kernel: [8617743.246687]  [<ffffffff8025473e>] ?
autoremove_wake_function+0x0/0x2e
Dec  7 13:35:26 z2-3 kernel: [8617743.246698]  [<ffffffffa027768a>] ?
drbd_make_request_26+0x36f/0x485 [drbd]
Dec  7 13:35:26 z2-3 kernel: [8617743.246701]  [<ffffffff8033d537>] ?
generic_make_request+0x288/0x2d2
Dec  7 13:35:26 z2-3 kernel: [8617743.246704]  [<ffffffff8035318f>] ?
delay_tsc+0x26/0x57
Dec  7 13:35:26 z2-3 kernel: [8617743.246706]  [<ffffffff8033d647>] ?
submit_bio+0xc6/0xcd
Dec  7 13:35:26 z2-3 kernel: [8617743.246709]  [<ffffffff802dd14b>] ?
submit_bh+0xe3/0x103
Dec  7 13:35:26 z2-3 kernel: [8617743.246711]  [<ffffffff802df619>] ?
__block_write_full_page+0x1d6/0x2ac
Dec  7 13:35:26 z2-3 kernel: [8617743.246713]  [<ffffffff802de3e1>] ?
end_buffer_async_write+0x0/0x116
Dec  7 13:35:26 z2-3 kernel: [8617743.246716]  [<ffffffff802e1624>] ?
blkdev_get_block+0x0/0x57
Dec  7 13:35:26 z2-3 kernel: [8617743.246718]  [<ffffffff80297e82>] ?
__writepage+0xa/0x25
Dec  7 13:35:26 z2-3 kernel: [8617743.246720]  [<ffffffff802985cc>] ?
write_cache_pages+0x206/0x322
Dec  7 13:35:26 z2-3 kernel: [8617743.246722]  [<ffffffff80215db6>] ?
read_tsc+0xa/0x20
Dec  7 13:35:26 z2-3 kernel: [8617743.246725]  [<ffffffff80297e78>] ?
__writepage+0x0/0x25
Dec  7 13:35:26 z2-3 kernel: [8617743.246727]  [<ffffffff802e3e9f>] ?
__blockdev_direct_IO+0x99a/0xa41
Dec  7 13:35:26 z2-3 kernel: [8617743.246729]  [<ffffffff802e3e9f>] ?
__blockdev_direct_IO+0x99a/0xa41
Dec  7 13:35:26 z2-3 kernel: [8617743.246732]  [<ffffffff80298724>] ?
do_writepages+0x20/0x2d
Dec  7 13:35:26 z2-3 kernel: [8617743.246734]  [<ffffffff80292a73>] ?
__filemap_fdatawrite_range+0x4c/0x57
Dec  7 13:35:26 z2-3 kernel: [8617743.246736]  [<ffffffff80292aa4>] ?
filemap_write_and_wait_range+0x26/0x52
Dec  7 13:35:26 z2-3 kernel: [8617743.246738]  [<ffffffff802932ca>] ?
generic_file_aio_read+0xd7/0x54f
Dec  7 13:35:26 z2-3 kernel: [8617743.246749]  [<ffffffffa027b84a>] ?
drbd_open+0x63/0x6d [drbd]
Dec  7 13:35:26 z2-3 kernel: [8617743.246752]  [<ffffffff802c0b1b>] ?
do_sync_read+0xce/0x113
Dec  7 13:35:26 z2-3 kernel: [8617743.246754]  [<ffffffff802bf4c4>] ?
__dentry_open+0x16f/0x260
Dec  7 13:35:26 z2-3 kernel: [8617743.246756]  [<ffffffff802c3e26>] ?
cp_new_stat+0xe9/0xfc
Dec  7 13:35:26 z2-3 kernel: [8617743.246758]  [<ffffffff8025473e>] ?
autoremove_wake_function+0x0/0x2e
Dec  7 13:35:26 z2-3 kernel: [8617743.246761]  [<ffffffff802e1907>] ?
block_ioctl+0x38/0x3c
Dec  7 13:35:26 z2-3 kernel: [8617743.246763]  [<ffffffff802cc016>] ?
vfs_ioctl+0x21/0x6c
Dec  7 13:35:26 z2-3 kernel: [8617743.246765]  [<ffffffff802cc48c>] ?
do_vfs_ioctl+0x42b/0x464
Dec  7 13:35:26 z2-3 kernel: [8617743.246767]  [<ffffffff802c1585>] ?
vfs_read+0xa6/0xff
Dec  7 13:35:26 z2-3 kernel: [8617743.246770]  [<ffffffff802c169a>] ?
sys_read+0x45/0x6e
Dec  7 13:35:26 z2-3 kernel: [8617743.246773]  [<ffffffff8020fa42>] ?
system_call_fastpath+0x16/0x1b
Dec  7 13:35:26 z2-3 kernel: [8617743.246779] Sched Debug Version: v0.09,
2.6.30-1-amd64 #1
Dec  7 13:35:26 z2-3 kernel: [8617743.246780] now at 8617743246.777559 msecs
Dec  7 13:35:26 z2-3 kernel: [8617743.246781]   .jiffies
: 6449328107
Dec  7 13:35:26 z2-3 kernel: [8617743.246783]   .sysctl_sched_latency
: 40.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246784]   .sysctl_sched_min_granulari=
ty
: 8.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246786]   .sysctl_sched_wakeup_granul=
arity
: 10.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246787]   .sysctl_sched_child_runs_fi=
rst
: 0.000001
Dec  7 13:35:26 z2-3 kernel: [8617743.246788]   .sysctl_sched_features
: 113917
Dec  7 13:35:26 z2-3 kernel: [8617743.246790]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246790] cpu#0, 3000.452 MHz
Dec  7 13:35:26 z2-3 kernel: [8617743.246792]   .nr_running                =
    :
2
Dec  7 13:35:26 z2-3 kernel: [8617743.246793]   .load                      =
    :
4145
Dec  7 13:35:26 z2-3 kernel: [8617743.246794]   .nr_switches               =
    :
185493369405
Dec  7 13:35:26 z2-3 kernel: [8617743.246795]   .nr_load_updates           =
    :
239239723
Dec  7 13:35:26 z2-3 kernel: [8617743.246796]   .nr_uninterruptible        =
    :
55617
Dec  7 13:35:26 z2-3 kernel: [8617743.246798]   .next_balance              =
    :
6449.328222
Dec  7 13:35:26 z2-3 kernel: [8617743.246799]   .curr->pid                 =
    :
16194
Dec  7 13:35:26 z2-3 kernel: [8617743.246800]   .clock                     =
    :
8617743246.431307
Dec  7 13:35:26 z2-3 kernel: [8617743.246802]   .cpu_load[0]               =
    :
3121
Dec  7 13:35:26 z2-3 kernel: [8617743.246803]   .cpu_load[1]               =
    :
3121
Dec  7 13:35:26 z2-3 kernel: [8617743.246804]   .cpu_load[2]               =
    :
3121
Dec  7 13:35:26 z2-3 kernel: [8617743.246805]   .cpu_load[3]               =
    :
3121
Dec  7 13:35:26 z2-3 kernel: [8617743.246806]   .cpu_load[4]               =
    :
3121
Dec  7 13:35:26 z2-3 kernel: [8617743.246807]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246808] cfs_rq[0]:/
Dec  7 13:35:26 z2-3 kernel: [8617743.246809]   .exec_clock                =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246810]   .MIN_vruntime              =
    :
352176404.012861
Dec  7 13:35:26 z2-3 kernel: [8617743.246812]   .min_vruntime              =
    :
352176404.012861
Dec  7 13:35:26 z2-3 kernel: [8617743.246813]   .max_vruntime              =
    :
352176404.012861
Dec  7 13:35:26 z2-3 kernel: [8617743.246814]   .spread                    =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246816]   .spread0                   =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246817]   .nr_running                =
    :
2
Dec  7 13:35:26 z2-3 kernel: [8617743.246818]   .load                      =
    :
4145
Dec  7 13:35:26 z2-3 kernel: [8617743.246819]   .nr_spread_over            =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246820]   .shares                    =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246821]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246822] rt_rq[0]:
Dec  7 13:35:26 z2-3 kernel: [8617743.246823]   .rt_nr_running             =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246824]   .rt_throttled              =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246825]   .rt_time                   =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246826]   .rt_runtime                =
    :
950.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246827]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246828] runnable tasks:
Dec  7 13:35:26 z2-3 kernel: [8617743.246829]             task   PID
tree-key  switches  prio     exec-runtime         sum-exec        sum-sleep
Dec  7 13:35:26 z2-3 kernel: [8617743.246830]
---------------------------------------------------------------------------=
-------------------------------
Dec  7 13:35:26 z2-3 kernel: [8617743.246832]          kswapd0   219
352176404.012861 79827478108   115               0               0
0.000000               0.000000               0.000000 /
Dec  7 13:35:26 z2-3 kernel: [8617743.246843] R           bash 16194
352176364.023477      5733   120               0               0
0.000000               0.000000               0.000000 /
Dec  7 13:35:26 z2-3 kernel: [8617743.246848]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246849] cpu#1, 3000.452 MHz
Dec  7 13:35:26 z2-3 kernel: [8617743.246850]   .nr_running                =
    :
3
Dec  7 13:35:26 z2-3 kernel: [8617743.246851]   .load                      =
    :
1024
Dec  7 13:35:26 z2-3 kernel: [8617743.246852]   .nr_switches               =
    :
227249168097
Dec  7 13:35:26 z2-3 kernel: [8617743.246854]   .nr_load_updates           =
    :
236708707
Dec  7 13:35:26 z2-3 kernel: [8617743.246855]   .nr_uninterruptible        =
    :
-55614
Dec  7 13:35:26 z2-3 kernel: [8617743.246856]   .next_balance              =
    :
6449.328121
Dec  7 13:35:26 z2-3 kernel: [8617743.246857]   .curr->pid                 =
    :
32275
Dec  7 13:35:26 z2-3 kernel: [8617743.246859]   .clock                     =
    :
8617743246.856932
Dec  7 13:35:26 z2-3 kernel: [8617743.246860]   .cpu_load[0]               =
    :
3072
Dec  7 13:35:26 z2-3 kernel: [8617743.246861]   .cpu_load[1]               =
    :
3072
Dec  7 13:35:26 z2-3 kernel: [8617743.246862]   .cpu_load[2]               =
    :
3072
Dec  7 13:35:26 z2-3 kernel: [8617743.246863]   .cpu_load[3]               =
    :
3072
Dec  7 13:35:26 z2-3 kernel: [8617743.246864]   .cpu_load[4]               =
    :
3072
Dec  7 13:35:26 z2-3 kernel: [8617743.246865]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246866] cfs_rq[1]:/
Dec  7 13:35:26 z2-3 kernel: [8617743.246867]   .exec_clock                =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246869]   .MIN_vruntime              =
    :
367012701.328887
Dec  7 13:35:26 z2-3 kernel: [8617743.246870]   .min_vruntime              =
    :
367012741.328887
Dec  7 13:35:26 z2-3 kernel: [8617743.246871]   .max_vruntime              =
    :
367012701.328887
Dec  7 13:35:26 z2-3 kernel: [8617743.246873]   .spread                    =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246874]   .spread0                   =
    :
14836337.316026
Dec  7 13:35:26 z2-3 kernel: [8617743.246875]   .nr_running                =
    :
1
Dec  7 13:35:26 z2-3 kernel: [8617743.246876]   .load                      =
    :
3072
Dec  7 13:35:26 z2-3 kernel: [8617743.246878]   .nr_spread_over            =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246879]   .shares                    =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246880]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246880] rt_rq[1]:
Dec  7 13:35:26 z2-3 kernel: [8617743.246881]   .rt_nr_running             =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246882]   .rt_throttled              =
    :
0
Dec  7 13:35:26 z2-3 kernel: [8617743.246883]   .rt_time                   =
    :
0.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246885]   .rt_runtime                =
    :
950.000000
Dec  7 13:35:26 z2-3 kernel: [8617743.246886]=20
Dec  7 13:35:26 z2-3 kernel: [8617743.246886] runnable tasks:
Dec  7 13:35:26 z2-3 kernel: [8617743.246887]             task   PID
tree-key  switches  prio     exec-runtime         sum-exec        sum-sleep
Dec  7 13:35:26 z2-3 kernel: [8617743.246888]
---------------------------------------------------------------------------=
-------------------------------
Dec  7 13:35:26 z2-3 kernel: [8617743.246891]              kvm 32275
367012741.340210 76292027847   120               0               0
0.000000               0.000000               0.000000 /
Dec  7 13:35:26 z2-3 kernel: [8617743.246896]  drbd16_receiver 30799
367012701.341954 123640574974   120               0               0
0.000000               0.000000               0.000000 /
Dec  7 13:35:26 z2-3 kernel: [8617743.246901]=20


In the second stack trace, I can see a call to drbd_make_request_26, then to
inc_ap_bio which seems to be blocked.

Anyway, the drbddevice using this lv is down, so it shouldn't block the lvc=
hange
(I checked with drbdsetup /dev/drbdXX show, only the syncer part is shown).

If someone has any informations about this bug ? Should I report it  (I will
also mail it on lvm mailing list).

Cheers,

Maxence

--=20
Maxence DUNNEWIND
Contact : maxence@dunnewind.net
Site : http://www.dunnewind.net
06 32 39 39 93
GPG : 18AE 61E4 D0B0 1C7C AAC9  E40D 4D39 68DB 0D2E B533

--b+chlBtRKJDCtqTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAksdL/IACgkQTTlo2w0utTOp+ACePUAmq7WY3rU/rS2Ci0mO5nvv
TO8AoKr6R5HJlgXEcT8Wosw4qU6GayWR
=xmEP
-----END PGP SIGNATURE-----

--b+chlBtRKJDCtqTb--
