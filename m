Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3AB6687F.EBC538E0@in.tum.de>
Date: Mon, 19 Mar 2001 21:13:51 +0100
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan won't recognize my VG
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi there!

I am aware that this topic may have been discussed a couple of times by
now, but
it seems that there are different reasons for it: why doesn't vgscan
recognize under certain circumstances my VG? I'll just write down all
informations I've collected:

Linux-version: 2.4.0
LVM-version: 0.9 (IO-Protocoll 10) -- the version of the Linus stock
kernel, ie, no patches applied.

My system has one VG (called "dsk"), PE size = 1Mb, LVs with several
filesystems (ext2, reiserfs, swap), it is contained within 3 PVs of
different (hard) discs.

The root-fs is installed in a primary partition.

Situation:
I made recently a _very_ big mistake --that's the begin of all this
problem, indeed-- because I shrinked a LV without resizing the fs first,
and realizing it just after having pressed Enter (oops...), I've let it
grow to the original size. Since it didn't work, I decided to restore
the VGDA from the appropriate backup by running lvmcfgrestore with my 3
PVs. It seemed to work, but after I've rebooted the machine, the fatal
message appeared: no VGs found (and /etc/lvmtab* disappeared!).

The only tools that work are pv*, because only these don't rely on VGDA
information collected and stored in /etc/lvmtab.d by vgscan:

pvscan detects all my PVs and adds that they belong to "an unknown VG
(run vgscan)."

I runned pvdata -U (get UUIDs) and I got some interesting information
about my PVs. For simplicity's sake I'll use identifiers for the UUIDs.

List of UUIDs:

part5:
<uuid1>
<uuid2>

part7:
<uuid3>
<uuid2>

part2:
<uuid2>
<uuid2>

I think that the last entry isn't normal, is it? Could it be this the
answer to my question? I would appreciate anybody's help because it
seems that everything's OK but there's someting strange there, and it
would be very frustrating to lose 3.2 Gb of data that isn't messed up...
Please tell me if you need more information in order to find out what's
gone wrong.

Thanks in advance,

David Vidal R. (vidalrod@in.tum.de)
