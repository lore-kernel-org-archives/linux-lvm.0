Message-ID: <3873A332.91205918@msede.com>
Date: Wed, 05 Jan 2000 21:01:54 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: kressb@moose.net
MIME-Version: 1.0
Subject: [linux-lvm] [Fwd: First draft list of 2.3.x "Things to fix"] (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


-------- Original Message --------
Date: Wed, 05 Jan 2000 11:34:58 -0500
From: Brian Kress <kressb@moose.net>
Subject: [Fwd: First draft list of 2.3.x "Things to fix"]

Hi all,

	This was posted to linux-kernel by Alan.  This
is interesting, because I haven't seen anything before
about this barrier to LVM being included in 2.3.  Is there
any chance to get the formatting fixed in 0.8?

Brian


From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: First draft list of 2.3.x "Things to fix"
To: kparse@salem.k12.va.us ("David L. Parsley (lkml account)")
Date:   Wed, 5 Jan 2000 01:30:31 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), linux-kernel@vger.rutgers.edu

> including mine.  With the proliferation of ext2 resizing tools, this sure
> would be sweet; LVM could have saved my butt a few times in the last few
> years.
> 
> Any numbers on the "minimal" performance loss of the extra layer?

When I tried it for a bit in 2.2.x-ac I couldnt measure any. 

The reason I gave up adding it to -ac was that I cleaned it up , I
fixed it for the
Coding Style document and I fixed some bugs. I got an update from the
author that simply
ignored all that work and reverted to wrong formats. 

Every annoyance I personally have with the LVM code comes down to two
things
	1.	Not following the Coding Style
	2.	General poor readability - lots of complex loops, huge ioctl
functions

The main thing it made me wonder was if the ioctl interface layer was
perhaps structured
badly and perhaps using different ways to pass the data would avoid a
lot of the mess
in the existing code.

The actual remapping code is fast, clean and works. It also has about
zero impact if the
LVM is disabled.

Alan
