From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] invalidate: busy buffer
Message-ID: <20011216205044.F26924@tiger.bigcats.invalid>
References: <20011214191634.GB24486@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011214191634.GB24486@auctionwatch.com>; from petro@auctionwatch.com on Fri, Dec 14, 2001 at 11:16:34AM -0800
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
Date: Sun Dec 16 14:38:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Petro!

Petro (petro@auctionwatch.com) wrote 37 lines:

> vgscan -- reading all physical volumes (this may take a while...)
> invalidate: busy buffer
> invalidate: busy buffer

I have been told that these (at vgscan) are spurious and not
dangerous.

> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group

This warning is non-critical, just a friendly remainder.

BTW, is there a good reason to run vgscan on boot time every
time?  I have had more sorrow than joy with that.  If my
vg's really changed, I can always run it from the (non-LVM)
/ which will come up, even if only as an emergency system.

-Wolfgang
