Message-ID: <3952BC20.1DE58368@inet.net.nz>
Date: Fri, 23 Jun 2000 13:23:44 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <85256906.006BCDB7.00@d54mta02.raleigh.ibm.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

> Another thing to remember is that users want power without risk.  This is
> especially true in the corporate world.  To make it there, Linux needs a
> very powerful, flexible logical volume management system which minimizes
> the risk of losing data.  This calls for an architecture which integrates
> all aspects of volume/disk management into a single, easy to use entity.
> All processes which could be automated should be automated to prevent
> "accidents", such as the improper shrinking of a volume containing data.
> Right now it is rather easy to accidentally shrink a volume before
> shrinking the filesystem on the volume, or to shrink the filesystem on the
> volume by the wrong amount.  Is fdisk volume group aware (have not tried
> this yet)?  If it isn't, a user could make a mistake and delete a partition
> which belongs to a volume group.  The current system has holes in it, and
> these holes need to be plugged before Linux can be a major player in the
> corporate world.  These holes can be plugged in a patch work fashion, or
> they can be eliminated by adopting an architecture (not necessarily the one
> in the white paper) in which they don't exist or can't occur.

% man e2fsadm

DESCRIPTION
       e2fsadm allows resizing of a logical volume  (see  lvm(8),
       lvcreate(8))  containing  an unmounted ext2 filesystem and
       then extending the filesystem by  resize2fs(8)  afterwards
       or  reducing  the  filesystem  first and then reducing the
       logical volume afterwards.

First thing is Linux-LVM is still evolving and will only get better. Now IBM
and SGI have their own volume management systems which is fine, and
porting them to Linux can only be a good thing too. At the end of the day
its the users in the community that choose. Now its in the community and
IBM users interest for IBM to port AIX systems to Linux, so people can simply
install Linux and use there existing AIX hard drives. The same goes for SGI.
And work is already underway with JFS and XFS for example.
I actually like the system being evolved by Linux-LVM since it follows the
Unix
philosophy do one thing and to it well (the opposite of Micr$oft).

-- Dale.
