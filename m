Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q93FlMmo023970
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2012 11:47:22 -0400
Received: from qmta12.emeryville.ca.mail.comcast.net
	(qmta12.emeryville.ca.mail.comcast.net [76.96.27.227])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q93FlJxt018767
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2012 11:47:19 -0400
Message-ID: <506C5CD8.2070502@mohawksoft.com>
Date: Wed, 03 Oct 2012 11:42:16 -0400
From: Mark Woodward <markw@mohawksoft.com>
MIME-Version: 1.0
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
In-Reply-To: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] access or interface to list of blocks that have,
	changed	via C.O.W.?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: Linda Walsh <lvm@tlinx.org>

There are a couple projects that do this. They are pretty much based on 
ddsnap. You can google it.
In LVM2 world, it is fairly trivial to do what you want to do.

(1) create a virtual disk.
(2) take the "old" snapshot.
(3) write to lvdisk
(4) take the "new" snapshot.


At this stage the COW device of the "old" snapshot has all the data that 
has changed up to and including the "new" snapshot. You can back that 
up. As a differential. Then delete the "old" snapshot. The "new" 
snapshot is now renamed to the old snapshot.

Take the next "new" snapshot. The renamed "old" snapshot has the changes 
since the previous snapshot up to and including the latest "new" 
snapshot. Just repeat this process, and you can do incremental backups 
of your LVM disks.

The biggest issue with performance is the COW aspect of snapshots. I 
have found using 64K chunk sizes greatly increase performance by 
reducing COW to snapshots. The default size if 4K.



On 10/03/2012 10:36 AM, linux-lvm-request@redhat.com wrote:
> From: Linda Walsh<lvm@tlinx.org>
> To: LVM general discussion and development<linux-lvm@redhat.com>
> Subject: [linux-lvm] access or interface to list of blocks that have
> 	changed	via C.O.W.?
> Message-ID:<50651097.2060200@tlinx.org>
> Content-Type: text/plain; charset=UTF-8; format=flowed
>
> I'm trying to use snapshots that are active for a day or so to grab
> differences between successive days for allowing me to display previous
> versions of files over a month or so...
>
> They aren't a replacement for my daily towero'hanoi-backups, but
> they are a great deal easier to use.
>
> The chink in my plan is the time it is taking to do a diff -- not really
> a fatal chink but annoying.  It takes anywhere from 80-100 minutes for
> rsync to sum up the changes and copy them to a third volume each day.
>
> I figured well sheesh, the lvm should already know what sectors are
> different.  If I could combine that info against a inode+blockmap, I might
> get that diff computation down to under 10 minutes maybe under 5.
>
> The contents of the files that are computed as differences by rsync usually
> take a minute or less to actually copy into final volume -- anywhere between
> 800Mb - 2.5GB out of a 1TB volume.   So I I could shortcut that diff
> process,
> might make it practical to do more than one snapshot a day;...
>
> Is there some interface for getting at that information or would it have
> to be written from scratch?
