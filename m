From: Patrick Swartz <pswartz@digitalrom.com>
Subject: RE: [linux-lvm] Disk striping option
Date: Wed, 8 Nov 2000 14:48:30 -0600
Message-ID: <OLEAJMNOEMOMMNEIMMINEEIGCBAA.pswartz@digitalrom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200011082028.eA8KSTQ15651@webber.adilger.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

Thanks for responding so quickly.  I should add that each JBOD chassis is
attached to it's own ICP card in a Raid 5 + hot spare configuration.  This
system will be used in a heavy fileserver environment doing reads-writes
with large files.
From LVMs point-of-view would it only see "2" drives (the two h/w raid5's)?
Thanks,
Patrick

-----Original Message-----
From: Andreas Dilger [mailto:adilger@turbolinux.com]
Sent: Wednesday, November 08, 2000 2:28 PM
To: Patrick Swartz
Cc: linux-lvm@msede.com
Subject: Re: [linux-lvm] Disk striping option


Patrick Swartz writes:
> I have a question about the use of the LVM native striping option.  Here
is
> my scenario: I have RH7.0 with an ICP-Vortex Raid controller and 11
Seagate
> 50G hard-drives in a JBOD chassis that is set up as a single VG.  An older
> system has the same configuration without LVM and using RH6.2.
> What I want to do is move all of the data from the older system to the LVM
> system and then add the old 11 drives to the LVM system to in affect
double
> my space available.
>
> Also, do you have any recommendation for a File System to use? This is a
> production system so I am a little leery of 0.0.x software, but I am not
> crazy about ext2 fcsk on 1TB of data either.

If this is a production system, I would be very leery of using 11 disks
striped together into a single filesystem.  I'd be even more leery of
having 22 disks in this configuration.  First of all, you can't get
close to 11x the bandwidth of a single disk, and secondly you will
kill your I/O rate because each of the 11 disks will have to be involved
in every I/O rather than allowing them to each handle separate I/Os.

Also, you run a huge risk of trashing all of your data if a single disk
fails, whereas with the normal concatenated configuration you at least
have some chance to get the data back.

RedHat is running a Beta program with ext3-0.0.3b, and I've been using
it on my systems for several months without problems.  Despite the
version number, it is very robust and is only lacking metadata-only
journalling (added in 0.0.5 but it came with a few bugs).

Of course, your choice of filesystem also depends on what you are using
this server for.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
