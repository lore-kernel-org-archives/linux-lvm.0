From: Jason Parker-Burlingham <jasonp@panix.com>
Message-ID: <871xpynzwy.fsf@freezer.burling>
Mime-Version: 1.0
Subject: [linux-lvm] unknown ioctl problems
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
Date: Mon Jan 19 12:11:11 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm running LVM (version 1 with 1.0.7 tools) on a 2.4 system
(2.4.24-pre1, recently upgraded to 2.4.25-pre4).  When the initrd
boots (/ is an LVM filesystem, /boot is a standard block device) I see 

   lvm -- lvm_blk_ioctl: unknown cmd 0x5310

which I guess is something to do with mounting the ramdisk.

But at other times I have noticed that the machine will lock up; I'm
not sure if it's a hardware problem but lately it seems to be related
to disk activity.  I turned off screen blanking before the most recent
crash and saw no kernel oops, but a couple of repetitions of

   lvm -- lvm_blk_ioctl: unknown cmd 0x801c6d02

Is it possible that this is some sort of reasonable ioctl?  Is it
possible that this is what's crashing the machine?  How can I find out
what the system is trying do (and maybe even why)?  I don't see any
reports of exactly this problem through google, so I'm pretty lost.

jason
-- 
http://panix.com/~jasonp?BabyPictures
