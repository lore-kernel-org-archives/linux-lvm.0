From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009260151.e8Q1pdw19220@webber.adilger.net>
Subject: Re: [linux-lvm] LVM on 2.2.17 (again)
In-Reply-To: <39CFB8EA.7890B91D@cup.hp.com> "from John DeFranco at Sep 25, 2000
 01:43:22 pm"
Date: Mon, 25 Sep 2000 19:51:39 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John DeFranco <defranco@cup.hp.com>
Cc: linux-lvm@msede.com

John DeFranco writes:
> I've checked the LVM email archives so I know there has
> been lots of discussions on how to get LVM to work on
> 2.2.17, but unfortunately I'm having problems just
> building the kernel. I started with Turbolinux Server
> 6.0.2 (which is 2.2.14) and then added the 2.2.15-2.2.17
> patches. When I build I get:
> 
> lvm-snap.c:28: linux/iobuf.h: No such file or directory
> lvm-snap.c: In function `lvm_snapshot_COW':
> lvm-snap.c:253: dereferencing pointer to incomplete type
> lvm-snap.c:257: warning: implicit declaration of function
> `brw_kiovec'
> lvm-snap.c: In function `lvm_snapshot_alloc_iobuf_pages':
> lvm-snap.c:308: warning: implicit declaration of function
> `expand_kiobuf'

Are you using my 2.2 patches (which is a backport of 0.8final from 2.4)?
In this case you need to also apply the RAWIO patches available at
Stephen Tweedie's site  ftp://ftp.linux.org.uk/pub/linux/sct/
Alternately, if you don't need/want LVM snapshots, you can delete lvm-snap.c,
and delete the references in lvm.c to any "snap" functions, etc.  There
are about half a dozen places where this happens.  If I get around to
it, I will update my patch to simplify turning off lvm snapshots...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
