Message-Id: <199906202342.AA11684@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
Date: Mon, 21 Jun 1999 1:41:37 METDST
In-Reply-To: <m10vk14-0000YbC@duffy1.franken.de>; from "Rolf Jakob" at Jun 20, 99 6:00 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjakob@duffy1.franken.de
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> > What about:
> > 
> > http://www.dsv.nl/~buytenh/ext2resize/
> > 
> > i've no idea whether it works or not.
> 

Thanks Rolf for finding ext2resize 8*)

> It works - hmm, sometimes :-)

At here maybe 8*)
The author's example works.

Tried to extend a filesytem of 200M to 252M --> SEGFAULT --> 8*(
Extending from 200M to 204M --> SEGFAULT too.

Have to dig deaper into the code...


> I managed to resize a mounted file system and several times it was possible
> to copy more files on it after the resize. But from time to time I got an
> error saying "no space left on device" while df shows the free space
> correctly.

ext2 is not implemented with filesystem locking which is necessary
for mounted resizes. The resizer changes the on disk structs.

What you see should basically depend on what is in the cache and what isn't.

Another issue is, that ext2 Block Descriptor Tables don't have to
be changed in size, if extensions or reductions are small.

Your experience with "no space left on device" could by accident
correlate to these facts.

> Just some minutes ago I sent some feedback to the author (of course
> mentioning lvm :-) and a patch (the snapshot of June, 17th would not get
> the size of a block device).

It has to ensure, that the filesystem is not mounted as well!

> It looks very promising.

Yep.

Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
