Return-Path: <lembark@wrkhors.com>
Message-ID: <3A86EBB4.E87674DB@wrkhors.com>
Date: Sun, 11 Feb 2001 13:44:52 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Newbie: Recommendations for setting up /home?
References: <3.0.1.32.20010211132021.007a44f0@pop.mindspring.com>
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

>   I'm getting ready to redo our /home filesystem. We currently
> have 5 18 Gig SCSI drives on one SCSI controller. They /home1,
> /home2, etc. I want to convert this to /home using LVM. Are
> there any recommendations for partitioning, etc, to keep the
> throughput as large as possible? Will I be limited because
> of the one SCSI bus (can't afford a RAID controller right now).

(1) decption:

	mkdir /blah/disk1 /blah/disk2...
	mkdir /home;
	mkdir /home.
	mount oldhomevol1 /blah/disk1;
	mount oldhomevol2 /blah/disk2;
	...
	cd /home;
	for dir in /blah/disk*; do ln -f -s $dir/* .; done

what you now have is /home/user1 -> /blah/disk1/user1, etc.  
want to move a disk hog onto the floppy drive?  fine, cpio
/blah/disk1/diskhog to /floppy and change the soft link :-)

yes, there will be a slight hit from perpetually dereferencing
the /home soft links, but these will tend to be chached and 
most of your heavy-duty i/o won't be going there anyway.

(2) let RAID do it for you.

linux uses 4k pages (on 32-bit systems).  if most of your
work on the drives is reading (which is normally true of 
/home) then with 5 disks you can use a 40K raid stripe
(8K chunk/disk) and get reasonable performance.  point to
this is evening out the i/o, with 10:1 giving you reasonable
read caching w/o having monsterous writes (40K is less than
the buffering on most systems).  this 10:1 is a heuristic
that has worked pretty well in most places.  you won't get
much improvement with less than 10:1 (8:1 is OK if you are
heavily into 2**N magic).

if your site follows some sort of 80:20 rule then the vast
majority of your users have almost nothing in their home
directories.  put them onto an 18GB drive and stick the
hogs into a raid5 volume w/ 4k (i.e., 1 page) stripe and 
1k chunk.  gives best performance overall (since the system
can't write < 4k there isn't any real hit from the raid5).

(3) manage the space.  unless you have several million users
(possible, but unlikely) or people are told to do heavy-
duty processing in their home dir's then you might want to
find out why people have this much crap in /home.  you'll
probably find that 90% of it can be cleaned out, or should
be put into project/class/whatever-specific storage areas
which fixed lifetimes so that it gets cleaned out regularly.
after that you can fit a few thousand users into less space
than you are using now.
	

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
