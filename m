Message-ID: <001401c31014$efdcc840$0100a8c0@andre6xtbp6uza>
From: "=?Windows-1252?B?QW5kcmXpIMVzdHL2bQ==?=" <andree.astrom@home.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Trouble with pvmove
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
Date: Thu May  1 14:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi everyone,

In one of my volume groups a disk have gone bad.
I extended the volumegroup with another disk to be able to pvmove it.

pvmove -i -v /dev/hdh

It went fine until,
pvmove -- /dev/hdh [PE 259 [archive [LE 259]] -> /dev/hdj [PE 259]
[260/1831]

The machine got total dead. The whole volumegroup consists of 1.1TB so i
couldn't backup it all up beforehand.
I guess the moved PE's didnt get updated now, so the filesystem is kinda
screwy.

pvscan -- ACTIVE   PV "/dev/hdj" of VG "m00"  [93.12 GB / 59.12 GB free]
pvscan -- ACTIVE   PV "/dev/hdh" of VG "m00"  [57.22 GB / 34 GB free]

I tried to use pvmove after the cold reboot to continue.

Using pvmove -i -v /dev/hdh[some_pe-to_some_pe]
The machine dies on a few specific PE's tough, nothing in the logs. Is there
any way to update the config where the PE's got allocated manually ?
as in my case when pvmove died, the lvm config still thinks the PE's exists
on the /dev/hdh ?
It display them as unallocated, but my guess is the LVM dont know where
they've been moved.
Just wild guesses here, i dont really know how it works down under : )

Anyone have any clues how it may be solved or if some of it can be
salvageable?
pvscan finds the volumegroup, it can be mounted, but complains quickly about
missing inodes, etc, when i try to access it.

Regards,
Adain
