From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] why I can't find lvm VG after reboot
In-Reply-To: <001d01c0bc34$a408df20$961471dc@XW>
Message-Id: <Pine.LNX.4.44.0204031249290.17100-100000@pzat.meep.org>
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
Date: Wed Apr  3 06:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Tue, 3 Apr 2001, netxiong wrote:

> I have setup a VG on a softraid system consist of 3 disks,I name the VG as lvmraid and make a ext2 file system on it,It can be mounted to a dirctory and work well,but after I reboot the system,I can't find the VG,the proc system also doesn't show it and I can't use vgremove to remove it.
> what is wrong with it,helllllllllllllllllllllp!!!this has troubled me for two days
>
>

Are the following two lines in your rc.sysinit?

Do that after you activate your raid.

# activating volume manager
vgscan
vgchange -a y

When you shutdown you must....

vgchange -a n

do that just before
mount -n -o remount,ro /
