Date: Mon, 2 Aug 1999 12:12:02 -0400 (EDT)
From: "S. Ryan Quick" <ryan@phaedo.com>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <Pine.LNX.4.10.9908021419460.1912-100000@fuse.aethos.co.uk>
Message-ID: <Pine.LNX.3.96.990802121031.13196D-100000@aristotle.phaedo.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Pattinson <jamesp@aethos.co.uk>
Cc: linux-lvm@msede.com

-----BEGIN PGP SIGNED MESSAGE-----

I am running 2.2.10 w/ LVM 0.7 and raid linear/0/1/4-5 -- I can send along source or a Debian kernel package (sorry, no RH for me)...

On Mon, 2 Aug 1999, James Pattinson wrote:

> Cheers - I'll try that later on.
> 
> Does anyone have a such thing as a patch against 2.2.10 which includes LVM
> and RAID0145? It's just I feel a lot happier running 2.2.10, rather than
> -ac12 - as it breaks a few things on my notebook. And yes - I do run lvm
> and raid regularly on this, as well and informix dynamic server.
> /dev/loop* is my friend!
> 
> James
> 
> PS - I tried devfs on -ac12 last week as well, impressive, but I couldn't
> seem to use my SCSI cdrom drive anymore, no such thing as /dev/scd or even
> /dev/*cd* exists! Also, I had to `modprobe loop` before I could access
> /dev/loop*.
> 
> On Mon, 2 Aug 1999, Luca Berra wrote:
> 
> > On Mon, Aug 02, 1999 at 09:57:24AM +0100, James Pattinson wrote:
> > > Is anyone using alan's ac12 patch for RAID and LVM? My machine at home has
> > > 2.2.10 with raid0145 applied, and my root partition is striped across two
> > > hd/s controllers. I want to be able to use LVM though.
> > i did test it, it seems working, unluckyly ac12 breaks isdn, so i cannot use
> > it much on my main machine :(
> > 
> > > I downloaded alan's patch, but then couldn't get LVM tools to compile at
> > > all. Do I need to upgrade to a new glibc or something? I'm running more or
> > > less a basic RH6 system.
> > 
> > you need this patch to build raidtools:
> > http://www.comedia.it/bluca/lvm/lvm-0.7.glibc.patch
> > (also attached here)
> > if you need i can also provide a spec file
> > or source RPM
> > 
> > 
> > -- 
> > Luca Berra -- bluca@comedia.it
> >     Communications Media & Services S.r.l.
> > 
> 
> 
> 

%                                                       %%%%%%%%%%
%%           S. Ryan Quick                               %%%%%%%%%
%%%           UNIX Systems Engineer                       %%%%%%%%
%%%%           Phaedo Consulting, Inc. -- Exec VP          %%%%%%%
%%%%%                                                       %%%%%%
%%%%%%         www.phaedo.com/ryan/  ryan@phaedo.com         %%%%%
%%%%%%%       ------------ PGP FingerPrint -------------      %%%%
%%%%%%%%  CF 19 6B BA 31 8E B8 8E  20 DF 4F 2B 2E 69 81 F5     %%%
%%%%%%%%%     ------------------------------------------        %%
%%%%%%%%%%                                                       %

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3a
Charset: noconv

iQCVAwUBN6XDVPUYDAQiV+tNAQGMwAQAkd9kP28mMEEvuNmx3H8IahKYDbB50sEi
QzGB5Q4nKis8/mimNfpo7TaBO5iKZgvoQ4LMkJtZfVIBq9GEMkuhgc1mNgcJuY0S
JpLek+VQGRPsLw080dBpfK691Q1L/vpiKYyxWnaqGLnCxX4jd/ERCYesvGTewfYA
2fyUYqAy15U=
=eqVm
-----END PGP SIGNATURE-----
