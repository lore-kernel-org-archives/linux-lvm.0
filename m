Message-ID: <5E34D857F6BB704CA3369B7553233A81651A7E@ntsviemxs0152.connect.at-work.ent>
From: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Setup for RAID1 with LVM
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
Date: Thu Nov 15 10:01:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'Mauelshagen@Sistina.com'" <Mauelshagen@Sistina.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>, "'jens.bruckmann@suse.de'" <jens.bruckmann@suse.de>

Dear Heinz,

I have read your archive discussion on this topic and your suggested
solution for it, see below. Now we would like to do it as well, but =
when we
start pvcreate /dev/md0 we get the following error: invalid partition =
type
0x83 for /dev/md0" (must be 0x8e). Unfortunatelly we can=B4t change it =
using
fdisk.

What was the solution for it in your case?

Thank you in advance.

Regards,
Ferenc



> - create a md0 RAID1 device with your 2 disks (mirror, no use of LVM)
>   - set the parttion ID to RAID autodetect (0xfd)
>   - edit /etc/raidtab (see RAID Howto)
>   - mkraid /dev/md0
> - install LVM utilities (0.9.1beta3)
> - pvcreate /dev/md0
> - vgcreate -n BGNAME /dev/md0
> - lvcreate <some logical volume>
