From: benr@us.ibm.com
Message-ID: <85256907.0073BA85.00@d54mta02.raleigh.ibm.com>
Date: Fri, 23 Jun 2000 17:04:01 -0400
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hpuxadm@choice.net
Cc: linux-lvm@msede.com



Christopher,

Welcome to the discussion!  To answer your question, if the Linux Community
is interested in the LVMS outlined in the white paper, then IBM will
release code (under the GPL!) to begin moving this technology to Linux.  I
suspect that IBM will also dedicate some resources to assist in moving this
technology to Linux as that will expedite the process.  Right now, though,
we are trying to educate the Linux Community about our LVMS Architecture so
that the Linux Community can make an informed decision as to whether they
want this technology or not.  Of course, we hope they do - the technology
has many benefits.  However, I would like to say that a decision by the
Linux Community to accept this technology does not mean that the current
LVM will be discarded.  This is not an either/or decision.  While the LVMS
solves certain problems for IBM and its customers, IBM and its customers
are not the only users of Linux.  I suspect that many users coming from the
UNIX world to Linux will be more comfortable using the current LVM because
it is based upon the standard UNIX approach to logical volume management.
Similarly, users coming from the DOS/Windows/OS2 world to Linux will
probably be more comfortable using the LVMS as that employs many of the
concepts that they are already familiar with.  Thus, I think that there is
a place for both the current LVM and the LVMS.  Looking down the road, I
see both the current LVM and the LVMS co-existing for a period of time,
with development on each continuing, with each adopting the best ideas of
the other.  Eventually, I see them merging in some fashion. but when this
occurs and what the final result is, is beyond the ability of my crystal
ball to see.  The one thing I can see, though, is that whatever the final
result is, it will be open source and under the GPL! :-)

Regards,

Ben


hpuxadm@choice.net@msede.com on 06/23/2000 07:52:00 am

Sent by:  owner-linux-lvm@msede.com


To:   Dale Kemp <dale@inet.net.nz>
cc:   Linux LVM mailing list <linux-lvm@msede.com>
Subject:  Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux



After seeing a few comments left by various users on this subject, I
would like to throw in my two cents that from an "admin" perspective,
this type of effort from a major vendor can only be a good thing.
However, just like anyone else who has watched the "major"
vendors(Compaq, HP, IBM) embrace Microsoft in the early 1990's, I
begin to wonder what the goal is with this project.  Is IBM's
implementation of LVM going to remain free(gasp!), or is the goal to
start beta testing on Linux now only to offer LVM at a premium price
later?  LVM solutions that are offered by IBM, SUN, and HP are all
excellent!  However, you pay for them big time when you start getting
into advanced volume management issues.  I have looked over the
datasheet that your website provides and am impressed with what you
are doing technically. What I am curious about is what will happen
once your implementation evolves to a "production ready" status.  I
guess what I am more or less asking is, am I wasting my time following
IBM's implementation of LVM due to the fact that once it does leave
the development stage I will end up paying thousands of dollars per
seat for it?

Thoughts?

- Christopher Briggs
  consult@unixadministrator.com

> > Another thing to remember is that users want power without risk.
This is
> > especially true in the corporate world.  To make it there, Linux
needs a
> > very powerful, flexible logical volume management system which
minimizes
> > the risk of losing data.  This calls for an architecture which
integrates
> > all aspects of volume/disk management into a single, easy to use
entity.
> > All processes which could be automated should be automated to
prevent
> > "accidents", such as the improper shrinking of a volume containing
data.
> > Right now it is rather easy to accidentally shrink a volume before
> > shrinking the filesystem on the volume, or to shrink the
filesystem on the
> > volume by the wrong amount.  Is fdisk volume group aware (have not
tried
> > this yet)?  If it isn't, a user could make a mistake and delete a
partition
> > which belongs to a volume group.  The current system has holes in
it, and
> > these holes need to be plugged before Linux can be a major player
in the
> > corporate world.  These holes can be plugged in a patch work
fashion, or
> > they can be eliminated by adopting an architecture (not
necessarily the one
> > in the white paper) in which they don't exist or can't occur.
>
> % man e2fsadm
>
> DESCRIPTION
>        e2fsadm allows resizing of a logical volume  (see  lvm(8),
>        lvcreate(8))  containing  an unmounted ext2 filesystem and
>        then extending the filesystem by  resize2fs(8)  afterwards
>        or  reducing  the  filesystem  first and then reducing the
>        logical volume afterwards.
>
> First thing is Linux-LVM is still evolving and will only get better.
Now IBM
> and SGI have their own volume management systems which is fine, and
> porting them to Linux can only be a good thing too. At the end of
the day
> its the users in the community that choose. Now its in the community
and
> IBM users interest for IBM to port AIX systems to Linux, so people
can simply
> install Linux and use there existing AIX hard drives. The same goes
for SGI.
> And work is already underway with JFS and XFS for example.
> I actually like the system being evolved by Linux-LVM since it
follows the
> Unix
> philosophy do one thing and to it well (the opposite of Micr$oft).
>
> -- Dale.
>
>
