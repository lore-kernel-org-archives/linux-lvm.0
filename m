Date: Sat, 13 Oct 2001 02:40:27 -0600
From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pv recovery after trashing partition table.
Message-ID: <20011013024027.B29785@turbolinux.com>
References: <20011013.022001.-448365.3.james.cromie@juno.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011013.022001.-448365.3.james.cromie@juno.com>
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
To: Jim Cromie <james.cromie@juno.com>
Cc: linux-lvm@sistina.com

On Oct 13, 2001  02:20 -0600, Jim Cromie wrote:
> So somehow I managed to corrupt hda4 at about the same time that
> I blanked the MBR.  I dont know how, but Ill accept that theyre
> causally (not casually) related.
> 
> I looked a bit at gpart's partition-type-guessing code, it shouldnt
> be too hard to work out which bytes are failing gpart's guesser.
> Getting LVM to accept my hacks may be much harder.

Well, I just ran gpart on a system I have with LVM partitions, and it
does detect them properly.

> So how big is an LVM super-block ?

There are several parts to the LVM metadata.  The PV data (first on the
partition), the VG data (next), LV data, and then the PE map.  Because
LVM metadata has been known to have problems in the past, one thing
you can try is to restore the metadata from backups (see vgcfgrestore).

The real problem is that the start of the filesystem depends on how big
the actual disk is, and the alignment.  If any of the LVM data is there,
doing something like "od -Ax -a /dev/hda4 | more", or even better
"strings -tx /dev/hda4" should show you the VG name, LV names, etc
(along with other stuff, of course).  If you find such data, it may be
possible to reconstruct your LVM setup, or at least recover the data.

> I always have the (probably 1-way) fallback - a partion type change, 
> then an fsck to see what it finds.

It will find nothing, because the filesystem doesn't start until (maybe)
a few MB into the partition.  Any fsck program will expect the filesystem
to start right at the beginning.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
