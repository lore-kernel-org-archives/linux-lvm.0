MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16285.12868.20878.180441@gargle.gargle.HOWL>
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] Drive gone bad, now what?
In-Reply-To: <3F9989C9.1070909@xs4all.nl>
References: <20031021171817.GA28462@mail.parplies.de>
	<3F985B2D.5060008@xs4all.nl>
	<16280.27367.874758.610758@gargle.gargle.HOWL>
	<3F98B691.7090902@webhackande.se>
	<3F9989C9.1070909@xs4all.nl>
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
Date: Mon Oct 27 08:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Gert> Yes, it was just concatenation, no striping, since lvm is
Gert> 'expandable as needed' we opted for this.

Ok.

Gert> I didn't expect lvm to restore the missing data, I guessed it
Gert> would just let me access the rest of the data.

At this point, you have to think, how can my filesystem cope with the
loss of a 60gb chunk of data in the middle (start or end even) of the
300+ gb of data?  There's all sorts of meta-data and true data which
is now gone, and re-building the filesystem into a consistent state is
really impossible.  

Sure, you spent heroic amounts of time, you might be able to pull back
lots of data from individual sections where it's still around, but in
general, it's not going to happen.

If you are looking for a large/cheap/reliable bunch of storage,
instead of mirroring, you might want to think about RAID5 instead.  In
your case, you had a mix of disks, so what you could do is build a
pair of RAID5 arrays using disks of the same size for each array
(minimum of three disks each of course) and then stripe the filesystem
across both arrays.  

To add more storage, you need to work on chunks of three disks, but
since 120gb disks are going for around $100 these days, it's not that
expensive.

Good luck! 

John
