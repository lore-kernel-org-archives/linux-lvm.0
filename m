Date: Tue, 09 Oct 2001 11:32:47 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <387040000.1002641567@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] rc4 can't take snaphots of 0.9.1_beta7 lvs
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

Hello everyone,

Looks like the compatibility code in rc4 doesn't properly snapshot beta7
logical volumes (2.4.10 kernel).

To reproduce, I did this:

Install 0.9.1 beta7 tools

pvcreate /dev/sdb2
vgcreate big /dev/sdb2
lvcreate --size 6G -n lv1 big
vgchange -a n
rmmod lvm-mod

Install rc4 tools
vgscan
vchange -a y
mkfs /dev/big/lv1
mount /dev/big/lv1 /data
lvcreate --size 1G -n snap --snapshot /dev/big/lv1
(trigger COW to snapshot)

And I get these messages:

lvm -- _pv_get_number failed for rdev = 0
lvm -- giving up to snapshot /dev/big/lv1 on /dev/big/snap: couldn't
prepare kiovec blocks (start probably isn't block aligned).

Now that I can reliably reproduce on stock kernels/tools, I'm trying to
trace it further.  If anyone has ideas I'd love to hear them.

-chris
