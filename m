From: Andrew Snare <ajs@pigpond.com>
Subject: Re: [linux-lvm] VG active, but member PV inactive
Message-ID: <20031224141622.GJ12266@nl.pigpond.com>
References: <20031223154608.GI12266@nl.pigpond.com> <1072200559.8419.13.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1072200559.8419.13.camel@gecko.indygecko.com>
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
Date: Wed Dec 24 08:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 23, 2003 at 09:29:19AM -0800, Jord Tanner wrote:
> On Tue, 2003-12-23 at 07:46, Andrew Snare wrote:
> > Hi All,
> > 
> > We've encountered a problem on a Debian server we brought into production
> > recently. Specifically, although a VG is active and in use, the (sole) PV
> > is for some reason marked as inactive. This means that tools like lvscan
> > and lvcreate do not work.
> > 
> > Configuration: single PV, with a VG. All filesystems (except from /boot)
> > are on it, including the root filesystem:
> 
> [snip]
> 
> I was the user with the problem similar to yours. The base of the issue
> was that the PV was created on a system without devfs (RedHat), then
> used on a system with devfs (Gentoo). Did you recompile your kernel to
> enable/disable devfs recently? That may be the problem.

We're using the stock Debian kernel/initrd combination. At runtime devfs
is not in use, but apparently it is temporarily used during the initrd
process. The VG itself was created using a Knoppix (non-devfs, I believe)
boot CD.

Is this a problem that can be solved using vgcfgbackup/vgcfgrestore?
While I'd have to boot off a CD of some sort to do it (since / is on the
VG and hence it can't be deactivated) I don't mind doing that if it's a
once-off.

> My solution was to patch my kernel with device-mapper, and install EMVS
> 2.2.0. EVMS has a LVM compatibility mode, and as long as I use the EVMS
> tools, the problem is of no consequence. This was on my sandbox system,
> so I could afford to fool around. I see that you have a 270G PV, which I
> would assume is in production, so I would think you have to be more
> careful. That said, I've expanded, shrank, created, and deleted
> filesystems, using JFS and EXT3 filesystem types with no trouble (other
> than that ext3 should be unmounted before modification). 

We're using a stock Debian kernel, which doesn't have EVMS. :-/ It sounds
like I may have to wait until they make a 2.6 image available which will
allow us to use devmapper instead.

Thanks for your response,

 - Andrew
