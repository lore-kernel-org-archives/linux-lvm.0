Subject: Re: [linux-lvm] applications not working with lvm
Message-ID: <20020813075835.GA1048@fib011235813.fsnet.co.uk>
References: <3D57F98C.9040408@jumpline.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D57F98C.9040408@jumpline.com>
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
Date: Tue Aug 13 02:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 12, 2002 at 02:08:12PM -0400, Ben Snyder wrote:
> Has anyone had any problems with any applications working on a 
> filesystem, where that filesystem was on a logical volume?
> 
> I've got an application that simply wont work (sorry, dont want to give 
> too many details).  It creates very large quantities of hard links, 
> binds a local directory to /proc

/proc could be tripping you up.  strace the LVM1 tools and see which
files in /proc it is trying to read, then check you have faked them
correctly.

> creates local files to represent block devices and FIFO files.

Search this mailing list for ways to get loop devices working with LVM1.

- Joe
