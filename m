Subject: Re: [linux-lvm] Re: 2.5.73-mm2
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030629103226.GA661@gmx.de>
References: <20030627202130.066c183b.akpm@digeo.com>
	 <20030628115033.GA660@gmx.de> <20030628222938.78c16450.akpm@digeo.com>
	 <20030629103226.GA661@gmx.de>
Message-Id: <1056994136.3782.4.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Jun 30 12:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Andrew Morton <akpm@digeo.com>

Am So, 2003-06-29 um 12.32 schrieb Wiktor Wodecki:

> > I think there's a version of devicemapper userspace which works correctly
> > with 64-bit dev_t.  Perhaps the Sistina team can shed some light.
>  
> would be nice if somebody else could comment on this..

Simply recompiling libdevmapper against the 2.5.7#-mm# kernel headers
helps for now.

But the plan for the future is that the dm ioctl interface will use 64
bit by default, so that it will work with any kernel version.

-- 
Christophe Saout <christophe@saout.de>
