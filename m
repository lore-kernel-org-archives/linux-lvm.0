From: Stephan Austermuehle <au@hcsd.de>
Message-ID: <20020604145334.A8663@babbage.hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] pvmove: ERROR "pv_read(): device major number"
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
Date: Tue Jun  4 07:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

using Kernel 2.4.18+XFS 1.1+LVM 1.1rc2+VFS lock I want to move an LV
to a different PV to move the currently unprotected data to a mirrored
device. I entered the following line as root (no su -):

	# pvmove --version
	pvmove: Logical Volume Manager 1.1-rc1
	Heinz Mauelshagen, Sistina Software  15/03/2002 (IOP 10)

	# pvmove /dev/vg00/lv_swap /dev/hda1 /dev/md0
	pvmove -- ERROR "pv_read(): device major number" reading source physical volume "/dev/vg00/lv_swap"

The mentioned LV is not in use.

Same problem with a native disk partition:

	# pvmove /dev/vg00/lv_swap /dev/hda1 /dev/hdc1         
	pvmove -- ERROR "pv_read(): device major number" reading source physical volume "/dev/vg00/lv_swap"

The root file system is on an LV, too.

What's going on here?

Stephan
