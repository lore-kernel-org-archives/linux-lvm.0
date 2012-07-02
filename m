Date: Mon, 2 Jul 2012 12:35:38 +0200 (CEST)
From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner@redhat.com>
In-Reply-To: <alpine.LFD.2.00.1207021041230.24050@dhcp-1-248.brq.redhat.com>
Message-ID: <alpine.LFD.2.00.1207021216430.24050@dhcp-1-248.brq.redhat.com>
References: <4FEEE5E5.5060800@redhat.com>
	<alpine.LSU.2.00.1206301217590.1728@eggly.anvils>
	<4FEF66C4.20001@redhat.com>
	<alpine.LSU.2.00.1206301541280.1919@eggly.anvils>
	<4FF04950.30503@redhat.com>
	<alpine.LSU.2.00.1207011112250.1799@eggly.anvils>
	<4FF0AEA9.3090900@redhat.com> <4FF0C91B.8050700@redhat.com>
	<alpine.LFD.2.00.1207021041230.24050@dhcp-1-248.brq.redhat.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="571144193-175288982-1341225342=:24050"
Subject: Re: [linux-lvm] Regression with FALLOC_FL_PUNCH_HOLE in 3.5-rc
	kernel
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
To: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner@redhat.com>
Cc: amwang@redhat.com, Mike Snitzer <snitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Joe Thornber <ejt@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, Alasdair G Kergon <agk@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--571144193-175288982-1341225342=:24050
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Jul 2012, Luk=EF=BF=BD Czerner wrote:

> Date: Mon, 2 Jul 2012 11:00:06 +0200 (CEST)
> From: Luk=EF=BF=BD Czerner <lczerner@redhat.com>
> To: Zdenek Kabelac <zkabelac@redhat.com>
> Cc: Hugh Dickins <hughd@google.com>, Mike Snitzer <snitzer@redhat.com>,
>     Mikulas Patocka <mpatocka@redhat.com>, Joe Thornber <ejt@redhat.com>,
>     LVM general discussion and development <linux-lvm@redhat.com>,
>     amwang@redhat.com, Alasdair G Kergon <agk@redhat.com>,
>     linux-kernel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>
> Subject: Re: Regression with FALLOC_FL_PUNCH_HOLE in 3.5-rc kernel
>=20
> On Mon, 2 Jul 2012, Zdenek Kabelac wrote:
>=20
> > Date: Mon, 02 Jul 2012 00:03:07 +0200
> > From: Zdenek Kabelac <zkabelac@redhat.com>
> > To: Hugh Dickins <hughd@google.com>
> > Cc: Mike Snitzer <snitzer@redhat.com>, Mikulas Patocka <mpatocka@redhat=
.com>,
> >     Joe Thornber <ejt@redhat.com>,
> >     LVM general discussion and development <linux-lvm@redhat.com>,
> >     amwang@redhat.com, Alasdair G Kergon <agk@redhat.com>,
> >     linux-kernel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>
> > Subject: Re: Regression with FALLOC_FL_PUNCH_HOLE in 3.5-rc kernel
> >=20
> > Dne 1.7.2012 22:10, Zdenek Kabelac napsal(a):
> > > Dne 1.7.2012 20:45, Hugh Dickins napsal(a):
> > > > On Sun, 1 Jul 2012, Zdenek Kabelac wrote:
> > > > > Dne 1.7.2012 01:10, Hugh Dickins napsal(a):
> > > > > > On Sat, 30 Jun 2012, Zdenek Kabelac wrote:
> > > > > > > Dne 30.6.2012 21:55, Hugh Dickins napsal(a):
> > > > > > > > On Sat, 30 Jun 2012, Zdenek Kabelac wrote:
> > > > > > > > >=20
> > > > > > > > > When I've used 3.5-rc kernels - I've noticed kernel deadl=
ocks.
> > > > > > > > > Ooops log included. After some experimenting - reliable w=
ay to
> > > > > > > > > hit
> > > > > > > > > this
> > > > > > > > > oops
> > > > > > > > > is to run lvm test suite for 10 minutes. Since 3.5 merge =
window
> > > > > > > > > does
> > > > > > > > > not
> > > > > > > > > included anything related to this oops I've went for bise=
ct.
> > > > > > > >=20
> > > > > > > > Thanks a lot for reporting, and going to such effort to find
> > > > > > > > a reproducible testcase that you could bisect on.
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > Game result is commit: 3f31d07571eeea18a7d34db9af21d2285b=
807a17
> > > > > > > > >=20
> > > > > > > > > mm/fs: route MADV_REMOVE to FALLOC_FL_PUNCH_HOLE
> > > > > > > >=20
> > > > > > > > But this leaves me very puzzled.
> > > > > > > >=20
> > > > > > > > Is the "lvm test suite" what I find at
> > > > > > > > git.fedorahosted.org/git/lvm2.git
> > > > > > > > under tests/ ?
> > > > > > >=20
> > > > > > > Yes - that's it -
> > > > > > >=20
> > > > > > >    make
> > > > > > > as root:
> > > > > > >    cd test
> > > > > > >    make check_local
> > > > > > >=20
> > > > > > > (inside test subdirectory should be enough, if not - just rep=
ort any
> > > > > > > problem)
> > > > > > >=20
> > > > > > > > If you have something else running at the same time, which =
happens
> > > > > > > > to
> > > > > > > > use
> > > > > > > > madvise(,,MADV_REMOVE) on a filesystem which the commit abo=
ve now
> > > > > > > > enables
> > > > > > > > it on (I guess ext4 from the =3Dy in your config), then I s=
uppose we
> > > > > > > > should
> > > > > > > > start searching for improper memory freeing or scribbling i=
n its
> > > > > > > > holepunch
> > > > > > > > support: something that might be corrupting the dm_region i=
n your
> > > > > > > > oops.
> > > > > > >=20
> > > > > > > What the test is doing - it creates file in  LVM_TEST_DIR (de=
fault
> > > > > > > is
> > > > > > > /tmp)
> > > >=20
> > > > I ran "LVM_TEST_DIR=3D/tmp make check_local":
> > > > without that it appeared to be using a subdirectory made under test=
/.
> > > >=20
> > > > And being a year or two out of date in my userspace, and unfamiliar=
 with
> > > > the syntax and whereabouts of lvm.conf, it was easiest for me to ha=
ck
> > > > lib/config/defaults.h to #define DEFAULT_ISSUE_DISCARDS 1
> > > > after I spotted a warning message about issue_discards.
> > > >=20
> > > > > > > and using loop device to simulate device (small size - it sho=
uld fit
> > > > > > > bellow
> > > > > > > 200MB)
> > > > > > >=20
> > > > > > > Within this file second layer through virtual DM devices is c=
reated
> > > > > > > and
> > > > > > > simulates various numbers of PV devices to play with.
> > > > > >=20
> > > > > > This sounds much easier to set up than I was expecting:
> > > > > > thanks for the info, I'll try it later on today.
> > > >=20
> > > > Sorry, I never reached it yesterday, but arrived there this morning.
> > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > So since everything now support TRIM - such operations should=
 be
> > > > > > > passed
> > > > > > > down to the backend file - which probably triggers the path.
> > > > > >=20
> > > > > > What filesystem do you have for /tmp?
> > > >=20
> > > >  From your later remarks, I inferred tmpfs.
> > > >=20
> > > > > >=20
> > > > > > If tmpfs, then it will make much more sense if we assume your
> > > > > > bisection
> > > > > > endpoint was off by one.  Your bisection log was not quite comp=
lete;
> > > > > > and even if it did appear to converge on the commit you cite, y=
ou
> > > > > > might
> > > > > > have got (un)lucky when testing the commit before it, and concl=
uded
> > > > > > "good" when more attempts would have said "bad".
> > > > > >=20
> > > > > > The commit before, 83e4fa9c16e4af7122e31be3eca5d57881d236fe
> > > > > > "tmpfs: support fallocate FALLOC_FL_PUNCH_HOLE", would be a
> > > > > > much more likely first bad commit if your /tmp is on tmpfs:
> > > > > > that does indeed wire up loop to pass TRIM down to tmpfs by
> > > > > > fallocate - that indeed played a part in my own testing.
> > > > > >=20
> > > > > > Whereas if your /tmp is on ext4, loop has been passing TRIM down
> > > > > > with fallocate since v3.0.  And whichever, madvise(,,MADV_REMOV=
E)
> > > > > > should be completely irrelevant.
> > > > >=20
> > > > > While I've been aware of the fact that tmpfs was enhanced with tr=
im
> > > > > support -
> > > > > I've not tried to run on real ext4 filesystem since for my tests =
I'm
> > > > > using
> > > > > tmpfs for quite some time to safe rewrites of SSD :)
> > > > >=20
> > > > > So now I've checked with real ext4 - and the bug is there as well
> > > > > so I've went back - it crashes on 3.4, 3.3 and 3.2 as well.
> > > > >=20
> > > > > 3.1 is the first kernel which does survive (checked 5 repeated ru=
ns)
> > > >=20
> > > > Very useful research, thank you.
> > > >=20
> > > > >=20
> > > > > And you are correct, the first commit which causes crash really is
> > > > > 83e4fa9c16e4af  when I use  tmpfs as backend storage - the proble=
m why
> > > > > I've
> > > > > missed to properly identify this commit in my bisect is that crash
> > > > > usually
> > > > > happens on the second pass of the lvm test suite 'make check_loca=
l'
> > > > > execution
> > > > > - and I've been running test just once. To be sure I've run 5 run=
 passes
