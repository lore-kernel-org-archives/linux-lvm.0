Subject: Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementation
    ready for beta testing
Message-Id: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
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
Date: Thu Jan 31 13:54:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm-devel@sistina.com
Cc: Jim McDonald <Jim@mcdee.net>, Andreas Dilger <adilger@turbolabs.com>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, evms-devel@lists.sourceforge.net

Joe Thornber wrote:
>On Wed, Jan 30, 2002 at 10:03:40PM +0000, Jim McDonald wrote:
>> Also, does/where does this fit in with EVMS?

>EVMS differs from us in that they seem to be trying to move the whole
>application into the kernel,

No, not really.  We only put in the kernel the things that make sense to be
in the kernel, discovery logic, ioctl support, I/O path.  All configuration
is handled in user space.

> whereas we've taken the opposite route
>and stripped down the kernel side to just provide services.

Then why does snapshot.c in device mapper have a read_metadata function
which populates the exception table from on disk metadata?  Seems like you
agree with us that having metadata knowledge in the kernel is a GOOD thing.

>This is fine, I think there's room for both projects.  But it is worth
>noting that EVMS could be changed to use device-mapper for it's low
>level functionality.  That way they could take advantage of the cool
>work we're doing with snapshots and pvmove, and we could take
>advantage of having more eyes on the core driver.

Since device_mapper does not support in kernel discovery, and EVMS relies
on this, it would be very difficult to change EVMS to use device_mapper.
Besides, EVMS already has all the capabilities provided by device mapper,
including a complete LVM1 compatibility package.

>LVM2 may not seem that exciting initially, since the first release is
>just concentrating on reproducing LVM1 functionality.  But a lot of
>the reason for this rewrite is to enable us to add in the new features
>that we want (such as a transaction based disk format).  It's on this
>new feature list that we'll be mainly competing with EVMS.

Why compete, come on over and help us :-)

Steve


EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM
