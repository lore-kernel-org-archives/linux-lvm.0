Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 21 Feb 2001 16:12:17 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <20010221161217.A911@tykepenguin.com>
References: <20010221141119.I568@tykepenguin.com> <2090960000.982769673@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2090960000.982769673@tiny>; from mason@suse.com on Wed, Feb 21, 2001 at 10:34:33AM -0500
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

On Wed, Feb 21, 2001 at 10:34:33AM -0500, Chris Mason wrote:
> 
> 
> On Wednesday, February 21, 2001 02:11:20 PM +0000 Patrick Caulfield
> <caulfield@sistina.com> wrote:
> 
> [ non-intuitive snapshot patches for reiserfs ]
> >  
> >> In fact, why are these separate patches?  Shouldn't they
> >> eventually be "the standard" and find their way into the
> >> stock kernel?  It's arguably the correct behavior.
> > 
> > That is the intension. The patch is Chris Mason's and I beleive
> > he is trying to get it into the kernel. Heinz emailed him about
> > it recently, I don't know if he has had any reply yet.
> > 
> 
> We can probably talk Alan into putting it in the ac series, but I'm not
> expecting Linus to take it yet.  I'll send it along for 2.4.3preX though
> (once 2.4.2 comes out), maybe we'll get lucky ;-)

That sounds reasonable. With reiserfs and LVM in the kerel I thing there's a
good argument for making them work well together. :-)

 
> Do you want the patch I send to turn on the VFS_ENHANCEMENT #define in
> lvm.c?

I suppose it would be the easiest thing for users. Now LVM 0.9 is part of the
standard kernel it means the patches can be applied in any order, which was my
initial concern.


patrick
