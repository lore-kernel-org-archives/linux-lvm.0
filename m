Message-Id: <199912211717.SAA27398@e35.marxmeier.com>
Subject: [linux-lvm] Re: 0.7 -> 0.8 Migration
Date: Tue, 21 Dec 99 18:17:37 MEZ
In-Reply-To: <385FAF6D.1BA687E9@cdt.com>; from "Mike Mclinn" at Dec 21, 99 11:48 am
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mmclinn@cdt.com
Cc: linux-lvm@msede.com

Mike McLinn (mmclinn@cdt.com) wrote:
> 
> I've been happily using LVM now for about four months
> with about 60gigs of mixed disks under LVM 0.7.
> 
> So I've read on here that 0.8 will use a different
> protocol, which I assume means I would need to rebuild
> my volume groups from 0.7.  Is this the case?

No. As said in the README file the on-disk data is compatible.
A different protocol version just indicates that the 0.8 kernel
patch is not compatible with the 0.7 user mode tools.
So you need to update both the kernel side and the user mode tools.

> Next question is... Is it likely that 0.9, or 1.0 would
> also require volume groups to be rebuilt?  If so, I'd
> probably just skip 0.8, as I'm pretty happy with 0.7, 
> and the idea of backing up and then restoring 60gigs
> is less than appealing.

I don't know if the 0.9 or 1.0 version will use different
on-disk structures - this could happen. However in this case LVM
should include a tool to migrate your VGs.
So i don't anticipate the necessity to rebuild your disk.

> Thanks a lot!  This is IMHO the most important Linux
> project right now, keep up the great work!

Thanks.


Michael

BTW: To post to the linux-lvm mailing list please send your
message to linux-lvm@msede.com.

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
