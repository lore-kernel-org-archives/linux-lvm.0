Subject: Re: [linux-lvm] problem
From: Daniel Wittenberg <daniel-wittenberg@uiowa.edu>
In-Reply-To: <20030108223008.G28021@uk.sistina.com>
References: <1042049056.1433.29.camel@tux.its.uiowa.edu>
	 <33170000.1042057292@[192.168.200.4]>
	 <1042057991.12153.0.camel@tux.its.uiowa.edu>
	 <20030108214555.F28021@uk.sistina.com>
	 <1042064687.12147.7.camel@tux.its.uiowa.edu>
	 <20030108223008.G28021@uk.sistina.com>
Message-Id: <1042065269.12147.10.camel@tux.its.uiowa.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Jan  8 16:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

If all it needs is the dm-ioctl.h I can grab that.  This was just
turning into a "needs this one more file...one more file" sorta thing,
so didn't want to spend all night chasing files.

Thanks,
Dan

On Wed, 2003-01-08 at 16:30, Alasdair G Kergon wrote:
> On Wed, Jan 08, 2003 at 04:24:47PM -0600, Daniel Wittenberg wrote:
> > I didn't see any pre-built binaries, so I started down the source path,
> If you don't have any kernel source lying around, yes, you'll have
> to fiddle to compile device-mapper.  [It needs .h file from the
> kernel patch.]
> 
> I'll do you a version of LVM2 that can be compiled without 
> device-mapper.
> 
> Alasdair
-- 
===========================
Daniel Wittenberg
Senior Unix Admin
University of Iowa - ITS
