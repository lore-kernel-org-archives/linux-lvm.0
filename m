Message-ID: <3D2330BF.AB9221B8@funsoft.com>
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Subject: Re: dd and raw devices with lvm  [was:  Re: [linux-lvm] LVM hang with 
 some uses of raw i/o]
References: <3D19F9A0.9FBA6B7E@funsoft.com> <20020703193224.D999@portatile.milano.dt>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jul  3 12:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Eike:
  The "bug" with dd and raw devices is in the man page for the raw command. That
is "man raw".  I am pasting what it says on a RedHat 7.2 distribution:
BUGS
       The  Linux  dd  (1)  command  does not currently align its
       buffers correctly, and so cannot be used on raw devices.

       Raw I/O devices do not maintain cache coherency  with  the
       Linux  block  device  buffer cache.  If you use raw I/O to
       overwrite data already in the  buffer  cache,  the  buffer
       cache  will  no  longer  correspond to the contents of the
       actual storage device underneath.  This is deliberate, but
       is regarded either a bug or a feature depending on who you
       ask!

I am still having the same problem.  One of my colleagues managed to reproduce
the problem on a system that he has direct access to. The system that is failing
for me is remote and it is difficult to find someone to go reset the server once
linux hangs. I am hoping my colleague can get a handle on it soon so that we can
confirm whether or not it is a problem with raw i/o in general, LVM and raw, or
our own code.

Eike Kowallik wrote:
> 
> Hello!
> 
> On Wed, Jun 26, 2002 at 01:28:00PM -0400, Gary Eheman wrote:
> 
> > utilities (I think), though I also see that dd is not supposed to be used
> > against raw devices in the man pages.  The author of our utility is well aware
> > of the need to align the buffers, and the same code does work on other raw
> > devices on other LVM linux systems I have put together.
> 
> I waited some days, but nobody wrote something about dd and raw
> devices...
> 
> I read the dd man pages on two Linux Systems - and the newest
> one from the fileutils Version 4.1:
> http://www.gnu.org/directory/All_GNU_Packages/fileutils.html
> But I couldn't find any note about (problems with) raw devices.
> 
> Grey, would you give me a hint? Anybody else? I'm asking here
> because I used dd to find out more about my problems with
> lvm and raw devices (for Oracle RAC):
> http://lists.sistina.com/pipermail/linux-lvm/2002-June/011737.html
> 
> Thanks in advance, Eike
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Gary Eheman
Fundamental Software, Inc.
http://www.funsoft.com
