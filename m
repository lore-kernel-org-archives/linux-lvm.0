Return-Path: <bluca@comedia.it>
Date: Thu, 24 May 2001 21:48:49 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [lastquestion]
Message-ID: <20010524214849.A32747@colombina.comedia.it>
References: <NBBBKLKHMJHIJLHOGAOJGENMIOAA.steve.wray@the.net.nz> <200105240641.f4O6fIrW031893@webber.adilger.int> <20010524092225.A6632@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010524092225.A6632@sistina.com>; from lewis@sistina.com on Thu, May 24, 2001 at 09:22:25AM -0500
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

On Thu, May 24, 2001 at 09:22:25AM -0500, AJ Lewis wrote:
> On Thu, May 24, 2001 at 12:41:18AM -0600, Andreas Dilger wrote:
> > Actually, I posted a similar question to linux-kernel, but I think it was
> > lost in the noise.  Basically, it _is_ possible to have a "finitrd" for
> > just this situation (at least on 2.4).  You unmount all but root, set up
> > a ramfs, and pivot_root into the ramfs.  You can then unmount root (not
> > just a read-only remount), and properly shutdown LVM/RAID/etc.  Haven't
> > tried it myself, but it should work.
> 
> I keep seeing this pivot_root thing.  Is it actually implemented in 2.4, and
> if so, how does one go about doing it?
according to docs pivot_root syscall is implemented since 2.3.41
i believe pivot_root command is in util-linux 2.10

you use pivot_root command like
mount /dev/vgRoot/lvRoot /Root #mount real root fs
cd /Root 
mkdir -p old_root
pivot_root . old_root #this swaps root and old_root
exec chroot . /sbin/init

btw syscall is 
int pivot_root(const char *new_root, const char *put_old);

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
