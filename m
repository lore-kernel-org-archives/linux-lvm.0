Date: Thu, 4 Oct 2001 20:28:47 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Root + Software RAID 1 in partition + LVM + Reiserfs
Message-ID: <20011004202847.E31965@colombina.comedia.it>
References: <NEBBLHFAEINCLDICDLOAEENBCHAA.yves.alloyer@slpinfoware.com> <20011004120644.J31061@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011004120644.J31061@turbolinux.com>; from adilger@turbolabs.com on Thu, Oct 04, 2001 at 12:06:44PM -0600
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

On Thu, Oct 04, 2001 at 12:06:44PM -0600, Andreas Dilger wrote:
> On Oct 04, 2001  16:51 +0200, yves.alloyer wrote:
> > pvcreate /dev/md1 complained about using a Linux SWAP partition
strange post output of lvmdiskscan

> Did you change the partition type with fdisk to be the LVM partition type?
> Hmm, I suppose that if you are using MD RAID autostart, you need to have
> that partition type instead.
yes lvm code looks for either lvm partition or md device.

> > I tweaked lvm_check_partitioned_device to have it return FALSE for MD
> > devices. This would probably prevent me from partitioning any MD device. But
> > I won't anyway... that's what I use LVM for.
this should not be needed, i'll have to check that code...

> I don't think you CAN partition an MD device and use it (what would the minor
> numbers be?).  Please submit the patch.
if you look on Neil Brown (md maintainer) site you will find patches to
partition md devices
http://cgi.cse.unsw.edu.au/~neilb/patches/linux

> > Has anyone experience with that kind of layout? Is it just plain insane?
> 
> No, sounds sensible to me.  Make sure you have a rescue disk/partition which
> has MD, LVM, and reiserfs tools on it.

i was able to put everything in my initrd using busybox for most tools
(i have lvm over raid5 and 3 way mirrored /boot)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
