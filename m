Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8C4640w023553
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 00:06:04 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8C45xWk018818
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 00:06:00 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p8C45nMi003719
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 21:05:51 -0700
Message-ID: <4E6D851D.3060300@tlinx.org>
Date: Sun, 11 Sep 2011 21:05:49 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E6D5600.4060008@tlinx.org>	<alpine.LRH.2.00.1109112258290.5505@bmsred.bmsi.com>
	<alpine.LRH.2.00.1109112310400.5744@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1109112310400.5744@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] more vg problems or oddities...not using dmsetup
	remove seems to be bad?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I might as well nuke the merge....I'd have to restore 2 images to 
restore all the files
to this morning....if something went bad, but if I wait around...

I can't see it merging block diffs on an actively mounted file system...that
would just be insane!

really seems like best thing would be to nuke the merge somehow, then 
wouldn't
have to resort to backups...

Restoring a TB of data takes a bit of time...

The file system it's trying to merge to is my home dir...
(where all my work goes...;-)...

But while past performance is no guarantee of future performance, currently
my system's uptime stands at 44 days, so it could be a while before said 
merge
happens, or ... could happen sooner if I 'try to fix it'....;-)
(power is on UPS, so usually reboots happen because I do something  -- 
usually planned,
but occasionally after shooting one's self in foot...)...

Since it can't start the merge...seems like there should be a way to 
stop it w/o causing problems.

**--case in point re:shooting self in foot -- merging 8 day old snap 
w/current vol in trying to
work around bugs...*sigh*

You may be right...the force option may be less painful that fixing this 
merge thing
if it goes south...




Stuart D. Gathman wrote:
> On Sun, 11 Sep 2011, Stuart D. Gathman wrote:
>
>> On Sun, 11 Sep 2011, Linda A. Walsh wrote:
>>
>>> tried -- merging it...
>>
>> Ooops.  You likely did not want that.  That reverts the origin volume
>> to the snapshot by copying the original data for updated sectors from
>> the snapshot.  This is an extremely useful feature, but *not* when
>> you invoke it accidentally!
>
>>> I'm wondering if I really want this 'merge' it wants to do...and if 
>>> not, how do I abort it?
>>
>> If it is really delayed until boot (or close), then you have a chance 
>> to abort
>> it, but I don't know how.  I hope an expert answers.  Meanwhile, I'll
>> peruse the man page to see if it talks about delayed merge.
>
> The man page says:
>
>   If both the origin and snapshot volume are not open the merge will 
> start
>   immediately.   Otherwise, the  merge  will start the first time 
> either the
>   origin or snap??? shot are activated and both are closed.  Merging a 
> snapshot
>   into an  origin that cannot be closed, for example a root 
> filesystem, is
>   deferred until the next time the origin volume is  activated.  When  
> merging
>   starts, the resulting logical volume will have the origin's name, minor
>   number and UUID.  While  the  merge  is  in progress,  reads  or  
> writes  to
>   the origin appear as they were directed to the snapshot being 
> merged.  When
>   the merge finishes, the merged snapshot is removed.  Multiple 
> snapshots may
>   be specified on the commandline or a @tag may be used to specify 
> multi??? ple
>   snapshots be merged to their respective origin.
>
> If you have space, I would copy your origin LV while you can.  There is
> nothing about cancelling the merge.  I suspect you could restore the 
> metadata
> backup from before your merge.  But make backups first!
>
> -- 
>           Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
