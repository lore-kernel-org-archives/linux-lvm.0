From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 4 Oct 2001 12:06:44 -0600
Subject: Re: [linux-lvm] Root + Software RAID 1 in partition + LVM + Reiserfs
Message-ID: <20011004120644.J31061@turbolinux.com>
References: <NEBBLHFAEINCLDICDLOAEENBCHAA.yves.alloyer@slpinfoware.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NEBBLHFAEINCLDICDLOAEENBCHAA.yves.alloyer@slpinfoware.com>
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

On Oct 04, 2001  16:51 +0200, yves.alloyer wrote:
> I wanted that, because I wanted to mirror my most precious filesystems. Then
> again I did not want to waste that space for swap /tmp and other not so
> vital stuff.

Are you looking for system uptime or data protection?  If you want uptime,
you still need to mirror swap and /tmp.  If you want data protection, you
should do backups, because there is nothing preventing you from deleting
your files accidentally (or kernel/fs corruption) and the RAID making a
perfect copy of the missing/bad files.

> pvcreate /dev/md1 complained about using a Linux SWAP partition

Did you change the partition type with fdisk to be the LVM partition type?
Hmm, I suppose that if you are using MD RAID autostart, you need to have
that partition type instead.

> I tweaked lvm_check_partitioned_device to have it return FALSE for MD
> devices. This would probably prevent me from partitioning any MD device. But
> I won't anyway... that's what I use LVM for.

I don't think you CAN partition an MD device and use it (what would the minor
numbers be?).  Please submit the patch.

> Has anyone experience with that kind of layout? Is it just plain insane?

No, sounds sensible to me.  Make sure you have a rescue disk/partition which
has MD, LVM, and reiserfs tools on it.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
