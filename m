Message-ID: <5E34D857F6BB704CA3369B7553233A81651FC7@ntsviemxs0152.connect.at-work.ent>
From: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Mirroring using LVM for root, boot, and swap too
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
Date: Wed Nov 14 12:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi All,

I just joined this mailing list, because I couldn=B4t find the solution =
for my
problem.=20

I want to establish a RAID-1 mirroring solution by using LVM. I want to
mirror the whole content of my SCSI disks, like root, boot, and swap.=20

I installed Suse Linux 6.4 using 3 partition and then I followed the
instruction written in Chapter 19(converting root filesystem to LVM) of =
the
manual which I found on the internet.

http://www.sistina.com/lvm_howtos/lvm_howto.pdf

I managed to complete until point 11. However, when I rebooted the =
system I
got this error message:

Kernel panic.....
VFS: Cannot open root device 3a:01
Unable to mount root fs on 3a:01

I don=B4t know where I made the mistake!!!

My questions:

1., Has anyone followed this instruction and finished succesfully?
2., Maybe I am  on the wrong way, so could you recommend another =
solution
for the above mentioned issue?

Thank you in advance.

Ferenc Csuk
