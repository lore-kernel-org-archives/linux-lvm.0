Return-Path: <mits@xenotrope.com>
Message-ID: <3A4D337B.5835DE56@xenotrope.com>
Date: Fri, 29 Dec 2000 19:59:39 -0500
From: Mits Yanagihashi <mits@xenotrope.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] OK to backup physical volume to tape?
References: <3A4D0C25.A4BB534B@xenotrope.com> <3A4D2939.C089EC3B@wrkhors.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thank you for your suggestions.  I forgot to mention some more details:

1. A given day's backup must use only one tape (backup can't span
multiple tapes; I don't have a tape autoloader).
2. Much of the data is already compressed, so additional compression
doesn't help.

I have to backup two directories of, say, 60 and 70 GB using a tape
drive with 33 GB native capacity.  I was hoping to create the
directories out of smaller PVs that could fit on tape (but I guess I'm
out of luck).  I was wondering if I could uses LVM snapshots to solve my
problem, but the same issues still apply.

I think I may have to forget about LVM and divide the 130 GB space into
slices that can fit on tape.

Sincerely,
Mits


Steven Lembark wrote:
> 
> Mits Yanagihashi wrote:
> >
> > Hello,
> >
> > I'm a LVM newbie with a question.  I haven't managed to find an answer
> > yet, so I'm posting my question here.
> >
> > I have a hardware RAID 5 volume on my server; Linux sees this as one 130
> > GB disk (/dev/sda).
> >
> > I have one tape drive that can store 33 GB (uncompressed).  I want to
> > backup 130 GB over a 5 day week.  I want my users to see two directories
> > "/dir1" and "/dir2", but my tape cannot fit a full dump of either one
> > directory.
> >
> > This is what I want to do:
> >
> > 1. Divide /dev/sda into 5 partitions of 26 GB each.  Make each partition
> > a physical volume.
> >
> > 2. Make one volume group.  Add two logical volumes (that together use
> > the 5 physical volumes) to the volume group.
> >
> > 3. My users can use the two logical volumes (dir1 and /dir2, which may
> > be 52 and 78 GB respectively).  Each night a full backup of one physical
> > volume, and incrementals of the other four physical volumes are written
> > to tape.  One tape can store 26 GB, and still have space for incremental
> > backups of the other physical volumes.
> >
> > My question is, is it safe to backup the physical volume (i.e. dump
> > /dev/sda1 to tape)?  Or are there complications with file system
> > state/meta information?
> 
> backing up physical volumes is suicide.  dd is the only tool that will
> copy the stuff out and it cannot verify the output.  better way to fit
> daily backups is zip them or restrict the number of files backed up
> by directory, or simply store the backups on mutiple tapes.
> 
> make incremental backups:
> 
>         find /dir1 -mtime -1 |
>                 cpio -o -Hcrc --file=/dev/tape --io-size=$((1024*1024*16));
> 
> this is the safest way, and if it runs over one tape
> then you will be asked to place in another tape and
> keep going.  viola, multiple tape backup sets.
> 
> zip the dailys (not a good idea for long-term storage but quite
> workable for q&d backups, also speeds up recovery:
> 
>         find /dir1 | cpio -o -Hcrc | gzip --fast |
>                 dd of=/dev/tape obs=16386k;
> 
> if you need to REALLY squish the stuff:
> 
>         ... | bzip -9 | ...
> 
> or
> 
>         ... | gzip --best | ...
> 
> will maximize the compression.
> 
> if people are paranoid about loosing work you can also make
> since-the-weekly-backup incrementals:
> 
>         touch start-of-weekly-backup-file;
>         make_weekly_backup;
> 
> then daily:
> 
>         find /dir1 -newer start-of-weekly-backup-file |
>                 cpio -o -Hcrc | blah | blah | blah;
> 
> this will make successively larger backups each day.
> 
> if you use the "--file" option then when one tape runs out cpio
> will rewind and ask you to hit return when the second tape is
> loaded.  dd will not support multiple tapes.
> 
> you can also find /dir1/foo onto one backup, find /dir1/bar
> onto another, etc.
> 
> --
>  Steven Lembark                                   2930 W. Palmer St.
>                                                  Chicago, IL  60647
>  lembark@wrkhors.com                                   800-762-1582
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
 Mits Yanagihashi, Consultant, Xenotrope, Inc.
 55 John Street, New York, NY 10038
 Phone:(212)964-4242  Fax:(212)964-5522
 mits@xenotrope.com   http://www.xenotrope.com
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
