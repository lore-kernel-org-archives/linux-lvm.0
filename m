Date: Thu, 7 Sep 2000 16:21:52 -0300 (BRT)
From: Marcelo Tosatti <marcelo@conectiva.com.br>
Subject: Re: [linux-lvm] LVM patch for kernel 2.2.17?
In-Reply-To: <200009052050.OAA19872@lynx.turbolabs.com>
Message-ID: <Pine.LNX.4.21.0009071613560.21842-100000@freak.distro.conectiva>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com


On Tue, 5 Sep 2000, Andreas Dilger wrote:

> Franken Klaus, you write:
> > > Any plans for a lvm-patch for kernel 2.2.17 ??
> > > 
> > > My lvm patch for 2.2.16 works at 2.2.17 too but it's version 0.8i.
> > >  
> > > Should we use a newer version ? For example 0.8 final ?
> > > Should i do that ?
> > 
> > Yes, you should.  Thanks!!
> 
> I have already made a version of LVM 0.8final available for Linux 2.2.16 +
> 2.2.17-pre patches, which _should_ work for 2.2.17 as well, although the
> snapshot feature depends on some 2.4 code which is only available for 2.2
> as a patch.
> 
> It is available online at ftp://ftp.stelias.com/pub/adilger/

Andreas, 

Dont forget to fix the return typo in lvm_snapshot_COW in your backport. 
 
