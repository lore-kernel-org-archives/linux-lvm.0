Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 19 Mar 2001 13:30:55 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Kernel 2.4.x with LVM beta 6 on Sun E450?
Message-ID: <20010319133055.B569@tykepenguin.com>
References: <20010318125600.A24084@mercury.mercury.multiweb.nl> <3AB51A73.8D931205@wrkhors.com> <20010318222501.A30232@mercury.mercury.multiweb.nl> <3AB528E0.D6BA04C8@wrkhors.com> <20010318232831.A30928@mercury.mercury.multiweb.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010318232831.A30928@mercury.mercury.multiweb.nl>; from dave@xs4all.nl on Sun, Mar 18, 2001 at 11:28:31PM +0100
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

On Sun, Mar 18, 2001 at 11:28:31PM +0100, Dave Wapstra wrote:
> On 18 March, 2001 at 15:30:08 -0600, Steven Lembark <lembark@wrkhors.com> wrote:
> > 
> > > Thanks, but this is a non-X box. It is probably worth trying to use the
> > > .config of -pre3 with 2.4.2 and use the beta6 plus ioctl patches to try
> > > and get this thing to compile correctly.
> > > 
> > > I'll just give that a try...
> > 
> > or just "make config".  takes a while but doesn't depend on any
> > fancy display system.
> 
> Did that indeed. I copied the .config from -pre3 and used the good old
> "make config" and the enter key ;)
> 
> I got the ioctl32 patch once again via the web mail-archive and did a
> "s/       /^V<tab>/g" to get a correct format.

You can get the file from Dave Miller's CVS tree at  
:pserver:cvs@vger.samba.org:/vger

Or I'll post the whole file here if anyone really needs it - it doesn't change
much!

That patch was created against Dave's tree (so he could integrate it) rather
than the Linus kernels - that might have made a difference but I don't think so.

patrick
