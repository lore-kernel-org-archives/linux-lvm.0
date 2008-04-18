Date: Fri, 18 Apr 2008 12:53:15 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] snapshotting to a different volume group
Message-ID: <chaz20080418115315.GE20413@artesyncp.com>
References: <chaz20080417145809.GA20413@artesyncp.com>
	<20080418082436.GA7331@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080418082436.GA7331@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

2008-04-18 10:24:36 +0200, Heinz Mauelshagen:
[...]
> > or alternatively, what's the best way to bring up a LV in a VG
> > that is missing a PV (as in a disk crash) if that LV has all its
> > extents on still sane PVs?
> 
> vgchange -P -ay
[...]

I just tried that with loop devices. Unfortunately, the LV comes
up in read-only.  And lvdisplay doesn't show the still sane LVs.

dmsetup info shows it as read-only and lvdisplay -P as
read/write, btw:

lvdisplay -P:

--- Logical volume ---
LV Name                /dev/test/fs
VG Name                test
LV UUID
U03Sgj-dVYW-TBSs-fJHN-qXbm-y3vf-nN58mV
LV Write Access        read/write

dmsetup info:

Name:              test-fs
State:             ACTIVE (READ-ONLY)
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 4
Number of targets: 1
UUID:
LVM-CL1U6NmSQ0QxvXkg8Iy4BEJE4kzEAJokU03SgjdVYWTBSsfJHNqXbmy3vfnN58mV


By bypassing LVM2 and using dmsetup directly, would I
theoretically be able to setup a snapshot outside of LVM2
managed volume groups, is it worth me trying to dig that way?
Something like: having a LVM (or not) volume group with only
/dev/md0 and creating snapshots of that elsewhere while leaving
the VG containing /dev/md0 undisturbed?

TIA,
Stephane
