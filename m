Subject: Re: [linux-lvm] device-mapper & proc
Message-ID: <20021011094521.GA2093@fib011235813.fsnet.co.uk>
References: <1034276879.2396.11.camel@mars.goatskin.org> <20021011075220.GA1153@fib011235813.fsnet.co.uk> <20021011090446.GA5506@sparcbox.net> <20021011092455.GA5529@sparcbox.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021011092455.GA5529@sparcbox.net>
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
Date: Fri Oct 11 04:48:00 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 11, 2002 at 02:24:55AM -0700, Steven Stillaway wrote:
> LVM has /proc/lvm, DM does not seem to have anything
> equivalent.
> 
> Is there a reason for this?

Yes, device-mapper is a much lower level driver, it is not specific to
LVM (eg, it knows nothing about volume groups).  The information
simply isn't present in the kernel to be published in a /proc file.

> Is this likely to change?

No.

> I ask because my start scripts look for /proc/lvm --
> if I could have them check for /pro/lvm or /proc/dm
> and run the appropriate command that would be useful.

I'm not sure what you mean by 'appropriate command', what information
are you getting from /proc/lvm that you can't get from the userland
tools ?  If you just want to see if device-mapper is present:

grep device-mapper /proc/devices

- Joe
