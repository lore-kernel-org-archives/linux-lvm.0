Date: Fri, 12 Oct 2001 11:31:56 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problems patching 2.4.12 with xfs _and_ lvm-1.0.1-rc4-2.4.12.patch
Message-ID: <20011012113156.F971@tykepenguin.com>
References: <20011012103919.A26896@sky.net> <20011012102242.D971@tykepenguin.com> <20011012122221.A11616@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011012122221.A11616@sky.net>; from U.Wiederhold@gmx.net on Fri, Oct 12, 2001 at 12:22:22PM +0200
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

On Fri, Oct 12, 2001 at 12:22:22PM +0200, Ulrich Wiederhold wrote:
> * Patrick Caulfield <caulfield@sistina.com> [011012 11:22]:
> > On Fri, Oct 12, 2001 at 10:39:19AM +0200, Ulrich Wiederhold wrote:
> > > Hello,
> > > I think there is a problem with lvm,  xfs and 2.4.12.
> > > 
> > > I got a clean 2.4.12 kernel and applied
> > > "patch -p1 < /home/fzzgrr/ftpdownload/linux-2.4.12-xfs-2001-10-11.patch"
> > > 
> > > Works fine.
> > 
> > Edit drivers/md/Makefile and change the lvm-mod-objs line to read:
> > 
> > lvm-mod-objs    := lvm.o lvm-snap.o lvm-fs.o
> 
> Hi,
> when?
> Before or after applying the patches?

Sorry, after.

patrick
