Return-Path: <ralph@oro.net>
Date: Tue, 13 Mar 2001 13:16:21 -0800
From: Ralph Jennings <ralph@oro.net>
Subject: Re: [linux-lvm] RE: emails
Message-ID: <20010313131621.A8580@d3.front>
References: <20010312162713.A10492@omnifarious.mn.org> <200103122302.f2CN2GL00700@webber.adilger.int> <20010312172433.G31067@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010312172433.G31067@sistina.com>; from lewis@sistina.com on Mon, Mar 12, 2001 at 05:24:33PM -0600
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 12, 2001 at 05:24:33PM -0600, AJ Lewis wrote:
> That might make sense.  Can we assume everyone has access to a browser and
> will be willing to use if for bug reports?  I know it makes it a lot easier
> for us as developers to track the bugs if they are reported there, but I'm
> not sure that everyone is willing to do so.   Plus, many times people send
> bug reports from the console during the LVM install process, and so may not
> have easy access to a browser.  I know Heinz initially had some concern about
> limiting file size on the list, so we'll have to get his opinion on this.

Somebody oughta write a program that figures exactly what
version of LVM, Kernel, and LVM tools are installed, and
writes the bug report for you.  Debian has something like
this called "bug".  You run "bug mutt", and it figures out
all the versions of mutt, the kernel (uname -a), and the
libraries that mutt depends on.  You just give it the 
program, a description of the bug, and the severity, and
it fills in the bug report and e-mails it for you.  Very
nice when you find a bug, but you're in the middle of
something and don't have the time to research and figure
everything out yourself.  It'll even attach the core file
if you want.

 -Ralph
