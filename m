From: Harri Haataja <harri.haataja@smilehouse.com>
Subject: Re: [linux-lvm] resize LV
Message-ID: <20030129110758.GA19302@mail1.smilehouse.com>
References: <00bd01c2c710$52576aa0$0a42a8c0@darkstar> <Pine.LNX.4.44.0301281505150.5767-100000@zeus.itg.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301281505150.5767-100000@zeus.itg.uiuc.edu>
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
Date: Wed Jan 29 05:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 28, 2003 at 03:08:12PM -0600, Alexander Lazarevich wrote:
> JFS can totally do it. I've been using AIX before we moved to Linux,
> and I did it all the time.
> There must be a way to do it on linux systems using ext3. Anyone?

> On Tue, 28 Jan 2003, Thomas Kleffel wrote:
> > > I know how to expand the LV while the LV is mounted, piece of cake
> > > (lvextend -L+50GB /dev/homevg/userslv - expands userslv by 50GB).
> > > But how do I expand the filesystem while it is mounted? I don't
> > > want to umount the filesystem down to do this.
> > >
> > > The filesystem is an ext3 filesystem. Can I use resize2fs?
> > No, afaik neither ext2 nor ext3 support resizing while being
> > mounted.  And if I'm not wrong JFS and ReiserFS can't do this either
> > but XFS can.
> > I'm using XFS for this reason and it works fine for me.

FWIW
On the kernels I've used (no JFS patches, notably), ext3, xfs, reiserfs
resize on the fly and jfs (which requires a weird remount option) still
doesn't. IIRC ICBW

And I'm absolutely sure that the reiserfs's I resize while mount every
now and then do so and don't even require force switches anymore.
