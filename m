From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] invalidate: busy buffer
Message-ID: <20011217035359.A4880@tiger.bigcats.invalid>
References: <20011214191634.GB24486@auctionwatch.com> <20011216205044.F26924@tiger.bigcats.invalid> <20011216215414.GB12889@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011216215414.GB12889@sky.net>; from U.Wiederhold@gmx.net on Sun, Dec 16, 2001 at 10:54:14PM +0100
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
Date: Sun Dec 16 21:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Ulrich!

Ulrich Wiederhold (U.Wiederhold@gmx.net) wrote 26 lines:

> * Wolfgang Weisselberg <weissel@netcologne.de> [011216 20:50]:
> > BTW, is there a good reason to run vgscan on boot time every
> > time?  I have had more sorrow than joy with that.  If my
> > vg's really changed, I can always run it from the (non-LVM)
> > / which will come up, even if only as an emergency system.

> Ok, but you need to run vgscan && vgchange -ay every time you wanna use
> your LVM-drives, and I think that's normally every time you boot your
> PC.

Funny, my PC boots and mounts the LVs even though I commented
out vgscan entirely in the boot process.  vgchange is another
thing, though...

> But... I add them
> to /etc/rcS.d/S99local incl. the mount command.

Faaar to late -- considering that all the daemons start up early
and need fancy things like /usr, /var and sometimes /tmp ..


-Wolfgang
