Subject: Re: [linux-lvm] Cluster LVM
Message-Id: <20020228180021.GA563@fib011235813.fsnet.co.uk>
References: <20020228143217.GA4198@fib011235813.fsnet.co.uk>
    <20020228150658.78595.qmail@web13004.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020228150658.78595.qmail@web13004.mail.yahoo.com>
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
Date: Thu Feb 28 12:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 07:06:58AM -0800, Prashant Kharche wrote:
> when node1 issues a command pvmove, LOCK MANAGER will
> block all the nodes from accessing the METADATA for
> that VG and as soon as it finishes updating the
> METADATA, pvmove itself writes the updated kernel VGDA
> on the DISK.. so for this period, METADATA consistency
> is maintained. 

This is not enough, you will end up with a trashed system since node2
will still be writing data to the wrong place.  I think you should
consider only doing offline operations.  ie, acquiring the lock should
fail if any other nodes have activated the vg.

If you really insist on doing live operations I suggest you look at
the device-mapper driver (LVM2), which contains the suspend
functionality that you will need.

- Joe
