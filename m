Return-Path: <bluca@comedia.it>
Date: Wed, 16 May 2001 23:05:11 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] successes & resizing
Message-ID: <20010516230511.A25665@colombina.comedia.it>
References: <Pine.LNX.4.10.10105141942530.5506-100000@staff> <200105161655.f4GGtrHQ007080@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200105161655.f4GGtrHQ007080@webber.adilger.int>; from adilger@turbolinux.com on Wed, May 16, 2001 at 10:55:53AM -0600
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 16, 2001 at 10:55:53AM -0600, Andreas Dilger wrote:
> Todd Underwood writes:
> > i have a separate question about ext2 resizing on a separate system:  when
> > i try to resize the root (using the ext2online resize patch to 2.4.3) i
> > get:
...
> > bash-2.04# e2fsadm -L +200M / 
> > e2fsadm -- invalid logical volume name "/dev/root"
> 
> That is because in /proc/mounts, "/" is pointing to "/dev/root".  Sorry,
> not much I can do about that - you need to specify the real device name
> for root.

curious, my /proc/mounts is correct wrt device names
i have:
[vc/2]root@Moskowskaya:~# cat /proc/mounts
/dev/vg01/lvol1 / ext2 rw 0 0
....

could this be due to the LVM_HD_NAME that was rejected from the kernel
some time ago?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
