Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB304601B3
	for <linux-lvm@redhat.com>; Fri,  5 Apr 2019 16:15:24 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94FDE30821AE
	for <linux-lvm@redhat.com>; Fri,  5 Apr 2019 16:15:22 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23719.32536.621807.409030@quad.stoffel.home>
Date: Fri, 5 Apr 2019 12:15:20 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <bda0a468-0d92-22d8-fe3a-825b37e69790@andrewnesbit.org>
References: <819376bf-9ee7-b700-6057-6e8035c0e0e8@gmail.com>
	<23716.3863.42782.886096@quad.stoffel.home>
	<bda0a468-0d92-22d8-fe3a-825b37e69790@andrewnesbit.org>
Subject: Re: [linux-lvm] LVM RAID10 busy 100%
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
Content-Type: text/plain; charset="us-ascii"
To: Andrew Luke Nesbit <email@andrewnesbit.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Andrew" == Andrew Luke Nesbit <email@andrewnesbit.org> writes:

Sorry for the delay in replying!

Andrew> On 03/04/2019 02:40, John Stoffel wrote:
Andrew> [...]

>> I'd probably re-do the RAID using RAID4 (fixed parity disk) since
>> you're (probably) just doing a bunch of writing of video files, which
>> are large streaming writes, so you won't pay the penalty of the
>> Reade/Modify/Write cycle that RAID4/5 has with lots of small files
>> being writteing.  But I'd also be using MD under-neath LVM, with XFS on
>> top.  Something like this:
>> 
>> 1.   partition each disk with a single whole disk partition
>> 2.   mdadm --create /dev/md0 --level=raid4 --raid-devices=8
Andrew> /dev/sd[a,b,c,e,f,g,k,l]1
>> 3.   pvcreate /dev/md0
>> 4.   vgcreate data /dev/md0
>> 5.   lvcreate -L +12T -n data data
>> 6.   mkfs.xfs /dev/mapper/data-data

Andrew> Why would you explicitly use MD underneath LVM?  I have
Andrew> compared the two from a user's level and a best practices
Andrew> perspective.  My understanding is that LVM uses MD for its low
Andrew> level operations anyway.

I would explicitly do it for manageability.  And separation of the
layers.  I like the mdadm for my RAID layers, with LVM on top so I can
create LVs and them move them around without having to think about it
as much.  

Andrew> What do we gain by using `mdadm --create` instead of using the
Andrew> equivalent LVM commands to set up the RAID array?

I haven't seen as good a set of tools and reporting of configuration
from the lvm tools as I have from the mdadm tools.  But... I could be
wrong and just a stuck in the mud old fossile.  :-)

But in this case I think it also brings the benefits of spreading the
load across more CPUs, since I *suspect* that LV and it's RAID
implementation might be more bottle-necked than the mdadm code is.

But it doesn't hurt to test!

If this is a new setup, ideally the user would have the time to do
some test setups, write his data, and see how the performance is with
different setups.  You don't need to even run iozone or anything, just
a simple 'time /path/to/command args' might be enough to show you
which is better.
