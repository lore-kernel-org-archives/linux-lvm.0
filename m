Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] Graphical tool for LVM?
References: <3AF91E23.163C9119@in.tum.de> <wxxzocl2vqo.fsf@gjallarhorn.ifi.uio.no> <20010510152849.B559@tykepenguin.com>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 11 May 2001 16:02:21 +0200
In-Reply-To: Patrick Caulfield's message of "Thu, 10 May 2001 15:28:49 +0100"
Message-ID: <wxxwv7o56he.fsf@fjorir.ifi.uio.no>
MIME-Version: 1.0
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

Patrick Caulfield <caulfield@sistina.com> writes:

> On Thu, May 10, 2001 at 03:12:47PM +0200, Terje Kvernes wrote:
>
> > <rant>
> > but I'm still annoyed at the PV-names in /proc/lvm/globals.
> > </rant>
> 
> OK, fixed it, you can shut up now :-)

  why thank you! :)

,----[ caulfield    2001/05/10 09:23:14 CDT ]
| Modified files:
|     kernel               lvm-fs.c 
|   Log:
|   Show much more of the PV name in /proc/lvm/global. In other words, this now
|   works with devfs: rather than just showing "disc"*(sic) or "part1" it shows the
|   whole name but without "dev".
|   
|   * I'm English and I still think that's wrong!
|   
|   Revision  Changes    Path
|   1.3       +2 -1      LVM/kernel/lvm-fs.c
`----

  that means it's time for me to rebuild again... awe... uptime vs.
  features. I want hot-swappable kernels now!

-- 
Terje
