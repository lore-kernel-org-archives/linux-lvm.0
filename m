Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 843174401B
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 02:35:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36D938007D1
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 02:35:56 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id z17so7158769ioi.6
	for <linux-lvm@redhat.com>; Sun, 23 Aug 2020 19:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALOnQv5via9sF2FP81uGXe+CzLqX0it7T0NvRSVxV8TBbhUuvg@mail.gmail.com>
	<alpine.LRH.2.23.451.2008220740230.11549@mail.gathman.org>
In-Reply-To: <alpine.LRH.2.23.451.2008220740230.11549@mail.gathman.org>
From: L A Walsh <law@tlinx.org>
Date: Sun, 23 Aug 2020 19:35:39 -0700
Message-ID: <CALOnQv4CphV94v5cc6o=XPhnxdVECj1R8E43ae0f-rUBjD-dow@mail.gmail.com>
Subject: Re: [linux-lvm] What to do about new lvm messages
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Aug 22, 2020 at 5:39 AM Stuart D Gathman <stuart@gathman.org> wrote:
>
> On Sat, 22 Aug 2020, L A Walsh wrote:
>
> > pvcreate  -M2 --pvmetadatacopies 2 /dev/sda1
> >  Failed to clear hint file.
> > So why am I getting a message about not clearing a hint file (running as root)
>
> Because there is an ole PV header on sdd1
----
What does an ole PV header on sdd1 have to do with me recreating a PV
from/on  /dev/sda1?  I take it from your comment, that the 'hint' file
may be what is telling me to update the PV with /dev/sdd1?  That's not
very clear.


> >> From an online man page, I should have been able to use -ff to
> > recreate a pv over
> > the top of a preexisting one, but that didn't seem to work.  I got:
> > pvcreate -ff -M2 --pvmetadatacopies 2 /dev/sda1
> >  Failed to clear hint file.
> >  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify the VG to update.
>
> You wrote a new PV header on sda1 - but that didn't do diddly squat
> about the old one on sdd1.
---
  But I *didn't* write a new PV header on sda -- it said that
/dev/sda1 had an inaccessible VG on it with system ID ishtar with
unknown local system ID.
What does that mean?  the local system name is 'ishtar', which is why
I tried putting it in the system ID -- but then it says the VG with
system ID ishtar has an unknown local system ID.  But I thought the
system ID was the local system ID.  Ok, I'm ignoring system ID,
obviously it has nothing to do
with the system's name, which is why I wanted to recreate the PV
(sda1) without the 'ID' specification, thus my attempt at using
the '-ff' switch to force pvcreate to recreate the pv entry no matter what.


> >  Cannot access VG Space with system ID Ishtar with unknown local system ID.
> >  Device /dev/sda1 excluded by a filter.
>
> The PV filter is excluding sda1.  Are you confused about what is on
> which sdx?
---
   No -- I'm confused why it would tell me that the device I was
trying to create a new PV label on (/dev/sda1, from above) was
excluded by a filter.  I.e. instead of recreating the PV (without the
system id switch being specified), it said that the PV I was trying to
change was excluded by some filter.  Why would a filter be excluding
the 1 device I wanted to create a PV on?  I don't understand why it
would do that.


>
> > dd if=/dev/zero of=/dev/sda1 bs=4096 count=1
> > 1+0 records in
> > 1+0 records out
> > 4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000175409 s, 23.4 MB/s
>
> I hope sda1 was really what you think it was.
----
       Me too!  That's why I first tried using the "-ff" switch on the
disk with pvcreate -- so it would force a new pv to be created.  Since
I couldn't use pvcreate to force overriding the bad, previous,
"VG-in-PV" that had that bad systemID in it, I was forced to use 'dd'
-- which I was uncomfortable with but it seems the -ff switch isn't
there anymore -- so the only way to force an overwrite is to use the
less safe 'dd' method.

    So, yes, I hope sda1 was really what I thought it was -- but would
have preferred that the safer "-ff" switch was still available.  IMO,
putting users into a position of needing to manually zero-out the
previous contents isn't ideal.  I.e. nothing about what to use instead
of '-ff' -- just a message about the  PV being excluded by a filter
(which didn't help me overwrite the old, incorrect PV.  So instead of
relying on users to hopefully get it write when zapping the old label,
it seems a "-ff" switch would be a bit safer, no?  Is there a reason
why it was removed?  Maybe, if there was a good reason, if it saw me
using a previously legal switch (-ff), it could have told me the new
way to do it.  Note, I didn't have the manpages for thew new version
installed yet, which is why I found the version telling me about use
of -f or -ff to forceably recreate the pv.

>
> What is on sdd1?  None of your listings examine it.
---
    A Red-Herring?  Not sure why it matters -- but, what is on the "VG
Backup"?
       Backups!
   I wasn't strongly motivated to mess with anything involving
"writes" to sdd1 -- which seemed to be my only copy of the data I am
trying to restore onto a new disk.   I had no idea what command to use
to modify the PV containing sdd1 that wouldn't involve me making a
change to a PV that I didn't want to make any changes to (at least not
until I'd recreated its contents on PV "/dev/sda1").

   It would be preferable to have an "update-PV label" that would
convert the older format to the new one.  That way I could be sure
that by executing it I wouldn't accidently create some side effect
that might compromise the data on the volume.

   So I'm still not sure why my new pvcreate wouldn't overwrite the
old one, nor am I sure why root failed to clear a hint file  (or at
least why it doen't tell me that they hint was to modify the PV
containing /dev/sdd1) -- I didn't know how the hint file was related
to my attempt to recreate th PV, nor do I know why the 1 volume I
wanted to change (sda1) should be filtered out to block my updating
the PV containg it.  I.e. I primarly reporting that these messages are
rather confusing.

   As it stands now, after a reboot, none of the LVM manage volumes
are accesible as, instead, I'm getting:
   " Waiting for udev to settle...
    Scanning for LVM volume groups...
      WARNING: Device /dev/sda not initialized in udev database even
after waiting 10000000 microseconds."
on each of the 'disks' (sda-sdd) managed by LVM...*sigh*.

The version of udevd isn't very helpful in telling what might have
changed as it just displays "210" when I ask for version.  That seems
to be what was workign before (on same kernel).

I have a feeling, BTW, that I wasn't very clear in asking why
1) I couldn't clear some hint file,
2) how I should have used pvcreate to overwrite the previous attemp
that had an ill-considered attempt to create a VG with a system-ID so
I wouldn't need to resort to using 'dd', and
3) how I should safely modify my backup PV (/dev/sdd1) such that it
wouldn't really be modified.

Thanks, and Cheers!
