From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009260147.e8Q1lGs19192@webber.adilger.net>
Subject: Re: [linux-lvm] hangs when mounting snapshot
In-Reply-To: <20000925142431.A8244@ultraviolet.org> "from Tracy R Reed at Sep
 25, 2000 02:24:31 pm"
Date: Mon, 25 Sep 2000 19:46:50 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tracy R Reed <treed@ultraviolet.org>
Cc: linux-lvm@msede.com

Tracy writes:
> Hello again. I upgraded to util-linux-2.10o which includes the latest version
> of mount and it is still hanging when mounting snapshots. It segfaults first,
> then hangs on the next attempt. Is there anything else I need to upgrade to
> get this working? 
> 
> On Wed, Sep 20, 2000 at 10:50:21PM -0700, Tracy R Reed wrote:
> > [snip]
> > # mount /dev/test_vg/snap /snap1
> > Segmentation fault
> > 
> > Then I try:
> > 
> > # mount /dev/test_vg/snap /snap1
> > 
> > which hangs the mount command.

The segmentation fault is happening inside the kernel itself, so the problem
is not with the mount command, but with LVM.  It will have recorded an "OOPS"
record in /var/log/messages, and depending if you have syslogd set up
correctly, it would tell us where this is happening.  From what another
poster said, it is happening inside lvm_snapshot_remap_block(), but since
I've never really played with snapshots, I can't really comment...

Do you know if you have the latest patches for the user tools, which are
not included in the 0.8final tools you download from the LVM site?  These
fix several longstanding problems in the user tools which may (or may not)
be causing your problem.  The list of existing patches was posted by me
to this mailing list on Aug 4, as "Additions to LVM-BUGS-0.8final",
which would be a good starting point.  As I don't work with 2.4 lately,
I'm not sure if the in-kernel LVM files are up-to-date with all of the
fixes...  I know the 2.2 support is far behind 2.4, so I keep my own set
of kernel patches.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
