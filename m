From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] LVM2 strangeness.
Message-ID: <20030530075602.GB445@fib011235813.fsnet.co.uk>
References: <17160000.1054244981@valkyrie.lsit.ucsb.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17160000.1054244981@valkyrie.lsit.ucsb.edu>
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
Date: Fri May 30 02:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 29, 2003 at 02:49:41PM -0700, Max Kalika wrote:
> Right now during an rsync of a huge mailstore (lots of small files) from
> the mail server, the performance on the backup server degrades severly (up
> to 12 1min load ave. and higher) and I'm seeing lots of the following in
> the kernel log:
> 
>   May 29 14:14:15 butters invalidate: busy buffer
>   May 29 14:14:15 butters invalidate: busy buffer
>   May 29 14:14:15 butters invalidate: busy buffer
>   May 29 14:14:15 butters invalidate: busy buffer
>   ... on and on and on ...

This is due to us trying to flush the LVM metadata writes to a device
that also contains a mounted filesystem, it should only happen when
you change your LVM configuration (eg, take another snapshot).  We're
using O_DIRECT in the next release, so they will go away soon.

- Joe
