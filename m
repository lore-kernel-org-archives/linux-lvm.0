Message-ID: <3D29FD25.5050902@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] df reporting incorrect size?
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
Date: Mon Jul  8 16:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm a linux-lvm newbie (some limited use of IBM's LVM in AIX), and some 
use of Veritas in Solaris.  So I'm doing some testing, hoping to find 
out that lvm will serve my needs and that of my employer.

I've done all of my fdisks to change partition type (0x8e), vgscans, 
pvcreates, vgcreates, lvcreates, mke2fs on the lv etc, (used nice 
generic names for my testing, like vg and lv), mounted it up and get the 
following:


mount /dev/vg/lv /test
df -h /test
Filesystem            Size  Used Avail Use% Mounted on
/dev/spheravg/spheralv
                              59G   20k   56G   0% /test


WTF?!?!  Where'd that 3G go?  Does LVM mess with things so that the OS 
cant read volumes correctly?  Or is there another issue that I might be 
running into?

Thanks in advance for feedback/assistance/HELP.

Also, on another note, how difficult is it going to be for me to add 
another ~63G to this LV from another physical device?  The whole reason 
we're looking at LVM is mainly to perform this function (one HYUGE 
filesystem over multiple devices).
