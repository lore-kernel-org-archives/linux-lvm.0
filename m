Message-ID: <31A612FE6020D2119F6400A0C9B67EBB116E2B@fthw901e.as.fth.sbs.de>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: RE: [linux-lvm] kernel 2.2.10 patching
Date: Wed, 13 Oct 1999 17:55:50 +0200
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Al Smith' <Al.Smith@mail.tju.edu>, linux-lvm@msede.com



Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 23F


> -----Original Message-----
> From: Al Smith [mailto:Al.Smith@mail.tju.edu]
> Sent: Wednesday, October 13, 1999 5:44 PM
> To: linux-lvm@msede.com
> Subject: [linux-lvm] kernel 2.2.10 patching
> 
> 
> Greetings,
> 
>   I am trying to patch a already installed 2.2.10 kernel with 
> the patch
> from msede. I downloaded the file (which doesn't put it into gz
> formating).
> 
>   Then I cd /usr/src/linux
> 
> then I do:
> 
> patch -p1 /download/patch-2.2.10-LVM

patch -p1 < /download/patch-2.2.10-LVM
         ^^^

patch is reading from stdin ....

> 
> and it just sits there. Is there a problem with the patch?
> 
> Al Smith
> Systems Engineer
> TJUH
> al.smith@mail.tju.edu
> 
