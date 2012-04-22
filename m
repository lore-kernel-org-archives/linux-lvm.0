Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3MI7O4R016843
	for <linux-lvm@redhat.com>; Sun, 22 Apr 2012 14:07:24 -0400
Received: from mx.treblig.org (mx.treblig.org [80.68.94.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3MI7LhS002874
	for <linux-lvm@redhat.com>; Sun, 22 Apr 2012 14:07:22 -0400
Received: from dg by mx.treblig.org with local (Exim 4.72)
	(envelope-from <dg@treblig.org>) id 1SM1Bv-0002vz-M2
	for linux-lvm@redhat.com; Sun, 22 Apr 2012 19:07:19 +0100
Date: Sun, 22 Apr 2012 19:07:19 +0100
From: "Dr. David Alan Gilbert" <dave@treblig.org>
Message-ID: <20120422180719.GA6683@gallifrey>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Encrypting an existing lvm pv (without much extra space)
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've just managed to encrypt an existing installation that was
on a single unencrypted lvm pv; I've never seen a mechanism to do this
described, and there are some odd bits in it; I'd be glad if anyone
would care to show a less insane way of doing it. I think there
are a couple of bugs I've hit along the way, but frankly I'm not sure
whether they're really bugs or expected to fail like this:

Don't try this on anything other than a toy VM; it's rather bizarre,
it may hurt your cat.  Just reinstall.

Note from a crypto point of view there is a dangerous bit; I don't
clear the space with random data - so any free space in the root
if full of zero's probably gets a whole bunch of zero's encrypted -
it's probably best to either shrink the old root or fill it with
urandom before starting.

I started with an Ubuntu Server 12.04 beta2 vm with a /boot that
is it's own partition (/dev/vda1) and a /dev/vda5 which is a normal
LVM PV, like so:

{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}
root@server1:~# pvdisplay
  --- Physical volume ---
  PV Name               /dev/vda5
  VG Name               server1
  PV Size               39.76 GiB / not usable 2.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              10178
  Free PE               0
  Allocated PE          10178
  PV UUID               NthT4q-HRxU-8IJz-ah51-6l8Z-vBtM-S3CodI
root@server1:~# vgdisplay
  --- Volume group ---
  VG Name               server1
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               39.76 GiB
  PE Size               4.00 MiB
  Total PE              10178
  Alloc PE / Size       10178 / 39.76 GiB
  Free  PE / Size       0 / 0
  VG UUID               2cJkN3-eqEd-7GK8-2OJH-se2N-o6F3-wyvO87

root@server1:~# lvdisplay
  --- Logical volume ---
  LV Name                /dev/server1/root
  VG Name                server1
  LV UUID                b58ZxV-hoyw-ZMIA-MWU7-64vW-fQ0p-2j8POe
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                39.01 GiB
  Current LE             9986
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0

  --- Logical volume ---
  LV Name                /dev/server1/swap_1
  VG Name                server1
  LV UUID                HJu380-qlO0-72Wj-xWxB-D8jV-Ak9w-KjuAaV
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                768.00 MiB
  Current LE             192
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:1
{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}

The following notes were made along the way, they might not be 100% consistent,
especially the /dev/dm- names


# Get crypt tools
apt-get -y install cryptsetup

# And borrow the swap:
swapoff -a; lvremove -f /dev/server1/swap_1

# Now create a lv for the crypted data - the size is about the size left by
# the swap  - this will be /dev/server1/cryptbase
lvcreate --size 750MB -n cryptbase server1 /dev/vda5

# Bring up luks to give us /dev/mapper/decryptedpv
echo hello|cryptsetup luksFormat /dev/server1/cryptbase
echo hello|cryptsetup luksOpen /dev/server1/cryptbase decryptedpv

# and make it a PV (ref'd as /dev/dm-2 before, maybe best to use the /dev/mapper
# link)
pvcreate /dev/mapper/decryptedpv

# and add it back to it's own VG!
vgextend server1 /dev/mapper/decryptedpv

# Now move the first bit of the partition onto there
pvmove -n /dev/server1/root /dev/vda5:0-100 /dev/dm-2

# Now lets see what we have:
# lvdisplay -m
  --- Logical volume ---
  LV Name                /dev/server1/root
  VG Name                server1
  LV UUID                j2uFUF-nWtn-4bgE-lpKq-rsbZ-fFdb-tw4Xo3
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                39.01 GiB
  Current LE             9986
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0

  --- Segments ---
  Logical extent 0 to 100:
    Type                linear
    Physical volume     /dev/dm-2
    Physical extents    0 to 100

  Logical extent 101 to 9985:
    Type                linear
    Physical volume     /dev/vda5
    Physical extents    101 to 9985

# Well - there is the start - root is split between it's original vda
# Update initramfs to know it's going to need to decrypt
echo "decryptedpv /dev/mapper/server1-cryptbase none luks,loud,noearly" >> /etc/crypttab
# You need to remove the swap from fstab here
update-initramfs -u -k all

ok, so now we just need to move all the rest across, I've not fully scripted this yet,
but the following moves a chunk about the size of the swap/free space each time you call it,
so I ran it in a loop until I'd moved everything - be careful, it's got no safety checks in:

--------
STARTPE=`lvdisplay -m /dev/server1/root | awk '/Physical volume/ { flag=($3=="/dev/vda5");} /Physical extents/ { if (flag) print $3; }' `
CRYPTSPACE=`pvdisplay -c /dev/dm-3 | awk -F: '{print $10 }'`

ENDPE=$[($STARTPE+$CRYPTSPACE)-1]

echo $STARTPE $CRYPTSPACE $ENDPE


pvmove -n /dev/server1/root /dev/vda5:$STARTPE-$ENDPE /dev/dm-3

(sleep 2; dmsetup resume /dev/dm-2)&lvextend -l +`pvdisplay -c /dev/vda5|awk -F: ' { print $10 }'` /dev/server1/cryptbase /dev/vda5; dmsetup resume /dev/dm-2; cryptsetup resize decryptedpv; pvresize /dev/dm-3

------


and there you go - for me Ubuntu boots, prompts me for the password and now I see:
{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}
root@server1:~# dmsetup info
Name:              decryptedpv
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      252, 1
Number of targets: 1
UUID: CRYPT-LUKS1-d0db02abdde146a0bc0d303f39bdd14a-decryptedpv

Name:              server1-root
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      252, 2
Number of targets: 1
UUID: LVM-gf27U0dFPAxplZOOlewuwyq9xWTU00Cm0V9DUREpUOT0Dpr3cZJeepAIEEhFtgVA

Name:              server1-cryptbase
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      252, 0
Number of targets: 2
UUID: LVM-gf27U0dFPAxplZOOlewuwyq9xWTU00CmZ31H91zc3CByt6fIh0d48RH4suV7TraW

root@server1:~# pvdisplay 
  --- Physical volume ---
  PV Name               /dev/vda5
  VG Name               server1
  PV Size               39.76 GiB / not usable 2.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              10178
  Free PE               0
  Allocated PE          10178
  PV UUID               lZ2ED8-IDXG-aNPR-UHxV-T7Lh-2dP0-jZxWUS
   
  --- Physical volume ---
  PV Name               /dev/dm-1
  VG Name               server1
  PV Size               39.76 GiB / not usable 1.81 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              10177
  Free PE               191
  Allocated PE          9986
  PV UUID               Zl2eun-Pxbt-mXBu-IBIH-JFmA-JbOR-5gb5U0
   
root@server1:~# vgdisplay 
  --- Volume group ---
  VG Name               server1
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  295
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               79.51 GiB
  PE Size               4.00 MiB
  Total PE              20355
  Alloc PE / Size       20164 / 78.77 GiB
  Free  PE / Size       191 / 764.00 MiB
  VG UUID               gf27U0-dFPA-xplZ-OOle-wuwy-q9xW-TU00Cm
   
root@server1:~# lvdisplay -v
    Finding all logical volumes
  --- Logical volume ---
  LV Name                /dev/server1/root
  VG Name                server1
  LV UUID                0V9DUR-EpUO-T0Dp-r3cZ-Jeep-AIEE-hFtgVA
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                39.01 GiB
  Current LE             9986
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:2
   
  --- Logical volume ---
  LV Name                /dev/server1/cryptbase
  VG Name                server1
  LV UUID                Z31H91-zc3C-Byt6-fIh0-d48R-H4su-V7TraW
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                39.76 GiB
  Current LE             10178
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0
   
root@server1:~# lvdisplay -m
  --- Logical volume ---
  LV Name                /dev/server1/root
  VG Name                server1
  LV UUID                0V9DUR-EpUO-T0Dp-r3cZ-Jeep-AIEE-hFtgVA
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                39.01 GiB
  Current LE             9986
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:2
   
  --- Segments ---
  Logical extent 0 to 9985:
    Type                linear
    Physical volume     /dev/dm-1    <<<< - see all on the crypt
    Physical extents    0 to 9985
   
   
  --- Logical volume ---
  LV Name                /dev/server1/cryptbase
  VG Name                server1
  LV UUID                Z31H91-zc3C-Byt6-fIh0-d48R-H4su-V7TraW
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                39.76 GiB
  Current LE             10178
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0
   
  --- Segments ---
  Logical extent 0 to 191:
    Type                linear
    Physical volume     /dev/vda5
    Physical extents    9986 to 10177
   
  Logical extent 192 to 10177:
    Type                linear
    Physical volume     /dev/vda5
    Physical extents    0 to 9985
   
{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}{--}

Wow, you're still reading - ok, so some things I noticed:

  1) the lvextend hangs, and this seems to be because lvextend suspend's
  the underlying lv that backs the luks device; hence why I have to add
  the dmsetup resume /dev/dm-2 hack in the script  ; I'm not sure if this
  is a bug or just because of the insanity of what I'm doing. Without
  the dmsetup I get a task blocked for 120 seconds backtrace, and looking
 @dmsetup it shows that the backing is suspended.

  2) I originally had the crypt backing created with --virtualsize so that
  it would actually be large enough from the start, and only allocated
  the size of the swap as cow backing.  If I did this and pvmove'd the
  whole thing to it, pvmove died and there were lots of errors that kept
  coming in the logs from the mirror not being able to allocate space.
  I suspect this might be reasonable.

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\ gro.gilbert @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