> > > > > on
> > > > > 3.4.0-08568-gec9516f - which is OK, but 3.4.0-08569-g83e4fa9 is c=
rashing
> > > > > usually on second run, with commit 3f31d07571e  the crash always =
happens
> > > > > in
> > > > > the first pass.
> > > > >=20
> > > > > I've also checked some rawhide kernel
> > > > > vmlinuz-3.5.0-0.rc2.git0.1.fc18.x86_64
> > > > > and it's crashing as well - so it's probably not uniqueness of my
> > > > > config.
> > > > >=20
> > > > > So is there any primary suspect in 3.2 which is worth to check - =
or I
> > > > > need
> > > > > another day to play another bisect game ?
> > > >=20
> > > > No need for a further bisect: 3.2 is when the disard/trim/fallocate
> > > > support went into drivers/block/loop.c, so these tests would be una=
ble
> > > > to show if DM was right or wrong before then.
> > >=20
> > > Well I've played meanwhile the game with minimized kernel config
> > > and the outcome is:
> > >=20
> > > last working kernel is: 3.1.0-rc1-00008-g548ef6c
> > > first broken: 3.1.0-rc1-00009-gdfaa2ef
> > >=20
> > > dfaa2ef68e80c378e610e3c8c536f1c239e8d3ef
> > > loop: add discard support for loop devices
> > >=20
> > > > I don't have Fedora Rawhide on, but after hacking ISSUE_DISCARDS
> > > > I did quickly crash around where you expected; though in my case
> > > > it was in dm_rh_dec() called from mirror_end_io().
> > >=20
> > > Change of Issue Discards option in lvm.conf is not needed.
> > > I'm able to get these oopses with this setting turned off.
> > >=20
> > > > But I've not taken it any further than that.  You've shown that it's
> > > > as much a problem with ext4 as with tmpfs, and has been a problem
> > > > ever since these tests' use of discard reached DM.
> > > >=20
> > > > I think it's fair to assume that there's something wrong with DM's
> > > > handling of REQ_DISCARD.  (Perhaps it was all correct when written,
> > > > but I think there has been a series of modifications to REQ_DISCARD
> > > > handling in the block layer, it's been rather troublesome.)
> > > >=20
>=20
> Hi Zdenek,
>=20
> > >=20
> > > So does anyone has some idea what should be checked next ?
>=20
> I've missed the information in the thread, but since you're the most
> familiar with the lvm test suite, could you distil the reproducer
> which does not require to run lvm test suit ?
>=20
>=20
> >=20
> >=20
> > I've enabled more kernel debugging tools - and this came out when runni=
ng test
> > suite:
> >=20
> > Unsure if this could be source of troubles?
> >=20
> > kernel BUG at arch/x86/mm/physaddr.c:18!
> > invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC
> > CPU 1
> > Modules linked in: dm_mirror dm_region_hash dm_log aes_generic tun brid=
ge stp
> > llc psmouse serio_raw cryptomgr aead arc4 crypto_algapi sr_mod cdrom iw=
l3945
> > iwl_legacy mac80211 cfg80211 crypto e1000e evdev loop dm_mod autofs4
> >=20
> > Pid: 8, comm: kworker/1:0 Not tainted 3.1.0-rc1-00009-gdfaa2ef #30 LENO=
VO
>=20
> So you're testing rather old kernel so you might be missing some
> fixes there. Could you rerun the test with the recent kernel ?
>=20
> Also it appears that the bug here happens because dm requested a
> destination page which is within the kernel space. It seems that
> this has been initiated by the write request from the mirror target.
> So I do not immediately see how punch hole (discard) is involved at
> all. You might have been lucky enough to hit a different bug
> probably ?
>=20
> Looking at git log, this commit has been brought to my attention:
>=20
> 0c535e0d6f463365c29623350dbd91642363c39b dm io: fix discard support
>=20
> seems related to this crash.
>=20
> Please retest with recent kernel.
>=20
> Thanks!
> -Lukas
>=20
> > 6464CTO/6464CTO
> > RIP: 0010:[<ffffffff81021f00>]  [<ffffffff81021f00>] __phys_addr+0x60/0=
x70
> > RSP: 0018:ffff880136e41aa0  EFLAGS: 00010213
> > RAX: ffff87ffffffffff RBX: ffff880136e41ba0 RCX: ffff880136e41b3c
> > RDX: ffff880136e41b48 RSI: ffff880136e41b40 RDI: 0000000000000000
> > RBP: ffff880136e41aa0 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000001 R12: ffff880136e41b40
> > R13: ffff880136e41b48 R14: ffff880136e41b3c R15: ffff88011e9bec40
> > FS:  0000000000000000(0000) GS:ffff880137400000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> > CR2: 00007f34760df0c0 CR3: 0000000001604000 CR4: 00000000000006a0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> > Process kworker/1:0 (pid: 8, threadinfo ffff880136e40000, task
> > ffff880136e3e090)
> > Stack:
> >  ffff880136e41ad0 ffffffffa0013f3d 0000000000000800 ffff880136e41ba0
> >  ffff88011eae6800 ffff880136e41c10 ffff880136e41b80 ffffffffa001437e
> >  00000000239a96d0 0000000000000000 0000000000000000 0000000000000000
> > Call Trace:
> >  [<ffffffffa0013f3d>] km_get_page+0x2d/0xa0 [dm_mod]
> >  [<ffffffffa001437e>] dispatch_io+0x1ae/0x250 [dm_mod]
> >  [<ffffffffa0013e90>] ? vm_next_page+0x20/0x20 [dm_mod]
> >  [<ffffffffa0013f10>] ? vm_get_page+0x60/0x60 [dm_mod]
> >  [<ffffffffa013dab0>] ? mirror_flush+0x120/0x120 [dm_mirror]
> >  [<ffffffffa0014627>] dm_io+0xe7/0x1f0 [dm_mod]
> >  [<ffffffffa0013f10>] ? vm_get_page+0x60/0x60 [dm_mod]
> >  [<ffffffffa0013e90>] ? vm_next_page+0x20/0x20 [dm_mod]
> >  [<ffffffffa013e204>] do_writes+0x324/0x650 [dm_mirror]
> >  [<ffffffffa013e085>] ? do_writes+0x1a5/0x650 [dm_mirror]
> >  [<ffffffffa013dab0>] ? mirror_flush+0x120/0x120 [dm_mirror]
> >  [<ffffffffa013e9f4>] do_mirror+0x104/0x230 [dm_mirror]
> >  [<ffffffff81050177>] process_one_work+0x197/0x460
> >  [<ffffffff81050116>] ? process_one_work+0x136/0x460
> >  [<ffffffffa013e8f0>] ? do_reads+0x180/0x180 [dm_mirror]
> >  [<ffffffff81050986>] worker_thread+0x126/0x2d0
> >  [<ffffffff81050860>] ? manage_workers.isra.28+0x1f0/0x1f0
> >  [<ffffffff81056066>] kthread+0x96/0xa0
> >  [<ffffffff8133b614>] kernel_thread_helper+0x4/0x10
> >  [<ffffffff8133405d>] ? retint_restore_args+0xe/0xe
> >  [<ffffffff81055fd0>] ? __init_kthread_worker+0x70/0x70
> >  [<ffffffff8133b610>] ? gs_change+0xb/0xb
> > Code: ff ff 87 ff ff 48 39 c7 76 21 0f b6 0d a3 61 62 00 48 b8 00 00 00=
 00 00
> > 78 00 00 48 01 f8 48 89 c2 48 d3 ea 48 85 d2 74 d0 0f 0b <0f> 0b 0f 0b =
66 2e
> > 0f 1f 84 00 00 00 00 00 66 90 83 f9 01 49 ba
> > RIP  [<ffffffff81021f00>] __phys_addr+0x60/0x70
> >  RSP <ffff880136e41aa0>
> > ---[ end trace 040dfd9d68fccabc ]---
> >=20
> >=20
> >=20
> > Zdenek

So from the original backtrace for the problem Zdenek is seeing on 3.5.0-rc4
(https://lkml.org/lkml/2012/6/30/98) I think that this is
problem in the device mapper itself. I do not think it has anything
to do with tmpfs or mm. According to bisects from Zdenek it clearly
shows that the problem appear when the discard support for the loop
device is added, so it is most likely related to the dm discard support.

Anyway, the backtrace points to the NULL pointed dereference in
dm_rh_region_context() which is simple function:

void *dm_rh_region_context(struct dm_region *reg)
{
       return reg->rh->context;
}

so either reg, or reg-rh is NULL. Now the only place this is used is
from recovery_complete() in dm-raid1.c. So this is somewhat related
to raid recovery. I am not familiar with the dm code, but can
someone from the dm team look at this ?

But just to be sure to rule out the punch hole thing Zdenek can you
run your tests on the "real" discard capable device ? Or at least on
the device which does not convert discard requests into punch hole ?
You can use scsi_debug to create such device:

modprobe scsi_debug dev_size_mb=3D16 sector_size=3D512 num_tgts=3D1 lbpu=3D1

Thanks!
-Lukas
--571144193-175288982-1341225342=:24050--
