Date: Wed, 8 Sep 1999 15:28:42 -0400 (EDT)
From: "S. Ryan Quick" <ryan@phaedo.com>
Subject: Re: [linux-lvm] LVM Question
In-Reply-To: <19990908131738.B26638@yamato.terrabox.com>
Message-ID: <Pine.LNX.3.96.990908152638.2013L-101000@aristotle.phaedo.com>
MIME-Version: 1.0
Content-Type: MULTIPART/SIGNED; BOUNDARY="IrhDeMKUP4DT/M7F"; MICALG=pgp-md5; PROTOCOL="application/pgp-signature"
Content-ID: <Pine.LNX.3.96.990908152638.2013M@aristotle.phaedo.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Brian Wolfe <ahzz@yamato.terrabox.com>
Cc: mmclinn@cdt.com, linux-lvm@msede.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--IrhDeMKUP4DT/M7F
Content-Type: TEXT/PLAIN; CHARSET=us-ascii
Content-ID: <Pine.LNX.3.96.990908152638.2013N@aristotle.phaedo.com>

-----BEGIN PGP SIGNED MESSAGE-----

I am running LVM 0.7 on a compaq proliant 6500 4xPIII 450/512MB with about 72GB in the primary volume for
SAP/R3 print queues and hierarchical storage under Debian 2.1/2.2.10 and have had no problems.  I am using
software RAID mirroring on these drives as well, no problems.

Ryan


> > 
> > 
> > Hello, 
> > 
> > First off, I'm a big supporter of LVM, I use it on a 56gig array at home
> > regularly without any problems and I can't wait to see it migrate into
> > the stable kernel tree.
> > 
> > I do have a couple of questions for people with more experience than
> > I...
> > 
> > I am currently preparing to setup a new main file server for my company.
> > It will be linux based, and will store approximately 25 gigs of data
> > that
> > will be used constantly.  LVM would be _really_ useful on this machine. 
> > 
> > I'm wondering peoples opinions about whether or not LVM is ready to be
> > used in
> > a business environment.  In other words, how stable has this code been
> > for people?
> > I have run into no problems, but I have been using it informally thus
> > far.
> > 
> > Also, I am wondering whether or not future versions of LVM will always
> > be compatible with the current implementation?  Will there ever be a
> > point when I would need to
> > reinstall my LVM volumes to upgrade to the latest version of LVM?
> > 
> > Any opinions, thoughts, cautions, advice, ect.. would be much
> > appreciated.
> > 
> > Thanks all!
> > 
> > 
> > -Michael McLinn
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

iQCVAwUBN9a47fUYDAQiV+tNAQFp6wP/XHe2MuKSRXkQKD6l8Ely9qtM6OvNHxL0
BzedsqdfrEUyPMAyiyqfKQD0+YQ/kz5HluER7HCeekm5ZhOCDPEjOR419Gfees/b
O/d2h/1AyP2zLN3WLKhaxvU9sv+lCYK8c0rTqkinrlgnxExPh2G/6zUBIUKc13rf
Sf1lo80fMS0=
=GUWK
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F
Content-Type: APPLICATION/PGP-SIGNATURE
Content-ID: <Pine.LNX.3.96.990908152638.2013O@aristotle.phaedo.com>
Content-Description: 

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3ia

iQCVAwUBN9aoQloyucRTDyulAQHMmgP/U6yUth7574mq17e8769F76xW/qkZn49K
20JM5EWjUG/rGm1g9U02hTvEGL3wAn9RpYi8azw9xYlt9ISae1B62hc2FqZ47UmN
Iw0HIa/4MyMNjMYL0ZafrspWVzXUgyD1tZAKSMSjV7XtneDny9jqGxSYNcWXTft/
HgfSx9bmHAo=
=ZiQT
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
