From: Keith Owens <kaos@sgi.com>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
In-Reply-To: Your message of
    "Fri, 04 Jan 2002 17:53:05 +1000."
    <200201040853.g048rLg15408@oss.sgi.com>
MIME-Version: 1.0
Message-Id: <2519.1010133799@ocs3.intra.ocs.com.au>
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
Date: Fri Jan  4 02:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Andreas Dilger <adilger@turbolabs.com>, linux-xfs@oss.sgi.com, linux-lvm@sistina.com

On Fri, 4 Jan 2002 17:53:05 +1000, 
Adrian Head <ahead@bigpond.net.au> wrote:
>This is what I'm having trouble with at the moment.  When the kernel Oops 
>occurs it drops me into kdb (kernel debugger).  From here I can look at 
>current process status, do back traces on anything thats running etc.. but it 
>never shows me the full Kernel Oops and there is no record of it in the logs 
>either.  I expect that a couple of backtraces, list of processes, register 
>values would be equivalent to a Kernel Oops report?

If you type 'go' in kdb then the kernel will continue with the rest of
the oops processing.  The registers and backtrace from kdb are better
data than oops can do, more detailed and more accurate.  The oops
report gives the failing code, use 'id %eip' in kdb to decode the
current instructions.
