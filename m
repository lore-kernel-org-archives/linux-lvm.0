From: "Innocent Azinyue Ndangoh" <azinyue@hotmail.com>
Mime-Version: 1.0
Message-ID: <F153arcR4ZDgC81Tbdk00000012@hotmail.com>
Subject: [linux-lvm] lvm lowers transfer rate
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
Date: Wed Jul 24 20:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Linux-LVM@Sistina.com

Hi there,

I have 4 fiber channel disks, on which I intend to build a logical volume=20
using lvm. Before creating the logical volume, I run an I/O test on the=20
disks, which revealed that the disks each would do 10MBytes/sec I/Os.

However, when I create a logical volume, spanning all 4 disks using RAID0, =
I=20
realize that the transfer rate now drops. Instead (10 * 4)MB/s, I get=20
something close to 30MB/s. Am I doing something wrong?!?

My procedure to create logical volume:
1. Do fdisk on drive
- do -o (DOS option).
PS : setting the type to linux lvm(8e) results in errors on creating the=20
logical volu7me
- do pvcreate on the disk(s)
- do vgcreate on all physical volumes requested
- do lvcreate on created volume
- mkfs.ext2 on logical volume
- mount  log. volume

thanks for your time

Innocent


_________________________________________________________________
Join the world=EF=BF=BDs largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com
