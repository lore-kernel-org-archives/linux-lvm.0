Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <Pine.LNX.4.21.0006240048000.30225-100000@fogarty.jakma.org> <39545721.E8C392C5@inet.net.nz>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 26 Jun 2000 08:31:04 +0200
In-Reply-To: Dale Kemp's message of "Sat, 24 Jun 2000 18:37:21 +1200"
Message-ID: <yq1ituxkl7b.fsf@tyra.mkp.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Kemp <dale@inet.net.nz>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

>>>>> "Dale" == Dale Kemp <dale@inet.net.nz> writes:

Dale> Not only this, but SGI are looking at releasing their volume
Dale> management system as well. 

Porting it, yes.  It is a prerequisite for CXFS.  Whether XVM will be
released as GPL has yet to be determined.


Dale> Now does the user really want three (or more) logical volume
Dale> management systems, all with different toolsets and kernel
Dale> modules? 

There are many different approaches to volume management.  Neither of
the three in question are similar enough to make integration trivial.

I suspect the users will have several LVMs to choose from in the
future.  Just as it is the case with file systems.  This has the
advantage that the user can choose whatever implementation solves
his/her problems.


Dale> Now are we going to see SGI's XFS sitting on top of IBM's LVMS!?

If IBM's LVMS will be using a kiobuf-based request scheme instead of
buffer_heads, yes.


Dale> Wouldn't it be much nicer to see XFS, JFS, EXT3, ReiserFS all
Dale> sitting on top of Linux-LVM; 

We'll certainly do our best to make sure XFS will work with all LVMs.

Heinz' implementation doesn't quite cut it for all purposes, however.
Neither does any of the other volume managers out there.

-- 
Martin K. Petersen      Principal Linux Consultant, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
