Message-ID: <38FCAF36.3F7583F@swipnet.se>
Date: Tue, 18 Apr 2000 20:53:42 +0200
From: Jarek Luberek <jarek@swipnet.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirroring with LVM
References: <Pine.LNX.4.20.0004181411030.6305-100000@vortex1.vrtx.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

A James Lewis wrote:
> 
> My understanding is that you use MD to do the mirroring and LVM is layered
> on top to produce volumes... so yes you can mirror but LVM doesn't do it.
> 
So, am I right to conclude that if I have a (trivial) volume with one
partition
of 2 discs at raid1 or 3 at raid5 and want to extend that I have to add
another
3 discs for my volume-on-to-of-raid5 or 2 for the mirrored set (mix
maybe)?
It seems possible to add one physical partition but if that disc crashes
I would
loose all data since the filesystem would depend on information on both
partitions
(the physical and the raid abstracted d.o.), right?

Another question. I'm trying to compile the utilities on a glibc 2.1
system,
with no success. The LVM-home page mentions that a small patch is needed
but
I can't seem to find that anywhere ..... suggestions anybody?

Cheers,

Jarek
