Date: Mon, 23 Oct 2000 14:08:56 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Subject: Re: [linux-lvm] more LVM 0.8 patches
In-Reply-To: <20001022162253.C24630@colombina.comedia.it>
Message-ID: <Pine.LNX.4.21.0010231407260.31248-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

excellent...

this fixes the compile problem i had with the tools that i reported to
Andreas before (but i hadn't compiled the kernel, so he asked me to do
that).

successfully compiles against 2.4.0-test10-pre4, glibc-2.94, gcc-2.96.

regards,

paul jakma

On Sun, 22 Oct 2000, Luca Berra wrote:

> hello here are more lvm patches.
> they apply over patches in lvm-0.8final-3.3.src.rpm
> 1st chunk is needed to compile on my system (mine only?? K6-2, kernel 2.4.0-test8, glibc 2.1.3, pgcc-2.95.3)
> 2nd chunk is nice for devfs
> 3rd chunk is NEEDED for lvm over raid
> 
> I am still missing something on the vgchange front, the binary version i saved
> before trashing my whole system this summer works, the one built from
> these sources doesn't.
> 
> Regards
> L.
> 
