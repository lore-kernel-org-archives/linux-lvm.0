From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199904082311.RAA02097@munet-d.enel.ucalgary.ca>
Subject: [linux-lvm] Ramdisk: Why not boot compressed from hda ?
Date: Thu, 8 Apr 1999 17:11:52 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM on Linux <linux-lvm@msede.com>

This message I saw today in c.o.l.d.s (in case anyone missed it) looks
interesting, especially since some people have tried to install a similar
setup with LVM, so that the root filesystem can live in LVM (ie rootvg)...

Maybe it's worth another shot at booting from LVM?

Cheers, Andreas
------- start of forwarded message -------
> Newsgroups: comp.os.linux.development.system
> 
> My problem is this:
> If I try to boot a compressed kernel into ramdisk from the hard drive
> (hda1), it fails!
> This works successfully if I do the same thing from  fd0.
> 
> I traced this behaviour to a source line in "rd.c" where it tests to see
> if the Major # of the booting device
> is for the floppy! Why ?
> 
> I commented this line out and now I can load a compressed Kernel from
> hda1 into ram0.
> [snip]
> 
> thanks
> Vipin
------- end of forwarded message -------
-- 
Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
                 Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \   cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert
