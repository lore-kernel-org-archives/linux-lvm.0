From: bscott@ntisys.com
Subject: Re: [linux-lvm] cannot mount logical volume on boot
In-Reply-To: <3D878E26.6050205@jumpline.com>
Message-ID: <Pine.LNX.4.44.0209171641110.21807-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Tue Sep 17 15:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 17 Sep 2002, at 4:18pm, ben@jumpline.com wrote:
> If I uncomment that line and reboot, everything fails and I get to the
> single-user mode root password prompt.

  It sounds like the LVM is not up and running properly with the LV
available when the filesystem check is run, causing the fsck to fail,
causing the initscripts to drop you into the emergency "your system is
really hosed" shell at boot.

> I've had to hardlink /dev/vg/lv to /dev/sdz1

  Instead of a hardlink, try a symlink.  I suspect the hardlink is causing
the device node magic in the LVM userland programs to get all borked up.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
