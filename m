From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010270304.e9R34k127613@webber.adilger.net>
Subject: Re: [linux-lvm] [RFC] LVM mainatainance release
In-Reply-To: <20001027011512.A9942@gondor.com> "from Jan Niehusmann at Oct 27,
 2000 01:15:12 am"
Date: Thu, 26 Oct 2000 21:04:46 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Heinz Mauelshagen <mauelshagen@sistina.com>, linux-lvm@msede.com

Jan writes:
> As Heinz seems to release his next version as 0.9, there will be no
> numbering conflicts, and even if your 0.8.1 will not be 'made official'
> by him, it'll be a common ground for further 0.8 bugfixing. 

I agree we should make bugfix releases available between the major
updates from Heinz.  It would save a lot of people grief, and a lot
of FAQs here.

> The problem I have with Andreas' RPMs is, that there are no announcements
> of new versions (at least not on any mailing list I read), so I need to
> regularily check if they contain some new patches I need. And tar is more
> convenient for people not using rpm.

Initially I made just the SRPM available because that's what my development
is based on, and I can use alien to convert it to .deb format.  If people
really want, I can also make a patched tarball available with very little
effort, since I keep a patched and unpatched tree already.  I will make
a tarball available with my next release (today or tomorrow).

Actually, I don't do too many updates to my SRPM.  Normally only when
people have reported a bug here, as I'm waiting for 0.9 before I do any
more changes.  I do normally post something to linux-lvm, but I will make
a point of being more verbose about it, rather than hiding it in another
discussion.

I would prefer if Heinz opened a project on SourceForge, so that we can
have CVS, bugzilla, patch tracking, etc, and allow a limited number of
developers write access to the project.  My second choice is simply a
URL from the official LVM site pointing to wherever I keep my patches -
this frees both Heinz and myself from having to co-ordinate a bugfix
release.  Failing that, I will simply make the files available on my
site and keep pointing it out to people when they report a problem here.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
