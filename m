Message-ID: <3D87AC21.7060708@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cannot mount logical volume on boot
References: <Pine.LNX.4.44.0209171641110.21807-100000@dragon.inside.ntisys.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Sep 17 17:27:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

bscott@ntisys.com wrote:

>  It sounds like the LVM is not up and running properly with the LV
>available when the filesystem check is run, causing the fsck to fail,
>causing the initscripts to drop you into the emergency "your system is
>really hosed" shell at boot.
>  
>
Yeah, just trying to figure out why, excatly.

>
>  Instead of a hardlink, try a symlink.  I suspect the hardlink is causing
>the device node magic in the LVM userland programs to get all borked up.
>
>  
>

After reading your suggestion I thought I'd give that a shot...what I 
get is a message telling me  /dev/sdz1 is not a valid block device.
