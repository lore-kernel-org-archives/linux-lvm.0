From: guruju@erols.com
Message-ID: <3779A456.15F5@erols.com>
Date: Tue, 29 Jun 1999 22:00:06 -0700
MIME-Version: 1.0
Subject: Re: [linux-lvm] Alpha testers rqd for ext2 fs extend utility.
References: <199906292253.QAA19018@munet-d.enel.ucalgary.ca>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@enel.ucalgary.ca>
Cc: Peter Wuestefeld <Peter.Wuestefeld@resnova.de>, LVM on Linux <linux-lvm@msede.com>

Andreas Dilger wrote:
> 
> I wrote:
> > > Based on the parameters chosen, the new /tt JFS file system
> > > is limited to a maximum size of 134217728 (512 byte blocks)
> 
> Doug replied:
> > What you see there is not related to the "newly created" JFS. It is the effect
> > of a parameter set on the LV - in smitty the "MAXIMUM NUMBER of LOGICAL
> > PARTITIONS" when you create an new LV (on the command line, it is the "-x"
> > parameter to mklv).
> 
> Actually, the above number was from an AIX 4.1.5 system, and it corresponds
> to a 64GB filesystem, which is the largest that AIX can handle at that level.
> I know about the parameter you refer to, but the default is 512 LPs at 4MB
> PP size, which is only a 2GB filesystem by default.  There IS A LIMIT on
> how much an AIX JFS filesystem can grow based on the original parameters.
> 
> > So this leads to the idea that, instead of allocate already space in the
> > filesystem for holding all structures of a 256M FS when creating a FS even
> > smaller, to allocate that in  steps say, related to the PE/LE size of that VG.
> > By that we would gain even more flexibility I think.
> 
> The current setup of ext2 has 2 different size boundaries - 8MB groups,
> and for each 32 groups (256MB) you need another 1K block at the head of each
> group to hold another group descriptor (I think).
> 
> I have been emailing with Mike Field about this, and he has the same
> idea that I do - to "pre-reserve" blocks at the head of each group in a
> new ext2 FS, by either allocating them to a file (maybe a
> .../lost+found/.ext2reserved file - kind of klugy though), or somehow
> marking them used in the bad-blocks bitmap, so that later expansion of
> the FS does not need to move data blocks around.  When we need to
> increase the number of group descriptor blocks when the FS is enlarged,
> we simply write the correct data into the pre-allocated block, lock the
> FS in the kernel for a microsecond, update the kernel structures to
> make the FS larger (and hence use the pre-allocated blocks), and free
> the FS lock.  As much of the ext2 configuration as possible could be
> done in user space (ie creating groups, inode bitmaps in "reserved"
> blocks, etc) and only the minimum while the kernel has the filesystem
> locked.  Hopefully it is possible to do all of the on-disk work outside
> the kernel so we are not faced with long delays or many blocked
> processes because of a long lock on the FS.
> 
> The number of blocks reserved could be based on the LVM parameters, but
> LVM isn't the only way to grow a filesystem - md and hardware RAID come
> to mind.  It should also be possible to reserve more blocks in an
> unmounted ext2 filesystem with a tool that can do FS reorganization.
> If we want a reliable online resize utility, we should make as few
> changes as possible to the running filesystem, so this is why we
> pre-reserve blocks.  Even with the current ext2 setup, it would be
> possible to grow an ext2 filesystem to the next 256MB boundary without
> any FS block moves.
> 
> What needs to be explored is how to safely make the kernel aware of the
> new space while the filesystem is mounted...
> 
> Cheers, Andreas
> --
> Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
>                  Micronet Research Group \ a pound of antipasto, would they
> Dept of Electrical & Computer Engineering \   cancel out, leaving him still
> http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert

There is no limit in sun solaris 2.7, the file system can be more than 
2gigs. This is one of the nice features in solaris2.7

Guruju
