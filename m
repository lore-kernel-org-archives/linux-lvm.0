From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009200648.e8K6mjr18186@webber.adilger.net>
Subject: Re: [linux-lvm] what lvm shoudl I be using for 2.2.x?
In-Reply-To: <Pine.LNX.4.21.0009191703020.27031-100000@srv2.ecropolis.com>
 "from Jeremy Hansen at Sep 19, 2000 05:05:07 pm"
Date: Wed, 20 Sep 2000 00:48:44 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Hansen <jeremy@xxedgexx.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Jeremy writes:
> I'm actually using some of H.J. Lu's kernel builds which include all these
> patches, so hopefully it will work well.
> 
> I plan on experimenting with ext3 and lvm.  Any experience with this?

I just moved 8GB of MP3s onto my new "jukebox", which is running ext3 and
LVM, so that I can grow the filesystem easily (I'm getting my ext3-online
resize into shape), and also turn it off when I want without doing a
proper shutdown (no monitor/kbd).

All files checksummed OK, but then again I haven't really done much hard
testing on the system yet.  I'm running multiple parallel write streams
over NFS to the box, so this should be at least some testing...  I also
previously did a lot of testing with multiple bonnie++ streams writing
to an LVM/ext3 fs when I was developing the ext3 orphan fixes for 0.0.2f.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
