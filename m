Return-Path: <lord@sgi.com>
Message-Id: <200105231113.f4NBDLA21032@jen.americas.sgi.com>
Subject: Re: [linux-lvm] XFS and LVM 
In-Reply-To: Message from Harald Milz <hmilz@linux-magazin.de> 
   of "Wed, 23 May 2001 10:34:30 +0200." <20010523083432.3601F15CB5@mail.linux-new-media.de> 
Date: Wed, 23 May 2001 06:13:21 -0500
From: Steve Lord <lord@sgi.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> But that was just once. I still have everything on reiserfs on LVM on my
> machines, and just started to experiment with XFS. The fact that it is not
> shrinkable is a bit annoying though. Like AIX JFS. ...
> 
> --
> Harald Milz           |     hm@linux-magazin.de     | If one studies too

Growing is a fairly simple operation for filesystems, shrinking complexity
is a function of metadata complexity, and XFS metadata is very complex,
the exception to this is the case of filesystems designed with shrinking
in mind, but they will almost certainly have to make compromises to support
this.

Shrinking is also a less used operation in production situations than growing,
it might be fun to play with, but the type of system XFS comes from you would
tend to just buy more disks than move one out of an existing filesystem.
The only really useful 'shrink' operation in this scenario is remove a
failing drive, and given the volume managers which usually sit under XFS
the only thing capable of doing this is mirroring the drive (or using
hardware raid).

Oh, and online shrinking would be the preferable implementation in a
production situation, which means doing it with transactions.

So these are the reasons XFS does not have a shrink capability. As a
technical option it is possible to implement this, but the code would
be very complex and we have a lot of other things to do which have a
higher priority. As I have said before, if someone wants to try it
I would be happy to offer suggestions.

Steve
