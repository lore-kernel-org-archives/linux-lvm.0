Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA5NGor25931
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 18:16:50 -0500
Received: from imf21aec.mail.bellsouth.net (imf21aec.mail.bellsouth.net
	[205.152.59.69])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA5NGmOf023936
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 18:16:48 -0500
Received: from zira ([65.1.73.179]) by imf21aec.mail.bellsouth.net
	(InterMail vM.5.01.06.11 201-253-122-130-111-20040605) with ESMTP
	id <20041105231643.SJGE2451.imf21aec.mail.bellsouth.net@zira>
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 18:16:43 -0500
Message-ID: <001d01c4c38d$71834590$6408a8c0@zira>
From: "Kevin Richard" <Kevin_Richard@bellsouth.net>
Date: Fri, 5 Nov 2004 17:16:13 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How exactly does LVM's get written?
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
To: linux-lvm@redhat.com

I have searched many topics in archive and even randomly scanned for any
info related to this but have only come away with a "I think it works this
way" feeling.

I set up two 80gig drives as one 160gig VG  /dev/VG1/LV1  I then proceeded
to copy about 93 gigs of data from a 100gig drive that I will hopefully add
to the LV to make it 260gigs.

My questions are:

1. Is this a "spill over" type of write method where it will fill up hde1
(first 80gig) and then move to hdf1 (other 80gig) and then of coarse on to
hdg1 (100gig)?  Which would allow me the convenience of having one HUGE
mount and thus not having to constantly monitor and move data to 3 different
drives as space is needed.  Yet it keeps the data somewhat separated (except
for the "spill over" that might get wrote to two drives at some point) so if
I lose a hard drive I only lose what is on that drive and can just replace
the drive and recreate the VG and salvage all the data on the other two
drives.  Is this a correct assumption?  I am trying to avoid the disaster of
a Raid 0 type of system where if you lose one drive you have lost all 3
drives!

2. Is there any way to tell what PE's contain what data?  or to see how the
volumes are filling up?  This would essentially allow me to answer my own
first question and also verify that it is doing as I want it to do.  To
clarify, I would be able to tell that Datafile.X which is a 1gig file is
written to PE's stored on hde1 or hde1 AND hdf1.

Thanks for taking the time to read this and help out a Noob!  If this all
works out I will definitely be spreading the gospel about LVMs for not many
folks are really aware of them too much it seems.

Look forward to hearing your responses,
Kevin
