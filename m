From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Recovering from a disaster...
Message-ID: <206010000.1038519733@[192.168.100.3]>
In-Reply-To: <C65F89D1AC0BB54B865127151A24DA780BAD6497@nbexchm2.aliant.icn>
References: <C65F89D1AC0BB54B865127151A24DA780BAD6497@nbexchm2.aliant.icn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Thu Nov 28 15:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


> Going for my RHCE in a few weeks...  Always wondered:
>
> 1. Are there any gotchas in a corrupted LVM volume?  For example,
> /root/vg is an LVM volume, and either the 1st superblock on /root/vg or
> maybe the underlying /dev/sda1 partition or even /dev/md0 (assuming
> /root/vg could be sitting on top of a software RAID device) is zero'ed
> out.  How does one go about fixing it?  Will a simple fsck here work?
> But in the above case, is fsck run against md0 or sda1?

Simple fix:

	Until Intel-based systems have a usable bios don't put your
	root/boot volume on LVM. Since the BIOS will not be upgraded
	until at least three weeks after pigs floss I'd strongly
	suggest avoiding the pratice altogether.

The main reason is that any glitch in the LVM system will
leave the system unbootable. The root volume is small enough
that it does not require LVM for either performance or multi-
PV distribution. Mirroring it will be better done at the
hardware level to avoid kernel glitches frying the mirror.

> 2. If one knows that /dev/md0 is in trouble (composed of /dev/sda1 and
> /dev/sdb1), but /dev/sda1 is fine, can one, upon boot, simply change
> LILO/GRUB from trying to mount root from /dev/md0 to /dev/sda1?  My guess
> is no, since the disk label is different.

> A typical scnerario could be LVM sitting on top of MD, and have to
> recover from some kind of disaster.  I wonder if the RedHat 8.0 rescue
> option has all the modules/tools to repair such a disaster.

They don't support LVM out of the box, so this is unlikely.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
