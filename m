Subject: Re: [linux-lvm] read-only media in a LVM?
Message-ID: <20020528084610.GA1266@fib011235813.fsnet.co.uk>
References: <81y9e5novm.fsf@zion.bpnetworks.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81y9e5novm.fsf@zion.bpnetworks.com>
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
Date: Tue May 28 03:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, May 27, 2002 at 04:37:49PM -0700, Ami Fischman wrote:
> Hi there,
> I am wondering whether it is possible to have a read-only fs (CDROM, image,
> etc) as part of an LVM-managed volume.  I see references to COW
> (copy-on-write, I'm hoping :)) in the kernel drivers/md/ files, but it's not
> at all clear to me whether or not the current drivers can be used to
> implement a "translucent" or "inheriting" file system (one where a base fs
> is given, on r-o media, and changes to it get recorded on another device,
> presumabely a r-w fs).  Please let me know whether this is currently
> possible, being planned for the future, or if I'm making no sense above &
> you want me to clarify :).  For a not-quite-mature example of what I'm
> talking about, see translucency.sf.net.

LVM2 already contains writeable snapshots, and we are currently
working on the other thing that you will need which is the ability to
use disks as PVs without having any LVM metadata written to them.
Check back at the end of June, we may have done it by then.

- Joe
