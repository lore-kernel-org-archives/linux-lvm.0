Return-Path: <hackbyte@gmx.de>
From: Daniel Mitzlaff <hackbyte@gmx.de>
Date: Wed, 03 Jan 2001 13:13:14 GMT
Message-ID: <20010103.13131495@dmitzlaff2.botschendv.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Another strange setup by a newbie, but strange oops resulted while
 trying vgextend/vgmerge!
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Hello there, first, i'm new to LVM but i understand the concepts =96 it'=
s=20
nice;)
2nd thing, YES i REALLY know what i do =96 even if it seems that i don't=
..=20
;)

Ok, just my setup: A Clear RH6.2 w/ kernel 2.2.14 "-5.0" from the rh cd,=
=20
running on a 266K6 w/ DFI Board (wintel TX chipset) + a Adaptec AHA2940A=
U=20
(AIC-7861).
DDRS39130W	9,1G/SDA
DDRS34560W	4,3G/SDB
DTLA307015		15G/HDA
DJNA352030		20G/HDB
DTLA307045		45G/HDD
DTTA351010		10G/HDC
I think, it's cool to use the SCSI drives to boot from plain ext2=20
partitions (for some security and recovery reasons), and let the kernel =

handle 2 swap partitions with the same priority (which will let the=20
kernel interleave and stripe the swap space itself =96 whoa, boosting sw=
ap=20
performace;).
Ok, then i want to build a big vg over all drives. Create a LV with 2=20=

stripes (hoping that it will everytime use 2 different busses;) and a=20=

small LV using the left free extends on the VG.

First, i ran into the same problems as reported before here on the list,=
=20
vgmerge and vgextend give me OOPS while extending the LE counter for the=
=20
VG.
BUT, all my drives are filled up with data, there's NO BACKUP(!), and no=
=20
way to take more than a single drive free for reformatting.
So, i tried the patches sent by Heinz =96 not really knowing where to pa=
tch=20
it =96 in the lvm-userland, recompiled =96 no change at all. Please, tel=
l me=20
if it is correct to use the patch at the userland-tools instead of=20
patching the kernel-parts. And, can you tell me (and others) in which=20=

order we have to see the patch?, plain patch for native LVM0.9, are ther=
e=20
other patches? (CVS snapshots are no choice!)
Ok, next ->
What the heck are you guy's doing? I use a native RH6.2 installation w/o=
=20
any updates/fixes (except for network security), using 2.2.17 and 2.2.18=
=20
kernel-tarballs (the ..17 patches works well on ..18, only a few rejects=
=20
which can easily inserted by hand;). But you CAN'T release a version tha=
t=20
does not work w/o telling users if they had to look at some dependencies=
!=20
(if there are some, remember i use a really clear RH6.2!)

Ok, so please tell me where i can get a release that works on my server,=
=20
it isn't uncool to me if i had to use an old but STABLE version =96 but =

tell the users in all your released files WHICH version IS definitively =

STABLE.
Yes, as you can see, i read the complete ML about this problem, i found =

reports and patches adressing this, but there's no help. And don't think=
=20
all your users, who want to use LVM, are able to use CVS snapshots (i=20=

never use cvs snapshots on my server =96 release is release =96 features=
=20
against bugs;).
Grmpf, ok all my frustration is left out, what can we do? ;)
greetings, hackbyte -> hackbyte@gmx.de, IRCNet hackbyte @ #linux.de,=20=

+linux.de
