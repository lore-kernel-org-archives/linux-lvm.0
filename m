Return-Path: <thornber@btconnect.com>
Date: Tue, 7 Aug 2001 09:58:58 +0100
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010807095857.A5053@btconnect.com>
References: <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it> <20010805234715.A30768@vestdata.no> <20010806184631.B31054@ultraviolet.org> <20010807072327.A10691@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010807072327.A10691@vestdata.no>; from lvm@ragnark.vestdata.no on Tue, Aug 07, 2001 at 07:23:27AM +0200
From: Joe Thornber <thornber@btconnect.com>
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
To: linux-lvm@sistina.com

On Tue, Aug 07, 2001 at 07:23:27AM +0200, Ragnar Kjxrstad wrote:
> On Mon, Aug 06, 2001 at 06:46:31PM -0700, Tracy R Reed wrote:
> > On Sun, Aug 05, 2001 at 11:47:16PM +0200, Ragnar Kjxrstad wrote:
> > > If I remember correctly, you configure as "multipath" not "raid1". 
> > 
> > Cool! I think I've heard about this patch once before. I will have to give
> > it a try.  Dual-pathing is something we have been wanting for a long time.
> > Do you think this patch something that is likely to one day be merged with
> > the kernel such that we can count on it being with us for a while?
> 
> I'm just speculating but I can't see why not? Except for LVM
> implementing mutlipath and making it obsolete, of course.

In my opinion multipathing should be implemented outside LVM.

- Joe
