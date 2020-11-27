Message-Id: <200006080022.CAA16063@e35.marxmeier.com>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Date: Thu, 08 Jun 2000 2:22:14 MESZ
In-Reply-To: <Pine.LNX.4.21.0006080005180.26807-100000@fogarty.jakma.org>; from "Paul Jakma" at Jun 8, 100 12:18 (midnight)
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul@clubi.ie
Cc: jan@gondor.com, ak@suse.de, linux-lvm@msede.com

> 
> On Wed, 7 Jun 2000, Jan Niehusmann wrote:
> 
> > The snapshot logic simply doesn't know what a filesystem is. It just
> > clones the block device.
> 
> this i knew.. :)
> 
> > So the fs may be in en inconsistent state, if you do the snapshot
> > while some write operation is in progress on the cloned
> > filesystem.
> 
> ok. so the solution is what? a call in the vfs to complete pending
> writes, and hold off on modifying any blocks?

IMHO when creating a snapshot LVM could simply sync all outstanding
buffers for the block device vialog block_fsync() (not sure if this
is already done -- Heinz care to comment?).
This should also take care of pending fs meta information thus
we should get a consistent state.

The question is how atomic this is? Since fsync_dev() currently
does a lock_kernel() is might even be sufficient.


Any reason why this is not suffiecient?

Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
