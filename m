Message-Id: <sf9016d7.065@greyhound.com>
From: "Charles Lacour" <Clacour@greyhound.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [linux-lvm] Reducing the size of a physical volume
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
Date: Mon Oct 20 08:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Is it possible to reduce the size of a physical volume?

I have a 20-GB partition set up as LVM, and an instance of
Gentoo inside it, all of which works fine.

I wanted to check out Mandrake 9.2, so I set up a "mandrake"
logical volume, but Mandrake doesn't seem to support LVM
(at least not installing to it - it did recognize what the partition
was, and even how full it was, but didn't give me any way to
select an individual logical volume within it.)

I rebooted back into Gentoo, figuring to reduce the size of the
LVM partition by several gigabytes, and I can't find a way to do
it. (I suppose if I got really, really brave I could delete the
partition with fdisk and add it back starting at the same point,
but ending sooner, but I'm _not_ that brave (or foolish, depending).

If the answer is "No, you can't", any recommendations on how to
allocate things so that I don't get burned by this again?

Only thought I've had is several smaller partitions, each of which is
a PV to LVM. You couldn't let go of a precise amount of space
(especially since number-of-partition limits mean your partitions may
have to be a few GB each), but it would be better than the position
I _think_ I'm in now, which is "screwed to the wall".

I'm not subscribed to the list, so please CC any replies to:

clacour (at-sign) greyhound.com

Thanks in advance,

Charles Lacour
