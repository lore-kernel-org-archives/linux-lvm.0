From: Bradley Alexander <storm@tux.org>
Subject: Re: [linux-lvm] multi-disk vg?
Message-Id: <20040205220234.210ddd2f.storm@tux.org>
In-Reply-To: <20040127231104.52100.qmail@web80402.mail.yahoo.com>
References: <20040127231104.52100.qmail@web80402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Feb  5 22:05:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 27 Jan 2004 15:11:04 -0800 (PST)
Chris Conn <cmcgoat@yahoo.com> wrote:


> I set up rootvg and datavg first and then last night
> I followed the LVM How-To and converted the setup the
> mainvg VG with root. All works well.
> 
> Now I'm wondering if I can merge mainvg and rootvg
> as one VG though they're on two seperate disks. Is this
> possible? And if so is it a good idea? 

As the tanker says in StarCraft, "Ab-so-lutely." I actually have but a
single VG spread across 3 PVs:

[defiant /home/storm]# vgdisplay -v
[SNIP]
--- Physical volumes ---
PV Name (#)           /dev/ide/host0/bus1/target0/lun0/disc (2)
PV Status             available / allocatable
Total PE / Free PE    3575 / 2223

PV Name (#)           /dev/ide/host0/bus0/target0/lun0/part3 (1)
PV Status             available / allocatable
Total PE / Free PE    3341 / 0

PV Name (#)           /dev/ide/host0/bus0/target1/lun0/disc (3)
PV Status             available / allocatable
Total PE / Free PE    4884 / 3721

When I add a disk, its as easy as putting the drive in and doing a
pvcreate...

As for the actual combining, I believe you would (assuming you have space
in mainvg) lvcreate for each LV in rootvg, mount to a directory (say,
/mnt), cp -avx everything over and mount in place of the current volume
(from single user mode, of course). once complete, you should be free to
remove your PVs from rootvg, remove rootvg and add your PVs to mainvg.
 
-- 
--Brad
========================================================================
Bradley M. Alexander                |
gTLD SysAdmin, Security Engineer    |   storm [at] tux.org
Debian/GNU Linux Developer          |   storm [at] debian.org
========================================================================
Key fingerprints:
DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
========================================================================
Security times usability is a constant: The only secure system is one that
is unplugged from the network, powered off, packed in concrete, then fired
into the sun...But at that point, it isn't very usable, is it?
                                                       --Brad Alexander
