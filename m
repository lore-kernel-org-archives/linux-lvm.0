Subject: Re: [linux-lvm] Error - "device-mapper: request is larger than bl ock size b_size"
Message-ID: <20020823085551.GC932@fib011235813.fsnet.co.uk>
References: <EA753F4887A6ED449866D7F307ABBFDB52499E@mailserver.e-r-solutions.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EA753F4887A6ED449866D7F307ABBFDB52499E@mailserver.e-r-solutions.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Aug 23 03:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

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
