MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <E823FA92099E6C4C854CE791DFA1A3D265BA56@got02.vikingtelecom.com>
From: "Turbo Fredriksson" <turbo.fredriksson@viking-telecom.com>
Subject: [linux-lvm] XFS with LVM
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
Date: Mon Nov  5 03:43:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "Linux LVM Mailinglist (E-mail)" <linux-lvm@sistina.com>
Cc: "Linux XFS Mailinglist (E-mail)" <linux-xfs@oss.sgi.com>

I have resently re-mkfs'ed all of my partitions to use XFS. Previously I
had an Software
RAID (Linear) system which used ext2. But using LVM instead would give
me much more freedom
to replace disks etc. And XFS so it don't take ages to fsck 60Gb (not
much, but takes
long enough! :).

I tried to use LVM on that, which worked fine. Mkfs'ed it to XFS which
also worked fine, to
start with.

The problem started when to processes tried to write to LVM/XFS disk
simultaneous.

When I was to change fs on the disk, I borrowed a 62Gb IDE disk to which
I moved all the
data, configured LVM (default params) and then mkfs.xfs that device.
Then all the info was
copied back (find | cpio). If I didn't accessed the LVM device,
everthing went well, but
if I started to copy some (large) files from my homedirectory to the LVM
disk, the kernel
hung/freezed...


Now, I talked to a friend that tried LVM+XFS about a year ago, and he
had the same problem
then. So, I thought that since I don't have much time to play around
with this, the machine
must be up and running propperly, I went back to using SW-RAID.

Now I get the same problem, but 'earlier', ie I don't even have to 'dual
access' the device!


Is there any special tricks that have to be done here? How important is
the kernel option

	[ ] Build Adapter Firmware with Kernel Build

I currently have NOT enabled this option. As most of us, I read the
HOWTO/FAQ/manual only
when things go wrong :) I'm currently compiling a kernel with this
option, but how important
is it really? Is that the source of my problems?


The LVM consists of the following devices:

	Device	Size (MB)	Type
	/dev/sdb1	 5.88 GB	0x83
	/dev/sdc1	 1008 MB	0x83
	/dev/sdd10	 2.37 GB	0x83
	/dev/sde1	 8.51 GB	0x83
	/dev/sdf1	17.09 GB	0x83
	/dev/sdg1	15.55 GB	0x83

I have a Adaptec 2940U2W SCSI Card (AIC7xxx driver). The kernel is a
2.4.9, but I can't
remember which XFS patch I used, the machine have crashed again (and I
have no physical
access to it at the moment).


Best regards/Med v=E4nlig h=E4lsning
Turbo Fredriksson, System developer
