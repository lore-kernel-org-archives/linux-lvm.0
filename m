From: Eike Kowallik <E.Kowallik@tu-bs.de>
Subject: dd and raw devices with lvm  [was:  Re: [linux-lvm] LVM hang with some uses of raw i/o]
Message-ID: <20020703193224.D999@portatile.milano.dt>
References: <3D19F9A0.9FBA6B7E@funsoft.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D19F9A0.9FBA6B7E@funsoft.com>; from eheman@funsoft.com on Wed, Jun 26, 2002 at 01:28:00PM -0400
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
Date: Wed Jul  3 11:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Eike Kowallik <E.Kowallik@tu-bs.de>

Hello!

On Wed, Jun 26, 2002 at 01:28:00PM -0400, Gary Eheman wrote:

> utilities (I think), though I also see that dd is not supposed to be used
> against raw devices in the man pages.  The author of our utility is well aware
> of the need to align the buffers, and the same code does work on other raw
> devices on other LVM linux systems I have put together.

I waited some days, but nobody wrote something about dd and raw
devices...

I read the dd man pages on two Linux Systems - and the newest
one from the fileutils Version 4.1:
http://www.gnu.org/directory/All_GNU_Packages/fileutils.html
But I couldn't find any note about (problems with) raw devices.

Grey, would you give me a hint? Anybody else? I'm asking here
because I used dd to find out more about my problems with
lvm and raw devices (for Oracle RAC):
http://lists.sistina.com/pipermail/linux-lvm/2002-June/011737.html

Thanks in advance, Eike
