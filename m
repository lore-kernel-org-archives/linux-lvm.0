Subject: Re: [linux-lvm] LV Fragmentation determination
Message-ID: <20021106133803.GA22411@reti>
References: <Pine.LNX.4.44.0211060108110.8692-100000@junior.lunanet.biz> <20021106135537.A1228@sistina.com> <95154593687.20021106141700@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95154593687.20021106141700@tnonline.net>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Wed Nov  6 07:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 06, 2002 at 02:17:00PM +0100, Anders Widman wrote:
> >> First off, can LV's become fragmented across a PV/VG? If yes then...
> 
> > Yes, they can.
> 
> >> 
> >> I'm looking for an easy way to determine how fragmented an LV might been
> >> inside the VG. Is there any command I can run that'll give me nice
> >> estimate on this?
> 
> > You can analyze the "lvdisplay -v" output on your LVs in question.
> > That shows you the mapping information and therefore, if your LVs are
> > fragemented.
> 
> Will LVM include a defragment procedure?

LVM2 will at some point, in that arbitrary remappings will be
supported.  However I'm not convinced that this is a big problem, the
extents are 4M after all.

- Joe
