Subject: Re: [linux-lvm] Differences between LVM1 and LVM2
Message-ID: <20021121114003.GA3069@reti>
References: <3DDA963B.7080309@crepido.com> <20021121120126.C8329@sistina.com> <878yznyxot.fsf@puck.erasmus.jurri.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878yznyxot.fsf@puck.erasmus.jurri.net>
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
Date: Thu Nov 21 05:40:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 21, 2002 at 01:22:26PM +0200, Samuli Suonpaa wrote:
> between DM and LVM2 or how I should set up my system. Something
> similar to LVM-HOWTO, I mean.

DM is the kernel driver, LVM2 is a userland application that uses DM
to set up the volumes.

> Should I do most things just like I'm used to with LVM tools
> (pvcreate, vgcreate, lvcreate and then just mount) or should I use
> dmsetup for something - and for what?

You don't need dmsetup - think of dmsetup as an alternate (and very
simple) volume manager that uses DM.

> My laptop and my home-server are both running Debian Testing. Packages
> lvm2-1.95.10-2 andf dmsetup-0.96.04-2 and libdevmapper0-0.96.04-2 are
> available, both packaged by Andres Solomon. I guess I'd have to
> install these? Will these work with - for instance - kernels
> 2.4.20-rc1-ac4 and 2.5.47-ac6 or should I patch my kernels?

The packages you mention should work with those two kernels.

- Joe
