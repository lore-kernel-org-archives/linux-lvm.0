Date: Sat, 28 Oct 2000 10:50:07 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] [RFC] LVM mainatainance release
Message-ID: <20001028105007.C18563@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20001027011512.A9942@gondor.com> <200010270304.e9R34k127613@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200010270304.e9R34k127613@webber.adilger.net>; from adilger@turbolinux.com on Thu, Oct 26, 2000 at 09:04:46PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com, mge@sistina.com

On Thu, Oct 26, 2000 at 09:04:46PM -0600, Andreas Dilger wrote:
> Jan writes:
> > As Heinz seems to release his next version as 0.9, there will be no
> > numbering conflicts, and even if your 0.8.1 will not be 'made official'
> > by him, it'll be a common ground for further 0.8 bugfixing. 
> 
> I agree we should make bugfix releases available between the major
> updates from Heinz.  It would save a lot of people grief, and a lot
> of FAQs here.
> 
> > The problem I have with Andreas' RPMs is, that there are no announcements
> > of new versions (at least not on any mailing list I read), so I need to
> > regularily check if they contain some new patches I need. And tar is more
> > convenient for people not using rpm.
> 
> Initially I made just the SRPM available because that's what my development
> is based on, and I can use alien to convert it to .deb format.  If people
> really want, I can also make a patched tarball available with very little
> effort, since I keep a patched and unpatched tree already.  I will make
> a tarball available with my next release (today or tomorrow).
> 
> Actually, I don't do too many updates to my SRPM.  Normally only when
> people have reported a bug here, as I'm waiting for 0.9 before I do any
> more changes.  I do normally post something to linux-lvm, but I will make
> a point of being more verbose about it, rather than hiding it in another
> discussion.
> 
> I would prefer if Heinz opened a project on SourceForge, so that we can
> have CVS, bugzilla, patch tracking, etc, and allow a limited number of
> developers write access to the project.  My second choice is simply a
> URL from the official LVM site pointing to wherever I keep my patches -
> this frees both Heinz and myself from having to co-ordinate a bugfix
> release.  Failing that, I will simply make the files available on my
> site and keep pointing it out to people when they report a problem here.

Sistina is working on setting up CVS and Bugzilla for LVM.
Will announce it on the list once we are done.

> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
