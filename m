Message-Id: <199910201149.AA09133@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] how to remove PV from a VG?
Date: Wed, 20 Oct 1999 13:48:40 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> Heinz Mauelshagen (mauelsha@ez-darmstadt.telekom.de) wrote :
> 
> > > 
> > > Hey folks,
> > > 
> > 
> > Hi Freddy.
> > 
> > > the subject says it (almost) all, I need to remove three PVs that were added to my VG by mistake (namely /dev/sdi, /dev/sdj and /dev/sdk), I guess you see where the error is. I can access data on previous PVs (yet), but don't know how to remove PVs, there is nothing linke 'pvremove'. I can assure you there is no data (perhaps except signature) on those disks.
> > > 
> > 
> > vgreduce YourVG /dev/sd[i-k]
> > 
> > - or, if the 3 partitions hold the only empty PVs of YourVG -
> > 
> > vgreduce -a YourVG
> 
> yes, helped quite enough, just the /dev/sd[ghi] devices are still in list of valid PVs and when I run pvscan my partitions get destroyed (I suppose because of rewriting LVM marker to the device). How do I really, physically remove the devices from the PV list?

Set the partition type identifier to something different than 0xfe.

regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
