From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010112229.QAA01048@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Compaq diskarray problems
Date: Wed, 11 Oct 2000 16:29:05 -0600 (MDT)
In-Reply-To: <39E3008D.A969BC89@winqvist.net> from "=?iso-8859-1?Q?J=F6rgen?= Winqvist" at Oct 10, 2000 01:42:05 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?J=F6rgen?= Winqvist <jorgen@winqvist.net>
Cc: linux-lvm@msede.com

Jorgen Winqvist, you write:
> I can't pvcreate LUN's on a Compaq raid controller. This LUN is 10 Gb.
> I've compiled 8.0final.
> (I had to comment #include "gnu/types.h" out  in liblvm.h).
> 
> Greateful for any help.

Try the updated lvm tools (SRPM) at:

ftp://ftp.stelias.com/pub/adilger/

This includes a number of patches to the 0.8 final tools that were posted
on this list, but are not in the "official" tools.

Cheers, Andreas
