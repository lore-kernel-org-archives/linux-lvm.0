Date: Wed, 21 Jul 1999 22:22:57 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <19990721224923.C29742@colombina.comedia.it>
Message-ID: <Pine.LNX.4.10.9907212218320.2202-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>
Cc: linux-lvm@msede.com

On Wed, 21 Jul 1999, Luca Berra wrote:

  On Tue, Jul 20, 1999 at 10:40:02PM +0100, Paul Jakma wrote:
  > Ok..
  > 
  > I've got 2.2.11pre1, patched with Ingo Molnar's
  > raid0145-19990421-2.2.6 (which I've been using for quite a while),
  which is a very BAD idea, (hasn't crashed yet? hope it doesn't)
  UPGRADE your raid patches YESTERDAY

the bug you're reffering to won't crash your system, it just means
that resyncs will never finish. 

i corrected the current->priority bug manually. 

Anyway, back to the RAID+LVM saga.

OK, so i changed bh->b_dev to bh->b_rdev at the top of
md_make_request in md.c.

The resultant kernel didn't boot. It hung after detecting all my scsi
drives, damm.

Any ideas? Ingo's RAID patches are due to go in to 2.2.11 or 2.2.12.
So this has to be fixed soon anyway, and i'd love to be the guinea
pig. :)

regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
You should never wear your best trousers when you go out to fight for
freedom and liberty.
		-- Henrik Ibsen
