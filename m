From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] accidently formatted a physical volume...
Message-ID: <20020820185256.GE1073@clusterfs.com>
References: <20020819192319.GB25631@grimlock> <284650000.1029786116@[192.168.200.4]> <1265620671.20020819224124@tnonline.net> <20020819205005.GA26781@grimlock> <3D6159EA.1070406@birddog.com> <20020820175543.GA8709@grimlock> <3D62888B.1060203@birddog.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D62888B.1060203@birddog.com>
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
Date: Tue Aug 20 13:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kirby C. Bohling" <kbohling@birddog.com>
Cc: linux-lvm@sistina.com

On Aug 20, 2002  13:20 -0500, Kirby C. Bohling wrote:
> In the end, LVM is an abstraction for a block device.  So I'd create 
> a file and connect a loopback that was the same size as the LV.  So pull a 
> physical extent, figure out if it is associated with the lv you're 
> recovering.  Take the lv extent offset it is, and seek the extent size * 
> logical extent number and write it to the loopback device.  Throwing 
> away the LVM metadata.  Now, you can take this big pile of bits to an 
> ext2/3 guru, and ask them how to glean as much data as possible out of 
> it.  If the LV was completely on one disk, it should just fsck and 
> mount.  Assuming you didn't specify the sizes, and do a lot of resizing 
> of the LV's that should be the case.  Possibly asking the ext2/3 guru 
> what the holes should be filled in with, and put that there. I'd guess 
> zero's.  This trick should work on both sets of disks, but it'll be 
> easier to pull off with known good meta-data.

Run something like "gpart" or build the findsuper program in
e2fsprogs/misc, which should give you a pretty good idea of where things
are put on the disk.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
