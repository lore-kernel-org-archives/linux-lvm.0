Message-ID: <20020715085954.GB3432@fib011235813.fsnet.co.uk>
References: <3D2F6464.60908@us.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D2F6464.60908@us.ibm.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
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
Date: Mon Jul 15 04:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Theurer <habanero@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Andrew,

On Fri, Jul 12, 2002 at 06:21:08PM -0500, Andrew Theurer wrote:
> Thanks for the results.  I tried the same thing, but with the latest 
> release (beta 4) and I am not observing the same behavior.  Your results 
> show very little difference in performance when using different chunk 
> sizes for snapshots, but I observed a range of 10 to 24 seconds for this 
> same test on beta4 (I have also included EVMS 1.1 pre4):

I must admit your results are strange to say the least, the only
explanation that I can think of at the moment is that you have been
running LVM1.

Just to reassure me that this is not the case, can you please make
sure that the LVM1 driver is not available, and that your path are not
picking up old LVM1 tools by mistake.  There was a time when the tools
were installed in /usr/sbin rather than /sbin.

- Joe
