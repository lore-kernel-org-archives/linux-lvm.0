Message-Id: <4.0.1.20010906215610.008ab610@mhkserv.mhk.lu.se>
Message-Id: <4.0.1.20010906215610.008ab610@mhkserv.mhk.lu.se>
Date: Thu, 06 Sep 2001 22:45:23 +0200
From: "Marcus Hast" <hast@mhk.lu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] Problems with vgreduce
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

After creating a LV I attempted to extend it with one old drive. This went
rather well. Unfortunately as I attempted to grow the FS (XFS) it detected
a bunch of read/write errors and was unable to complete. (If anyone has any
hints about this I'd be grateful as well.)

The problem is that I then tried to remove the PV from the VG by the usual
steps. (Mentioned in older posts.)  However as I try to use vgremove it
gives me the following error:

	vgreduce -- ERROR: can't reduce volume group "lvm1" by used physical
volume "/dev/hde1"

If I try to use pvmove to rectify this I instead get this error message:

	pvmove -- no logical volumes on empty source physical volume "/dev/hde1"

If I run lvdisplay I see that under the "Distribution of logical volume..."
/dev/hde1 is present with 1 in the "PE on PV" collumn. However there is no
LE written to it according to the "Logical extents" table which follows.
And according to vgdisplay the PV (/dev/hde1) is unused.

I do have one other clean disk of the same size, unused, in the same VG.
However my attempt to replace the error prone one with this clean disk have
failed. (pvmove quits in the same way.)

So it's a rather annoying situation. Does anyone have an idea of what to
try? There isn't anything relevant on the disk to be removed, but the other
disks in the LV has, so I'd rather not risk corrupting them. (Or at least
minimize the risk.)

Thanks,


Marcus Hast, Lund, Sweden, Earth.
Living long and prosperous.
