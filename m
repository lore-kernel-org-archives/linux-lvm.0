Return-Path: <thornber@btconnect.com>
Date: Tue, 31 Jul 2001 10:36:12 +0100
Subject: Re: [linux-lvm] Changing partition names? [vgscan not seeting PV]
Message-ID: <20010731103612.B464@btconnect.com>
References: <Pine.LNX.4.21.0107310046190.12641-100000@server.gordon.co.nz> <Pine.LNX.4.21.0107310958290.14766-100000@server.gordon.co.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0107310958290.14766-100000@server.gordon.co.nz>; from donald@gordon.co.nz on Tue, Jul 31, 2001 at 10:06:26AM +1200
From: Joe Thornber <thornber@btconnect.com>
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

On Tue, Jul 31, 2001 at 10:06:26AM +1200, Donald Gordon wrote:
> On Tue, 31 Jul 2001, Donald Gordon wrote:
> 
> > On Mon, 30 Jul 2001, AJ Lewis wrote:
> > 
> > > On Mon, Jul 30, 2001 at 11:48:56PM +1200, Donald Gordon wrote:
> > > > I can't seem to see any way to tell lvm that the name of one of the
> > > > partitions it is using has changed (from /dev/sda10 to /dev/sda8; I'm
> > > > transitioning a system to LVM).  Should it pick this up on reboot or is
> > > > there some config file I need to prod?
> > > 
> > > vgscan will do this for you automatically.
> > > 
> > 
> > When I (ahem) remove a partition by mistake and re-create it in the same
> > location with fdisk vgscan no longer recognises it.
> 
> I can't see anything particularily odd about this partition BTW; I'm not
> sure what a LVM superblock is supposed to look like but what's there
> *seems* to be likely to be something.  Is the partition table supposed to
> have some sort of flag in it (apart from the type=0x8e) saying "I'm an LVM
> PV" or is it likely the data (my /usr and /home :( ) in the PV is gone
> forever?

Your data should still be there, I've done a similar thing and still
managed to recover it.  Just don't write anything to that device.  Try
experimenting with the pvdata command on your suspect partition.

> 
> If it makes sense to anyone, the first 4kb (and 512kb is in the same
> directory) of that partition is at http://fias.co.nz/lvm/sda6-4k

I just had a look, it certainly doesn't look like a pv.  So either the
metadata got fried, in which case you should restore from a backup.
Or you didn't restore the partition to the same location, in which
case dump a bit more of the partition, and hunt for strings that match
the names of your vg and lv's.

- Joe
