Date: Tue, 24 Oct 2000 18:25:02 +0200
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] Re: more LVM 0.8 patches
Message-ID: <20001024182502.A17195@caldera.de>
References: <20001022162253.C24630@colombina.comedia.it> <200010231800.e9NI01U21435@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200010231800.e9NI01U21435@webber.adilger.net>; from adilger@turbolinux.com on Mon, Oct 23, 2000 at 12:00:01PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: bluca@comedia.it, linux-lvm@msede.com

On Mon, Oct 23, 2000 at 12:00:01PM -0600, Andreas Dilger wrote:
> Luca Berra writes:
> > hello here are more lvm patches.
> > they apply over patches in lvm-0.8final-3.3.src.rpm
> > 1st chunk is needed to compile on my system
> 
> Actually, this is a bit of a problem.  In my 2.2 kernel patch, I include an
> lvm.h that can be used for both user and kernel compiles, so that you are
> sure you have the same IOP version, struct sizes, etc.  However, this lvm.h
> doesn't exist on 2.4.

IMHO this is the wrong thing. Userlevel tools should not include kernel headers.
IOP version mismatches are detected at run time.
In my RPMs I keep including the userlevel header and it works fine for Linux 2.2
and 2.4. The RPMs do also include most fixes by Andreas and from this list
(Luca's have just been added). If anyone is interested, they can be found on
	
  ftp.openlinux.org:/pub/people/hch/lvm/lvm-tools-0.8final-5.src.rpm
  ftp.openlinux.org:/pub/people/hch/lvm/lvm-tools-0.8final-5.i386.rpm (Glibc 2.1.94)


	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
