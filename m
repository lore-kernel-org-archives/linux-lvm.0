Message-ID: <EA753F4887A6ED449866D7F307ABBFDB524A21@mailserver.e-r-solutions.com>
From: ERG@e-r-solutions.com
Subject: RE: [linux-lvm] Error - "device-mapper: request is larger than bl
	 ock size b_size"
MIME-Version: 1.0
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
Date: Fri Aug 23 13:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Greetings,

The link to the latest stable device-mapper patch (dm_2002-08-23.patch.bz2)
on http://people.sistina.com/~thornber appears to be broken.

Not being a bitkeeper user (and having heard that the changes I want haven't
yet made it to CVS), I'm wondering if there's another place to get this
newest patch.  Any suggestions?


Manuel Gomez



-----Original Message-----
From: Joe Thornber [mailto:joe@fib011235813.fsnet.co.uk] 
Sent: Friday, August 23, 2002 1:56 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Error - "device-mapper: request is larger than bl
ock size b_size"


On Thu, Aug 22, 2002 at 06:14:43PM -0700, ERG@e-r-solutions.com wrote:
> If I get the XFS alignment ironed out, will I cease seeing these
> device-mapper warnings?

Not neccessarily, I really shouldn't have put that sanity check in
... too many filesystems don't set the block size for the block device
correctly.

If you want to get rid of these messages and are not a bitkeeper user
you can get the latest stable patchset from
http://people.sistina.com/~thornber

> In other words, can I use those warnings as a test of my log alignment
> correctness?

No.

- Joe

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
