From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Drive gone bad, now what?
Message-ID: <20031028081933.GA1629@tykepenguin.com>
References: <20031021171817.GA28462@mail.parplies.de> <3F985B2D.5060008@xs4all.nl> <16280.27367.874758.610758@gargle.gargle.HOWL> <3F98B691.7090902@webhackande.se> <3F9989C9.1070909@xs4all.nl> <16285.12868.20878.180441@gargle.gargle.HOWL> <3F9DB7D8.5080502@xs4all.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F9DB7D8.5080502@xs4all.nl>
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
Date: Tue Oct 28 02:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 28, 2003 at 01:27:04AM +0100, Gert van der Knokke wrote:
> John Stoffel wrote:
> 
> >Gert> I didn't expect lvm to restore the missing data, I guessed it
> >Gert> would just let me access the rest of the data.
> >
> >At this point, you have to think, how can my filesystem cope with the
> >loss of a 60gb chunk of data in the middle (start or end even) of the
> >300+ gb of data?  There's all sorts of meta-data and true data which
> >is now gone, and re-building the filesystem into a consistent state is
> >really impossible.  
> >
> Hmm, and so I think LVM still needs a warning label :-)
> 
> I wonder why LVM doesn't work the other way around:
> Create filesystems on several disks and then concatenate these to the 
> outside as one large filesystem. This way if one drive goes bad you can 
> always individually mount the drives and use the data.
> 
> >If you are looking for a large/cheap/reliable bunch of storage,
> >instead of mirroring, you might want to think about RAID5 instead.
> >
> No, what we're looking for is an 'expandable as needed' filesystem and 
> this is what LVM pretends to be.

No. LVM does in no way "pretend to be a file system". It's an expandable block
device. What the filesystem does with that block device is up to it. 

If a disk fails and you're not using RAID then you restore from backups.

-- 

patrick
