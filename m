Message-ID: <39D11E0A.18E83DA2@cup.hp.com>
Date: Tue, 26 Sep 2000 15:07:06 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on 2.2.17 (again)
References: <200009260151.e8Q1pdw19220@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

Thanks! That helped alot. One other question,
I wanted to pvcreate a software RAID device
(/dev/md0 in this case). This is a simple two
disk mirror (since LVM does not do mirroring).
It would not let me do this however. The FAQ
seems to indicate that I can (at least that
the way I am interpreting the last section: 

  I recommend to use dedicated hardware RAID 
  subsystems or Multiple Devices to have the 
  redundancy below the LVM. In this case you 
  just don't care about Logical Volume data 
  redundancy and you don't run into the 
  dangerous situation that your data is 
  not redundant by accident.
).

Does anyone know if this is possible and if so how
to accomplish it?

Thanks! 

Andreas Dilger wrote:
> 
> John DeFranco writes:
> > I've checked the LVM email archives so I know there has
> > been lots of discussions on how to get LVM to work on
> > 2.2.17, but unfortunately I'm having problems just
> > building the kernel. I started with Turbolinux Server
> > 6.0.2 (which is 2.2.14) and then added the 2.2.15-2.2.17
> > patches. When I build I get:
> >
> > lvm-snap.c:28: linux/iobuf.h: No such file or directory
> > lvm-snap.c: In function `lvm_snapshot_COW':
> > lvm-snap.c:253: dereferencing pointer to incomplete type
> > lvm-snap.c:257: warning: implicit declaration of function
> > `brw_kiovec'
> > lvm-snap.c: In function `lvm_snapshot_alloc_iobuf_pages':
> > lvm-snap.c:308: warning: implicit declaration of function
> > `expand_kiobuf'
> 
> Are you using my 2.2 patches (which is a backport of 0.8final from 2.4)?
> In this case you need to also apply the RAWIO patches available at
> Stephen Tweedie's site  ftp://ftp.linux.org.uk/pub/linux/sct/
> Alternately, if you don't need/want LVM snapshots, you can delete lvm-snap.c,
> and delete the references in lvm.c to any "snap" functions, etc.  There
> are about half a dozen places where this happens.  If I get around to
> it, I will update my patch to simplify turning off lvm snapshots...
> 
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

-- 
==========
Cheers
   -jdf
