From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] Fun little horror story -- please add to FAQ if
    it isn't already documented
Message-Id: <000001c19122$46771750$0b00a8c0@michaelmouse>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3C2E9935.513E8F99@symbionsys.com>
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
Date: Sun Dec 30 05:05:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

> Upon the next reboot, the initrd ran fine... found and activated the
> lv's... but the kernel said "no root partition" and hung.  I could
> rescue boot the system from the SuSE CD -- everything was there... I
> finally added a "vgdisplay -v" to the initrd's linuxrc, and
> that showed me the problem.
>
> The file system it was trying to mount was, to lilo, the device "3a:03"
> (major device number 58, minor 3), but, once I'd removed the old lv for
> extra disk space, any new vgscan during initrd assigned my new root lv
> to minor device number 2.  "root=/dev/..." doesn't help, for lvm (it
> doesn't like the name).  There was no longer an lvm minor device 3 to
> mount.

This looks like the same problem that I am having, although I haven't
removed any logical volumes!

I am not 100% sure how to find the device number, but common sense tells me
that it is the "Block #" at the bottom of the logical volume information, in
which case my root LV is Block # 58:1

> Once I saw the problem, I recue booted and chrooted to my new lvm, and
> manually changed the minor number before running lilo.

Please can you tell me how you changed this?

Cheers,

Ben
