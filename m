From: Micah Anderson <micah@riseup.net>
Subject: Re: [linux-lvm] determing lvm support
Message-ID: <20031220185413.GB10107@buffy.riseup.net>
References: <1071881237.1464.14.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1071881237.1464.14.camel@rich>
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
Date: Sat Dec 20 12:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 19 Dec 2003, Rich Turner wrote:

> is there any fool proof way of knowing whether or not a system has lvm
> support?
> 
> right now i determine it this way:
> 
> lvm1:

> look for "lvm-mod" in /lib/modules/[release]/kernel/drivers/md/*

> lvm2:
> look for "dm-mod" in /lib/modules/[release]/kernel/drivers/md/*

The only problem with this step is that many kernels (any
production-level server of mine at least) do not use loadable modules,
but instead build LVM support striaght into the kernel. In these cases
your tests for the modules will fail. 
