Date: Mon, 19 Apr 1999 14:01:55 +0100 (BST)
From: Tony Rogers <tony@racsys.demon.co.uk>
Reply-To: Tony Rogers <tony@racsys.demon.co.uk>
Subject: Re: [linux-lvm] System locks solid under LVM
Message-ID: <Pine.LNX.3.96.990419134407.8939A-100000@websrv.afsuk.gecfs>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stb@ep-ag.com
Cc: linux-lvm@msede.com

Hi there Klaus,

Many thanks for your comments.

I am a little confused. If I do 'gcc -v' on my work box (I am at work
now) it gives me:
[rogers@websrv rogers]$ gcc -v                                                  
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/2.7.2.3/specs             
gcc version 2.7.2.3 

which is the version which you say gave you problems. If I do a 'man' on
egcs, it takes me to the gcc page.

Is there a difference between egcs and gcc these days?

I am reluctant to believe that the compiler is totally at fault, as the
rest of the system seems to be fine, and my 'work' box was left on soak
test over the weekend, and it was still rattling away this morning - very
satisfying.

Following a question from the list, I reconfigured my system so that I had
two VGs, each containing 1 PV. The interesting thing is that they are now 
on different disks. One is quite reliable, the other is very unreliable.

Ordinarily I would say that this is hardware, but Win95 and non-LVM Linux
has no problem with this disk, which is heavily used.

It is looking more and more like LVM stresses the system just a little too
far, and that the base system is not quite right.

It might be interrupts - I don't know. It might be time to strip out all
the other cards (again!).

Unfortunately this does not help me much, as when LVM pushes it over the
edge, it locks totally, and I can't poke around to figure out what went
wrong.

Anyway, thanks again. I'm still plugging away.

Tony Rogers
===========
