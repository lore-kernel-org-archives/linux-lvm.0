Message-ID: <3DA47606.546A558E@digeo.com>
From: Andrew Morton <akpm@digeo.com>
MIME-Version: 1.0
References: <20021009181259.GA25050@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [PATCH] 2.5 version of device mapper submission
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
Date: Wed Oct  9 13:32:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: Linux Mailing List <linux-kernel@vger.kernel.org>, linux-lvm@sistina.com

Joe Thornber wrote:
> 
> The 2.5 port of device-mapper is available from:
> 
>    bk://device-mapper.bkbits.net/2.5-stable

Is it available in a form which everyone can access?

> There are 6 changesets in here that are summarised at the end of this
> email.
> 
> If you wish to use it you will need to install libdevmapper:
> 
>    ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-latest.tgz
> 

That appears to have 2.4.19 diffs only?

What I really wanted to know is "are you still using kiobufs"?

If so, what do we need to do to not do that?
