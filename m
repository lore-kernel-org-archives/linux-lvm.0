Date: Sun, 17 Oct 1999 14:25:58 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] [Fwd: Re: ext2 online resizer available]
Message-ID: <19991017142557.A19541@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <38099ABD.48D49AEF@msede.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
In-Reply-To: <38099ABD.48D49AEF@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii

On Sun, Oct 17, 1999 at 11:45:33AM +0200, Michael Marxmeier wrote:
> Ideally I'd love to be able to stick a pair of disks into a system,
> rescan
> the SCSI bus to pick them up, add them onto the end of my RAID 0+1
> (striped/
> mirrored) raid, and then increase the ext2 partition on the RAID.  All
> without having to drop the system.  I'm fairly sure it can't be done
> with
> the current set of tools and whatnot, but that's one thing I'd love to
> see.
> 	Don't get me wrong, ext2 resizing is very nice, just would be nice
> to be able to resize RAID things to go along with it...

when we will have raid atop lvm this will be trivial, for the time
being you can use Hubert Tonneau's pliant script (pliant is a programming
language) to resize a raid (see attached mail from linux-raid)

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.

--bg08WKrSYDhXBjb5
Content-Type: message/rfc822

Return-Path: <owner-linux-raid-outgoing@vger.rutgers.edu>
Received: from nic2.funet.fi (nic2.funet.fi [128.214.248.46])
	by colombina.comedia.it (8.9.0/8.8.7) with ESMTP id OAA28068;
	Fri, 1 Oct 1999 14:08:53 +0200
Received: from vger.rutgers.edu ([128.6.190.2]:12378 "EHLO vger.rutgers.edu")
	by nic2.funet.fi with ESMTP id <S4506AbPJAMFl>;
	Fri, 1 Oct 1999 15:05:41 +0300
Received: by vger.rutgers.edu via listexpand id <S156704AbPJAMEL>;
	Fri, 1 Oct 1999 08:04:11 -0400
Received: by vger.rutgers.edu id <S156708AbPJAMCT>;
	Fri, 1 Oct 1999 08:02:19 -0400
Received: from email.easynet.fr ([195.114.64.207]:4413 "HELO zmail6.easynet.fr")
	by vger.rutgers.edu with SMTP id <S156819AbPJAL5U>;
	Fri, 1 Oct 1999 07:57:20 -0400
Received: (qmail 73524 invoked from network); 1 Oct 1999 11:57:18 -0000
Received: from mailgate3.easynet.fr (192.168.1.4)
  by mailserver.easynet.fr with QMQP; 1 Oct 1999 11:57:18 -0000
Received: from pop-orleans-1.pops.easynet.fr (HELO 195.114.91.193) (195.114.91.193)
  by mrelay3.easynet.fr with SMTP; 1 Oct 1999 13:59:09 -0000
Message-ID: <37F4A107.31989F5E@heliosam.fr>
Date: Fri, 01 Oct 1999 13:54:47 +0200
From: Hubert Tonneau <hubert.tonneau@heliosam.fr>
Organization: HELIOSAM
X-Mailer: Mozilla 4.08 [en] (X11; I; Linux 2.2.12 i686)
MIME-Version: 1.0
To: linux-raid@vger.rutgers.edu
CC: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Subject: Reconfiguring a RAID system without data loss
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-raid@vger.rutgers.edu
Precedence: bulk
X-Loop: majordomo@vger.rutgers.edu
X-Orcpt: rfc822;linux-raid-outgoing

Release 2 of the Pliant utility for reconfiguring (adding disks, changing
the RAID level or the chunk size) a software RAID without loosing (at your
own risks: test it on sample datas before using it on real ones) datas is
available.
The new code is expected to event survive to a disk failure in the middle
of the RAID reconfiguration (provided the RAID level is 1 or 5 :-) )

The script will be included in Pliant release 28 that will be available
at http://pliant.cams.ehess.fr/ in a few days.

If some of you want to stress test it, I can now send a snapshot by email
because the changes that will append in Pliant before release 28 have
nothing to do with this RAID script.

-----

Ingo wrote that this script should be written in C for several reasons:
- speed
- portability

These are my answers to these arguments:
- Although it would be faster if written in C because Pliant code generator
  is not as efficient as GCC, this is not that important because:
  . there is nothing in Pliant itself that make it slower than C, so at
    some point, the speed will be excacly the same as with C.
  . on a 300Mhz processor, the conversion speed could be about 10 MB/s,
    so it's completely IO bounded on my laptop.
- Now the portability argument is very valuable because Pliant currently
  runs only and i386 (Alpha port planned next year, but others are not
  scheduled yet).
- There is an additional strong argument for writting the script in C:
  Pliant is a young language that changes much for the moment.

Now, these are my arguments for writting the script in Pliant:
- Compiling a C program is a big problem because a C compiler is idiot:
  you need a set of extra tools (make, .configure script, ...) in
  order to cope with differences on various machines.
  On the other hand, a Pliant script is always run directly from
  it's source code (Pliant is what I call a dynamic compiler, you
  could also read on the fly, or not stupid), so for free softwares
  it's definetly better because you get rid of the binaries
  nightmare.
- In standard C, there is no provision for 64 bits arithmetics,
  whereas in Pliant, the unlimited intergers are a basic feature.
- A Pliant program is faster debugged because when you set the
  debugging level to 2 or more, all arithmetic overflows are
  reported: it was important for such an application.
- The Pliant code is probably shorter than the C code would be.
- I prefer Pliant (I designed it :-) )

Ingo also specifyed that at some point, this conversion should be
done on the fly in kernel space.
This would be the ultimate rafinement, but it does not worth the
troubles (except for changing the chunk size) until we get the ability
to resize an ext2 partition without umounting it. I seems to be
already possible, but with strong restrictions, so, for the moment, the
'ext2resize' utility seems to be the safest solution.
Now believing that no Pliant code will go in Linux kernel might also
be wrong on the long term. My opinion is that it may well append the
other way round at some point. Pliant would be the boot loader that
would load and compile on the fly the Linux kernel. In Pliant, there is
provision for several syntaxes, so the parts of Linux that are written
in C would be seen as Pliant programs: a Pliant C parser module will make
it transparent. Now Pliant would bring the flexibility to Linux kernel:
the ability to compile on the fly some drivers when the harward is
detected or some network frames are received, or recompile on the fly
with different optimising options, when some statistics have been
collected, and the cost would only be a bigger kernel (because Pliant
contains the compiler and some extra informations).
Lastly Pliant compiling machinery is much more powerfull than C compilers
one, so on a large project such as the Linux kernel you can get a much
cleaner and easyer to maintain code, even if keeping the C syntax.

-----

As a conclusion, I will maintain the script, in Pliant, until somebody
rewrites it in C.
Ingo, please don't include the script in the RAID user levels tools
since it may need to be adjusted if I make more changes in Pliant itself:
just specifying that it's available and the Pliant URL. I may also send
you a small HTML page specifying how to use it, which could be included
in the documentation of the user level tools.

This is a sample usage of the script:
pliant module /pliant/admin/raid.pli command 'raid_convert "/dev/md0" "/dev/hda5 /dev/hda6 /dev/hda7" "/dev/hda5 /dev/hda6 /dev/hda7 /dev/hda8" 5 64*2^10'

The third parameter (5) is the requested RAID level.
The fourth parameter (64*2^10=64K) is the requested chunk size.

Regards,
Hubert Tonneau


--bg08WKrSYDhXBjb5--
