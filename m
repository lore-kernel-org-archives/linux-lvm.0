Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1O93si01662
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 04:03:54 -0500
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20040224090356.GD14731@reti>
References: <20040223163106.GA22231@cistron.nl> <20040223203731.GA14731@reti> <20040224002116.GA6965@drinkel.cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040224002116.GA6965@drinkel.cistron.nl>
Subject: [linux-lvm] Re: dm, dm_table, request_queue
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 24 04:02:06 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: Joe Thornber <thornber@redhat.com>, linux-lvm@sistina.com

On Tue, Feb 24, 2004 at 01:21:16AM +0100, Miquel van Smoorenburg wrote:
> All in all, I think that the first approach is the simplest and
> therefor the best.
> 
> So how does this look:

Better wrt keeping mapped_device out of dm-table.c.  But it still has
the problem that it treats congestion in any subdevices equally (which
may be a good approximation to start with).

I'll stick this in my pending queue, and look at it later in the week.
I think you're quite close, given that Jens doesn't want the
backing_dev pointer in the queue.

Thanks,

- Joe
