Date: Sun, 29 Aug 1999 00:29:31 -0400 (EDT)
From: "S. Ryan Quick" <ryan@phaedo.com>
Subject: Re: [linux-lvm] xfs
In-Reply-To: <37C82891.987EDB34@geotec.net>
Message-ID: <Pine.LNX.3.96.990829002728.23961J-100000@aristotle.phaedo.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Smith <seric@geotec.net>
Cc: linux-lvm@msede.com

-----BEGIN PGP SIGNED MESSAGE-----

On Sat, 28 Aug 1999, Eric Smith wrote:

> Has anyone looked at xfs?  Works great on IRIX.  If you don't think
> ext2fs lends itself well to LVM-ing, then what about xfs?


I have used xfs quite extensively on SGI systems, and have heard about SGI delivering the goods to the Linux world.  Some features of the
filesystem (especially direct I/O access for io intesive applications like video production and the ability to maintain internal or external
logging volumes a la xlv) make it a very tempting bet for Linux in the future.  Have you heard more information on this?

Ryan


> 
> --Eric Smith
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

iQCVAwUBN8i3LfUYDAQiV+tNAQEwBwP8DQ6kFL4C3euUbGOCYtTYuSiIpzeQ3K+J
ReELybBsZBZIffgLstP0oYPEM7TX9736t4QvgzrlLy0VgOhLsNpdFiBT1bGzagFi
4b0CZMLgIhBHGwaaE1PqUxG2ZUJNe0FXBDYTeY41HOztK7YmJTJsTwkCCYClgEYT
f5CowQVyjcc=
=NFLJ
-----END PGP SIGNATURE-----
