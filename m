Return-Path: <josv@osp.nl>
Date: Tue, 27 Mar 2001 16:56:30 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Can I use snapshots for this?
Message-ID: <20010327165629.W453@jadzia.josv.com>
References: <20010327163701.B6980@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010327163701.B6980@dragon.blacknet.de>; from lvm@blacknet.de on Tue, Mar 27, 2001 at 04:37:01PM +0200
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

Hi Goetz,

You can indeed use snapshots for this. Basically what you need to do is
create a snapshot each night at 4:00 of your /whatever lvol (e.g.
/home). Then mount that snapshot as /nightly. Through that mountpointm
your users will see the status of the /whatever file system (including
file presence and contents) as it was when the snapshot was created!
Because the snapshot feature saves only the updates content from the
original logical volume, you need allocate only a fraction of the space
of the original lvol to the snapshot. It depends on the update rate, but
typically only 10%.

++Jos

P.S. Don't forget to umount and remove the old snapshot in your nightly
     procedures...


And thus it came to pass that Goetz Bock wrote:
(on Tue, Mar 27, 2001 at 04:37:01PM +0200 to be exact)

> 
> Hi,
> 
> I'm sorry, if this whould haven been obvious by simply triing, but I did
> can not remember to read anything in the docs:
> 
> I'm currently running a small 20GB RAID array and allow my users a
> simple versioning by storing a copy of all files one an IDE drive in the
> system every night at 4:00.
> 
> As 20GB are very small, we'll get a 180GB RAID in the next month.
> Unfortunately there is no cheep 180GB ide drive do have this way of
> verioning :-(.
> 
> But I thought about using LVMs snapshoots for this. Can I do so?
> 
> Thanks,
>     Goetz.



-- 
assert(heaven.isMissing(anAngel));
