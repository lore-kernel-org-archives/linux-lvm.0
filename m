From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
Message-ID: <20021022131949.GE1154@tykepenguin.com>
References: <3DB3BDA4.75B552B6@silicide.dk> <20021021151240.GG838@tykepenguin.com> <3DB537AB.642A6854@silicide.dk> <20021022114410.GC1154@tykepenguin.com> <3DB54B39.64208BCC@silicide.dk> <20021022130353.GD1154@tykepenguin.com> <3DB54EA9.DFBA3D97@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DB54EA9.DFBA3D97@silicide.dk>
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
Date: Tue Oct 22 08:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 22, 2002 at 03:12:09PM +0200, Jon Bendtsen wrote:
> Patrick Caulfield wrote:
> > 
> > On Tue, Oct 22, 2002 at 02:57:29PM +0200, Jon Bendtsen wrote:
> 
> 
> [cut]
> 
> 
> > > i think it was the debian packages, because it stopped after removing
> > > the
> > > debian packages and make;make install
> > > the lvm-1.1-rc2
> > 
> > Seems unlikely - I'm the maintainer of the Debian packages and I can state
> > categorically that they don't issue that ioctl :-)
> 
> well, it works now. I did try with another lvm 1.1-rc? maybe thats why?

Could easily be. My guess is that the Debian symlinks got overwritten with
something else so the actual Debian ones (which live in /lib/lvm-10) were not
being called at all.

-- 

patrick
