Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 21 Aug 2001 18:08:55 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010821180855.A4772@tykepenguin.com>
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com> <3B8267F5.D3174CAB@tls.msk.ru> <20010821160012.E25747@dragon.blacknet.de> <20010821112252.A21206@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010821112252.A21206@sistina.com>; from lewis@sistina.com on Tue, Aug 21, 2001 at 11:22:52AM -0500
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

On Tue, Aug 21, 2001 at 11:22:52AM -0500, AJ Lewis wrote:
> On Tue, Aug 21, 2001 at 04:00:12PM +0200, Goetz Bock wrote:
> > 
> > On Tue, Aug 21 '01 at 17:53, Michael Tokarev wrote:
> > > But how to have root mounted read-only?
> > > I resolved problem with only one file that needs to be read-write --
> > > it is /etc/mtab that I moved out to /var/run (modified glibc and
> > this should be fixable with making /etc/mtab a link to /proc/mounts
> 
> I've done this on my system for about a month it seems to work fine.

Apparently there are problems with loopback mounts if you do this, but if that's
not an issue it should be fine.

patrick
