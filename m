From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 18 Oct 2001 12:20:22 -0600
Subject: Re: [linux-lvm] SnapRestore software on NetApp
Message-ID: <20011018122021.G1144@turbolinux.com>
References: <0110181646580Y.24876@in-cadcae4> <20011018174818.C849@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011018174818.C849@btconnect.com>
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

On Oct 18, 2001  17:48 +0100, Joe Thornber wrote:
> On Thu, Oct 18, 2001 at 04:46:58PM +0200, Emanuel Quass wrote:
> > But to come to business, I have to write a comparison between Linux  and 
> > NetApp Filers. (Is there anything already somewhere available?)
> > 
> > I saw something about a "SnapRestore software" which means that it is 
> > possible to revert a snapshot back to the filesystem in some minutes!
> > My question: Is this possible with LVM and reiserfs too?
> 
> I'm not sure what you mean by 'reverting a snapshot back to the
> filesystem', but dropping a snapshot takes very little time (seconds).

What this means is to make the "snapshot" become the primary copy again,
and not "dropping" it.  In other words, lets say you just deleted a whole
bunch of files on your filesystem, or your database chewed up the data.
Instead of restoring from a backup, or copying from the snapshot into a
new volume, you "revert" the snapshot data back into the original volume.
The latter only involves copying as much data as is in the snapshot,
instead of the entire volume.

If you had "symmetrical" snapshot volumes (i.e. the snapshot is exactly
a regular volume and both the snapshot and the original have "links"
to the blocks that they use) it would be possible to "drop" the original
and move the snapshot to become the original volume.

This may be possible to do in the short term with writable snapshots,
but then you start getting into a very ugly situation where the "good"
volume (i.e. the writable snapshot) depends on the snapshot, which
depends on the original "bad" volume and you can't get rid of any of them.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
