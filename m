Return-Path: <thornber@btconnect.com>
Date: Sun, 12 Aug 2001 20:26:25 +0100
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010812202625.A732@btconnect.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <21550000.997643628@dizzy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21550000.997643628@dizzy>; from lembark@wrkhors.com on Sun, Aug 12, 2001 at 02:13:48PM -0500
From: Joe Thornber <thornber@btconnect.com>
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

On Sun, Aug 12, 2001 at 02:13:48PM -0500, Steven Lembark wrote:
> 
> 
> 
> > You should also be able to get all the information you need from the
> > tools.
> 
> Problem with this is (a) having for fork/exec the tool at each
> iteration

Look at the new tool in the experimental branch (which will turn into
2.0 at some point).  We've put in an interactive mode so you can run
the tool once, piping commands to it.

> and (b) having to capture/parse stdout/stderr and
> check exit/signal status for each call.  Just the error checking
> and validating stderr vs. stdout can double the code size for
> getting data.

Not sure I agree with this, the error checking code can be reused for
all your different LVM queries.

> Another way out (which the /proc file system was intended to
> avoid) is to put an add'l device file in the VG directory
> (e.g., "./status") which delivers a struct or block text
> with the same info as /proc has now.  Net result is that a
> simple read or fgets will pull in the necessary info w/o
> all the extra error checking.

This is unlikely to happen, it goes in /proc or not at all.  I do not
understand why people want to remove this sort of information from
/proc.

- Joe
