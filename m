Date: Mon, 5 Jun 2000 20:11:55 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] performance problems
In-Reply-To: <20000605160017.28678.qmail@web106.yahoomail.com>
Message-ID: <Pine.LNX.4.21.0006052010170.26807-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Campbell <dash_ampersand@yahoo.com>
Cc: linux-lvm@msede.com

On Mon, 5 Jun 2000, Chris Campbell wrote:

> We are using LVM on a (hardware) RAID array and are
> having some performance problems.  File copying is
> very slow and one of the guys using it reported that
> untarring was very sluggish, and he got I/O errors. 
> Is this a known problem?  I believe we are using 0.8i
> and we are using 2.2.13 kernel.  Any help would be
> greatly appreciated.

did you specify for any LV's to be contigious?

i've seen something similar where i get I/O errors because (i
suspect) an contigious LV can't find any contigious blocks. (even
though there's plenty of space in the VG.

-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
MAC user's dynamic debugging list evaluator?  Never heard of that.
