From: "Sean C. McCord" <lvm@lifelabs.net>
Message-Id: <Pine.LNX.4.33L0.0202091613040.16109-100000@fcofer2>
MIME-Version: 1.0
Subject: [linux-lvm] VG has wrong num of PV's; won't vgscan
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
Date: Sat Feb  9 15:28:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I was attempting to add another PV to my VG 'mccord', and vgextend
segfaulted in the middle.  After I rebooted (the kernel dumped its LVM
core), there was no volume group found by vgscan.

I have seen similar posts in the archives, but most of them reference a
bug that was supposedly fixed before LVM 1.0, so this must not be it.

Anyway, pvdisplay on /dev/ide/host0/bus1/target0/lun0/part1 says
everythings's great, and that it is PV #1 of VG mccord.

pvdata says VG mccord has two PVs and that both are active.  The other PV,
though, is completely trashed.  pvdata also says that the LV seems to be
fine.

I have no backup of the vgdata that I can find (they are stored on the
first PV...), so I can't do what many of the other people did to get their
VGs back.

Is there any way to change the VG info back to having only one PV, and if
so, will that get vgscan to find the VG again?  If you need the debug
info, I can provide it.

My system is using LVM 1.0.1-rc4, devfs, Reiserfs, and I have my root file
system on that VG.

Thanks for any assistance anyone can offer,

Sean C. McCord
