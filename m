Return-Path: <jay@lazy.accessus.net>
Date: Wed, 13 Dec 2000 22:51:46 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] LVM and inactive snapshots.
In-Reply-To: <Pine.OSF.4.21.0012132236390.7029-100000@lazy.accessus.net>
Message-ID: <Pine.OSF.4.21.0012132249280.24610-100000@lazy.accessus.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Along these lines, after I filled a snapshot I did the following:

	umount /snapshot
	umount /source
	vgchange -an
	rmmod lvm-mod
	insmod lvm-mod
	vgscan
	vgchange -ay
	lvdisplay /snapshot

And the snapshot showed that it was active and had 0% of it's reserved
space filled.  BUG?

On Wed, 13 Dec 2000, Jay Weber wrote:

> Hi,
> 
> It seems both LVM 0.8 and 0.9 don't address snapshots running out of
> reserved space very well.  From experience using it here's what I'm
> seeing.
> 
> When a snapshot runs out of reserved space, lvm deactivates the snapshot
> and cleans up it's allocation units it was using for it.  It still leaves
> the snapshot volume device around as well and if the snapshot was actively
> mounted, it remains mounted.  Keep in mind after the snapshot has gone
> inactive, the dataset image it is portraying is NOT the same as it was
> prior, viewing it in inactive state seems to show the exact same data that
> the source volume contains, ie. it's a pointer back to source volume.
> 
> Given the above I'm curious as to how others view this behaviour.  I'm
> thinking along the lines of:  If the snapshot goes inactive and it's
> portrayal of the filesystem is no longer valid it should go away. Go away
> meaning, if an inactive snapshot volume is currently mounted possibly we
> should forcefully unmount it as well as cleaning up it's device node
> entries and removing it as a block device.
> 
> Does that seem proper?
> 
> I suppose the ideal here is that you should never run out of reserved
> space though, and if you were DEPENDING on that snapshot and you did run
> out of reserved space, well, I assume you're just completely screwed in
> that case. :)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
