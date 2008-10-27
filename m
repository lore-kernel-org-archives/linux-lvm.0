Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9RCHEn0031125
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2008 08:17:14 -0400
Received: from odzwierny2.comarch.com (inptr-69-10.comarch.com [217.74.69.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9RCGox6013793
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2008 08:16:50 -0400
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.com
	by odzwierny2.comarch.com with esmtpa (ComArch ESMTP)
	id 1KuR1d-00031r-QR
	for linux-lvm@redhat.com; Mon, 27 Oct 2008 13:16:49 +0100
From: =?iso-8859-2?Q?Marcin_Ka=B3u=BFa?= <marcin.kaluza@comarch.pl>
Subject: RE: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Mon, 27 Oct 2008 13:17:43 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <99ED4C7B-473E-422F-AC32-F34EB2A11FA4@redhat.com>
Message-Id: <E1KuR1d-00031r-QR@odzwierny2.comarch.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,
Well, that's not much of help since after it becomes invalid I'll know it
anyway (IO error ;D), so the event is purely informational.
The "other program" is just my simple script, that periodically scans all
mounted snapshots, checks if their root has specific xattrs set ("increase"
and "maxsize" - drawback is that it has to be mounted to work, the bonus is
that it is mountpoint and configuration file independent) and based on those
parameters it polls and resizes those snapshots if necessary. The problem
with this script is that if it polls them not often enough, there is a
possibility that it won't resize it in time.

The simplest (and mostly sufficient) thing to do would be forewarning that
you talk about. 

The way I see it:
In it's simplest form, at snapshot creation (or later of course) you would
give an extra param like --warn-level with either absolute size or
percentage value, so that lvm emits an event when free space in the snapshot
goes below that value. 
I think this doesn't require much work.

Better solution would be to have another two parameters, like --increase-by
and --max-size, that would tell lvm to enlarge the snapshot by --increase-by
MB's or percent when free space goes below --warn-limit(it could emit the
event anyway). --max-size would be enlargment limit, because sometimes we
might prefer snapshot to become invalid than to eat up too much space in vg.
Of course without --max-size the snapshot would extend until reaching the
size of original lv.
But I suppose this requires significantly more coding.

greetz,
Martin

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Jonathan Brassow
Sent: Friday, October 24, 2008 6:30 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] How to monitor and possibly autoextend snapshots

Right now, you get notified when the snapshot becomes invalid.  I  
thought I heard someone talking about adding forewarning, but I don't  
know where that stands.

You can respond to events (like the snapshot going invalid) through  
dmeventd, but any solution like that would require new code... and you  
would also need new code in the kernel to do the forewarning.

Since you have some knowledge of the arguments given to other programs  
for this feature... :)  Perhaps if you would be willing to envision  
the arguments necessary to 'lvcreate' when creating the snapshot, we  
could get the ball rolling.

  brassow


On Oct 24, 2008, at 4:33 AM, marcin.kaluza@comarch.pl wrote:

> Hi
>
> Is there a way to get notified, when the snapshot fills up to a  
> certain
> level? i.e.  via dmsetup wait [] ? I looked for event numbers but  
> couldn't
> find any doc for them.
> The best thing would be to make snapshots autoextensible when given  
> a max
> size and resize value (just like oracle tablespaces do), but I suppose
> that would require much coding...
> Any thoughts?
>
> We're using lvm snapshots for samba shadow copies and database  
> cloning,
> but there's a problem with monitoring snapshots % of usage - now we  
> just
> have a daemon that polls lvdisplay periodically and extends the lv  
> when
> necessary. But this is unreliable - you have to either poll often or  
> keep
> enough of free space and still you can end up with a trashed snap.
>
> Martin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
