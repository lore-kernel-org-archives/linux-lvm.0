Message-ID: <C65F89D1AC0BB54B865127151A24DA780BAD6497@nbexchm2.aliant.icn>
From: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Recovering from a disaster...
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
Date: Thu Nov 28 07:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Going for my RHCE in a few weeks...  Always wondered:

1. Are there any gotchas in a corrupted LVM volume?  For example, /root/vg is an LVM volume, and either the 1st superblock on /root/vg or maybe the underlying /dev/sda1 partition or even /dev/md0 (assuming /root/vg could be sitting on top of a software RAID device) is zero'ed out.  How does one go about fixing it?  Will a simple fsck here work?  But in the above case, is fsck run against md0 or sda1?

2. If one knows that /dev/md0 is in trouble (composed of /dev/sda1 and /dev/sdb1), but /dev/sda1 is fine, can one, upon boot, simply change LILO/GRUB from trying to mount root from /dev/md0 to /dev/sda1?  My guess is no, since the disk label is different.

A typical scnerario could be LVM sitting on top of MD, and have to recover from some kind of disaster.  I wonder if the RedHat 8.0 rescue option has all the modules/tools to repair such a disaster.

A co-worker just screwed up a system I suspect was setup with a combination of LVM and MD.  I may have too quickly tried mounting /dev/sda2 (root on on disk), and maybe should have tried mounting /dev/md0.  After trying to mount /dev/sda2 (with an raid autodetect type), I think mount complained about invalid options, so I proceeded to do an fsck on /dev/sda2, only to have mention something about the superblock (yes, I should write all the errors down), so I tried fsck on something like 32768,
and it started up... And ran... And ran.  Result aftewards: all /dev/sda2 contains now after an attempt to mount it is "lost+found"!  :(

Marco
