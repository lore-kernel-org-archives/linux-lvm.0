Message-ID: <299BF5F5EF5ED31196760008C7D9AE5D03AFCA1F@STLABCEXG022>
From: "Wilson, Eric" <Eric.Wilson@anheuser-busch.com>
Subject: RE: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Date: Mon, 26 Jun 2000 09:27:13 -0500
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

I have to agree with Dale on this. So far the Linux LVM implementation seems
less than "Enterprise server mission critical." I don't mean to seem harsh or
negative, but my person life mission is to replace NT with Linux in every
instance possible. To widen the usage of Linux, Linux MUST be seen as reliable,
mission critical, but also easy to get it that way and keep it that way. (for
the point and click boys)

I will openly admit to being in love with the AIX LVM. the reasons are really
quite simple: A database server running several Terabytes of data can easily be
massaged without  fear of screwup or failure. The LINUX LVM must adhere to these
same all or nothing, rock solid philosophies to crush Microsoft. 

I realize I'm preaching to the choir, but Dale's primary premise holds true: To
get Linux and it's LVM out of the Uni. or LAB and into the Enterprise
datacenter; it must be foolproof.

  

Cheers;

> Eric Wilson
> IBM Certified AIX & SP Systems Support Specialist
> 
> Anheuser-Busch Companies, Inc.
> 
> One Busch Place
> 1CC-8
> St. Louis, MO 
> 
> Office		314.632.6653
> Mobile		314.495.4010
> Pager		314.670.0367
> 
> email		eric.wilson@anheuser-busch.com
> 
> 
> E!
> 
> 
> 
> 
> -----Original Message-----
> From:	Dale Kemp [SMTP:dale@inet.net.nz]
> Sent:	Thursday, June 22, 2000 8:24 PM
> To:	Linux LVM mailing list
> Subject:	Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
> 
> > Another thing to remember is that users want power without risk.  This is
> > especially true in the corporate world.  To make it there, Linux needs a
> > very powerful, flexible logical volume management system which minimizes
> > the risk of losing data.  This calls for an architecture which integrates
> > all aspects of volume/disk management into a single, easy to use entity.
> > All processes which could be automated should be automated to prevent
> > "accidents", such as the improper shrinking of a volume containing data.
> > Right now it is rather easy to accidentally shrink a volume before
> > shrinking the filesystem on the volume, or to shrink the filesystem on the
> > volume by the wrong amount.  Is fdisk volume group aware (have not tried
> > this yet)?  If it isn't, a user could make a mistake and delete a partition
> > which belongs to a volume group.  The current system has holes in it, and
> > these holes need to be plugged before Linux can be a major player in the
> > corporate world.  These holes can be plugged in a patch work fashion, or
> > they can be eliminated by adopting an architecture (not necessarily the one
> > in the white paper) in which they don't exist or can't occur.
> 
> % man e2fsadm
> 
> DESCRIPTION
>        e2fsadm allows resizing of a logical volume  (see  lvm(8),
>        lvcreate(8))  containing  an unmounted ext2 filesystem and
>        then extending the filesystem by  resize2fs(8)  afterwards
>        or  reducing  the  filesystem  first and then reducing the
>        logical volume afterwards.
> 
> First thing is Linux-LVM is still evolving and will only get better. Now IBM
> and SGI have their own volume management systems which is fine, and
> porting them to Linux can only be a good thing too. At the end of the day
> its the users in the community that choose. Now its in the community and
> IBM users interest for IBM to port AIX systems to Linux, so people can simply
> install Linux and use there existing AIX hard drives. The same goes for SGI.
> And work is already underway with JFS and XFS for example.
> I actually like the system being evolved by Linux-LVM since it follows the
> Unix
> philosophy do one thing and to it well (the opposite of Micr$oft).
> 
> -- Dale.
> 
