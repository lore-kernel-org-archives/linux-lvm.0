From: <felix@crowfix.com>
Message-Id: <15490.57352.298267.742746@crowfix.com>
Subject: [linux-lvm] Minor mixup in LVM 1.0.3 man pages
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
Date: Sun Mar  3 20:46:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <Linux-LVM@Sistina.com>

pvscan.8 is actually a slightly different version of pvcreate.8.

I haven't seen any other mixups.

I have been looking at all the man pages because I saw something
before and now can't find it again.  I set up a resierfs on a vg and
now, after a reboot, I can't remount it.  pvscan and several other
utilities know it's there -- they show it as inactive -- but I can't
find how to reactivate it.  This is a 2.4.18 kernel with devfs, and I
remember seeing some documentation which said what to do after every
boot, but I can't find it now!  I'll keep plugging away, I'll find it
sooner or later.  Maybe this should be in the FAQ?

Thanks for all the code, too :-)

-- 
            ... _._. ._ ._. . _._. ._. ___ .__ ._. . .__. ._ .. ._.
     Felix Finch: scarecrow repairman & rocket surgeon / felix@crowfix.com
  GPG = E987 4493 C860 246C 3B1E  6477 7838 76E9 182E 8151 ITAR license #4933
I've found a solution to Fermat's Last Theorem but I see I've run out of room o
