Message-ID: <20021011075220.GA1153@fib011235813.fsnet.co.uk>
References: <1034276879.2396.11.camel@mars.goatskin.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1034276879.2396.11.camel@mars.goatskin.org>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: device-mapper transition
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
Date: Fri Oct 11 02:53:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shane Shrybman <shrybman@sympatico.ca>
Cc: linux-lvm@sistina.com

Shane,

On Thu, Oct 10, 2002 at 03:07:58PM -0400, Shane Shrybman wrote:
> Is it fully backwards compatible? Can a move from 2.4 to 2.5 and back
> again without problems? I think it is but just wanted to make sure.

Yes

> In terms of making the transition it looks like I have to be running a
> kernel with dev-mapper in it before I can compile the user space LVM2
> tools.

This isn't quite true.  The lvm2 tools link to libdevmapper, which is
a tiny library that encapsulates the ioctl interface to the kernel.
In order to build libdevmapper (found in the device-mapper tarball)
you will need a kernel *source* tree that has been patched with
device-mapper.  You can use the --with-kernel_dir option to configure
to specify kernel source that is not in /usr/src/linux.

Don't hesitate to come and get help on irc.openprojects.net #lvm if
you need more help.

> I understand from your posts that LVM2 is basically stable but does not
> support snapshots at this time. Does it support pvmove, extend and
> shrink or are these dangerous/unsupported?

2.5 doesn't yet support snapshots, 2.4 does.  The only other major
feature missing is the pvmove tool (missing from both kernels).
Resizing is fine, if the tool is there we believe it works, don't be
afraid of running something because it might not be finished.

If you do try 2.5 feedback would be appreciated.

- Joe
