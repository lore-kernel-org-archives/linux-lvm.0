Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 3 Aug 2001 09:32:24 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Snapshot Info
Message-ID: <20010803093224.B1549@tykepenguin.com>
References: <Pine.LNX.4.33.0107311215030.6499-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107311215030.6499-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Tue, Jul 31, 2001 at 12:20:02PM +0100
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

On Tue, Jul 31, 2001 at 12:20:02PM +0100, James Pattinson wrote:
> Hi
> 
> OK, I've got snapshots working now that I've re-created my PVs with beta8
> tools.
> 
> Where can I find some more info about how snapshots work? I'm a bit
> confused as to how space is allocated. Here's an example of what I'm
> seeing:
> 
> I have a 3GB LV called /dev/vg00/lvol6 that is about half full.
> 
> 1.	Created a 512MB snapshot LV for this LV
> 2.	Copied 9MB worth of data to /dev/vg00/lvol6
> 3.	Looked at lvdisplay /dev/vg00/snap_lvol6 and 18MB is used in the
> snapshot.
> 
> Where does the figure 18MB come from? is the fact that it is 2 x 9MB
> significant?

That's a bit odd - I usually see the "right" amount allocated to the snapshot.
Regardless of whether it's reiserfs or ext2 I'm using.

Shot in the dark : you're not using ext3 with data journalling enabled are you?
(OK just a thought!)
 
> I'd quite like to know how big I should be making my snapshots.

Normally the amount you would expect to put onto the original volume during the
snapshot's lifetime plus a small amount (maybe 4meg) for overhead. I suppose it
may depend on the filesystem you are using and possibly even the data (though i
can't see why, offhand)

patrick
