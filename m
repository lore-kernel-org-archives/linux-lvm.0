Message-Id: <37F4FFCD.6AE2EC3E@mainland.ab.ca>
Date: Fri, 01 Oct 1999 12:39:09 -0600
From: Drew Smith <drew@winterland.mainland.ab.ca>
Mime-Version: 1.0
Subject: Re: [linux-lvm] LVM, raw-io, devfs
References: <006201bf0bb7$6eae4a60$030116ac@fd1> <14324.58266.920834.895229@dukat.scot.redhat.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Stephen C. Tweedie" <sct@redhat.com>, linux-lvm@msede.com


	Hi, just checking a fact. :)

	IBM's ADSM(*) (well, TSM now, thanks to Tivoli) uses raw logical
volumes on a fairly native level as storage pools, etc.  I'm curious,
having never looked into raw IO under Linux, whether it's the same
principles - and, that said, whether or not IBM will be porting the TSM
server to Linux?  

	Regardless, LVM is a huge jump in the right direction if we want IBM to
release more schtuff for Linux.  

	Now, I've just got to find a Linux-HSM(**) project to control my
optical jukebox. :)  Any ideas whether this exists?

(apologies for the footnotes, they're there for the benefit of people on
the list who don't know these acronyms)
*: ADSM: ADSTAR Distributed Storage Management.  A highly-cool
enterprise backup system, scheduling, etc - IBM's version of Veritas.
**: HSM: Heirarchial Storage Management.  Basically, take a tape library
or jukebox, make a database of everything on every cartridge, and mount
that database as a filesystem.  Copy something out of it, the library
goes and gets the appropriate media and feeds it to the drive.  With a
20-cart optical jukebox, this is basically a 20*1.3G filesystem (albiet
a fairly slow one, but with a script to copy the file into a temp space,
perfect as a low-use fileserver.  ADSM does this, but the cost is hefty,
to say the least.)

	Cheers,
	- Drew.
:wq

"Stephen C. Tweedie" wrote:
> 
> Hi,
> 
> On Thu, 30 Sep 1999 23:48:23 -0300, "Fernando Dammous"
> <ferdam@internetcom.com.br> said:
> 
> > Now, I would like to install the devfs and mainly the raw-io.
> 
> > Can I install them in a kernel 2.0.36, which is already patched with
> > LVM?
> 
> I've never tried the raw IO code on 2.0: let me know how it goes!  In
> principle, there is no reason why raw IO on LVM should not work.
> 
> --Stephen
