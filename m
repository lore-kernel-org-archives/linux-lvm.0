Date: Mon, 22 Nov 1999 21:55:16 +0000 (GMT)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] mirroring
In-Reply-To: <199911222107.WAA25823@e35.marxmeier.com>
Message-ID: <Pine.LNX.4.10.9911222150510.8665-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

This reminds me of something - I used to use purely md on my system,
striping across SCSI and IDE disks for maximum performance. Using hdpart
-t, I got 25MB per second throughput on /dev/md0, now I'm using LVM on
it's own, but still striping using LVM, and I only seem to get about 17MB
per sec. I *much* prefer using a LVM'd system though, and this performance
doesn't really matter to me. 

I recall that the raid patches use MMX or something for higher performance
- is this something LVM could do as well, or do people recommend making a
big fast /dev/md0 then throwing it into a vg? of course then we have all
the raid0145+lvm patch issues... grrrr... how bad is the stock kernel raid
support anyway? :)

Well, cheers, and keep up the darn good work all you developers (Heinz
especially :) )

James

On Mon, 22 Nov 1999, Michael Marxmeier wrote:

> Hello Brian,
> 
> > 	Looking at this LVM for linux, it all seems very familiar to me 
> > as an HPUX administrator.  However, the one thing that I don't see is the
> > ability to do RAID1 (mirroring).  Is that available, or will it be in the
> > future?
> 
> You can use LVM on top of MD which provides RAID 1 and 5.
> It was initially planned to have RAID 1 in LVM but so far
> this has not been done.
> 
> It would be nice to have RAID and LVM more integrated (from the
> administrative point of view).
> 
> 
> Hope this helps
> Michael
> 
> --
> Michael Marxmeier           Marxmeier Software AG
> E-Mail: mike@msede.com      Besenbruchstrasse 9
> Phone : +49 202 2431440     42285 Wuppertal, Germany
> Fax   : +49 202 2431420     http://www.msede.com/
> 
