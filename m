From: Jesse Sipprell <jss@evcom.net>
Date: Tue, 14 Nov 2000 09:38:55 -0500
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
Message-ID: <20001114093855.A21984@kevorkian.evcom.net>
References: <20001111084602.B26544@kevorkian.evcom.net> <20001114074425.Z370@jadzia.josv.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001114074425.Z370@jadzia.josv.com>; from josv@osp.nl on Tue, Nov 14, 2000 at 07:44:25AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jos Visser <josv@osp.nl>
Cc: linux-lvm@msede.com

On Tue, Nov 14, 2000 at 07:44:25AM +0100, Jos Visser wrote:
> Hi Jesse,
> 
> Let's see if I get this right: You have an LVM configuration on a shared
> SCSI disk set. I understand from your description that you have some
> VG's active on more than one node at a time. Is this right? If so, I
> wonder if it's supported (others are better equiped to determine this
> than I am). However, most volume managers on other Unix platforms do not
> allow this. 
> 
> As far as I know the vgchange inactive/active bounce is the only thing
> that will refresh the metadata. 
> 
> However, if you have the VG truly active on more than one node (if
> that's possible), you have a recipe for disaster! What if you by mistake
> change the VG (e.g. adding an LV) from one node, and then perform a
> similar action from another node? I would not be surprised if there
> would be corruptions, oopses and panics all over the place.

You are correct, sir. ;)  It is exceedingly important that each node's view of
the LVM metadata be consistant.  I understand that the addition of LVM
clustering features (including this issue and others) is currently in the
works.

In the mean time, I'll just have to do things the old fashioned way.  I'll put
a procedure in place that any LVM changes done from a particular node require
the bouncing of VGs on all other attached nodes.  Fortunately, after initial
cluster setup, manipulation of LVs won't really be performed on a routine
basis.

-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *
