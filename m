Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA5Nk2r32028
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 18:46:02 -0500
Received: from imf23aec.mail.bellsouth.net (imf23aec.mail.bellsouth.net
	[205.152.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA5NjusW001676
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 18:45:56 -0500
Received: from zira ([65.1.73.179]) by imf23aec.mail.bellsouth.net
	(InterMail vM.5.01.06.11 201-253-122-130-111-20040605) with ESMTP
	id <20041105234547.XQZU2429.imf23aec.mail.bellsouth.net@zira>
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 18:45:47 -0500
Message-ID: <003901c4c391$80d7d840$6408a8c0@zira>
From: "Kevin Richard" <Kevin_Richard@bellsouth.net>
References: <001d01c4c38d$71834590$6408a8c0@zira>
	<1099697865.3848.6.camel@localhost>
Subject: Re: [linux-lvm] How exactly does LVM's get written?
Date: Fri, 5 Nov 2004 17:45:17 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

That's basically what I gathered from what I had been reading also... is
there any way to "defrag" so to speak the data, so say I end up deleting
data from 300mb of PE's on disk1 then when I write 600mb or data, I don't
want 300mb to go to disk1 and 300mb to disk2 cause after any bit of time has
passed on a fairly used system it will no longer really be linear at all!  I
guess I'm asking a lot for this system :(

Cheap is a relative term ;)  I just got the two 80gigs and only because
there was a $60 rebate on each of them from Bestbuy so I got to fudge one of
my rebate forms to be sent to someone else to get my $120 for both drives ;)

----- Original Message -----
From: "Clint Byrum" <cbyrum@spamaps.org>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Friday, November 05, 2004 5:37 PM
Subject: Re: [linux-lvm] How exactly does LVM's get written?


> On Fri, 2004-11-05 at 17:16 -0600, Kevin Richard wrote:
> > I have searched many topics in archive and even randomly scanned for any
> > info related to this but have only come away with a "I think it works
this
> > way" feeling.
> >
> > I set up two 80gig drives as one 160gig VG  /dev/VG1/LV1  I then
proceeded
> > to copy about 93 gigs of data from a 100gig drive that I will hopefully
add
> > to the LV to make it 260gigs.
> >
> > My questions are:
> >
> > 1. Is this a "spill over" type of write method where it will fill up
hde1
> > (first 80gig) and then move to hdf1 (other 80gig) and then of coarse on
to
> > hdg1 (100gig)?  Which would allow me the convenience of having one HUGE
> > mount and thus not having to constantly monitor and move data to 3
different
> > drives as space is needed.  Yet it keeps the data somewhat separated
(except
> > for the "spill over" that might get wrote to two drives at some point)
so if
> > I lose a hard drive I only lose what is on that drive and can just
replace
> > the drive and recreate the VG and salvage all the data on the other two
> > drives.  Is this a correct assumption?  I am trying to avoid the
disaster of
> > a Raid 0 type of system where if you lose one drive you have lost all 3
> > drives!
> >
>
> I'm no LVM expert, but I see this question a lot. I think its because of
> a misunderstanding of the seperation of filesystem from block device.
>
> Each volume group has a number of physical volumes in it. When you add a
> logical volume, the PE's in each PV are allocated in a pretty much
> linear fashion, unless you specify striping. So if you allocate 90G from
> your original 160G VG, you'll get 80G on the first disk, and then 10G
> from the second. The idea behind LVM is that you don't care which drives
> the PE's come from, they're just there and available with your data on
> them.
>
> > 2. Is there any way to tell what PE's contain what data?  or to see how
the
> > volumes are filling up?  This would essentially allow me to answer my
own
> > first question and also verify that it is doing as I want it to do.  To
> > clarify, I would be able to tell that Datafile.X which is a 1gig file is
> > written to PE's stored on hde1 or hde1 AND hdf1.
> >
>
> My first inclination would be "no". LVM thinks the PE's are "filled"
> when they're allocated. It doesn't really care what is writing to each
> PE, and whether or not its data, journal, new filesystem, etc.
>
> This is why I personally think its a really bad idea to use LVM without
> some sort of disk redundancy. Even if "I can lose the data and it won't
> matter", how much is your time worth? They're so darn cheap now... just
> use RAID5 and you'll be much happier.
>
> --
> Clint Byrum <cbyrum@spamaps.org>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
