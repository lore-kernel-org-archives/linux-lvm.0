From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011081911.eA8JBZc02331@webber.adilger.net>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
In-Reply-To: <20001108180403.E3650@inspiron.suse.de> "from Andrea Arcangeli at
 Nov 8, 2000 06:04:03 pm"
Date: Wed, 8 Nov 2000 12:11:35 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: Chris Mason <mason@suse.com>, Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br, "Stephen C. Tweedie" <sct@redhat.com>

Andrea writes:
> On Wed, Nov 08, 2000 at 11:46:28AM -0500, Chris Mason wrote:
> > [..] reiserfs tries to update the journal header block on mount. [..]
> 
> So it does the same thing of ext3, I remeber we also discussed that design
> decision in the past and I remeber there are good reasons for that.
> 
> > Heinz and found the bug where is_read_only returns 0 for the snapshot
> 
> Oh, I didn't know you were just aware of it.
> 
> > volume while we were working on the snapshot api for journaled filesystems,
> > so this code got a lot of testing.

Chris, can you send me the API that you settled on, and I will add it into
ext3 and LVM 0.8final so that Rik can have a working system.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
