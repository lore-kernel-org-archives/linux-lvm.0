From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <000401c18e76$2917df40$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000201c18e66$847edec0$0b00a8c0@homelan.org>
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
Date: Wed Dec 26 19:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>> did you run lilo again after creatinh the initrd?
>
> <sheepish grin> No </sheepish grin>
>
> OK, ran lilo and it got back to stage one again - cannot open
> libz.so.1
> (error exactly the same as per my first LVM root mail) :(

And having looked around a bit more, I discovered that the newer version
creates an image in /boot that is not called initrd :)

So I changed /boot/lilo.conf to reflect the new boot image and tried again.

This time the image decompresses OK and then I get:

****

VFS: Mounted root (ext2 filesystem)
VFS: Cannot open root device "3a01" or 3a:01
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 3a:01

****

> I had some trouble with pvcreate because MDK set my system up with devfs
> enabled.

> Could this be playing some part in the problem?

I should also mention that I ran lvmcreate_initrd with the -D option, but
that didn't help.

Cheers,

Ben
