From: Anders Widman <andewid@tnonline.net>
In-Reply-To: <20011228150135.Z12868@lynx.no>
Message-Id: <HERMLVP3LF64RO0908GEIF85NXVIC.3c2f493d@kadzuki>
Subject: Re: [linux-lvm] Removing a physical volume.
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Date: Sun Dec 30 11:03:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

2001-12-28 23:01:35, Andreas Dilger <adilger@turbolabs.com> wrote:

>On Dec 28, 2001  22:27 +0100, Anders Widman wrote:
>> This is my current setup:
>> 
>> 14 physical disks in one logical volume (share) formated with reiserfs,
>> in one volumegroup (server). There are no free physical extents, though
>> there are about 150GB free space in the filesystem.
>> I want to remove one physical disk and have all data moved over to the
>> remaining disks.
>
>You need to run resize_reiserfs (on the unmounted filesystem) to reduce the
>size of the filesystem by _at_least_ the size of the disk you want to
>remove.  Then, after the filesystem is shrunk, you run lvreduce to reduce
>the size of the LV.  Shrink the LV no more than you shrunk the filesystem
>or you will have problems*.
>
>After this, you need to run "pvmove -v <pv>" to remove any PEs that are
>in use on this disk to other disks.  You should have enough free PEs at
>this point because you reduced the size of the LV enough to remove the disk.
>Finally, run "vgreduce <pv>" to remove the (now unused) PV from the VG and
>you are set.`
>
>Cheers, Andreas
>
>(*) Normally, what I would do is overshrink the fs, shrink the LV
>    conservatively, then expand the fs to fill the rest of the LV again.
>--
>Andreas Dilger
>http://sourceforge.net/projects/ext2resize/
>http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
>

Thanks, this worked great!

//Anders
