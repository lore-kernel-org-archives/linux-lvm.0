Return-Path: <thornber@btconnect.com>
Date: Thu, 16 Aug 2001 11:05:26 +0100
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
Message-ID: <20010816110526.A452@btconnect.com>
References: <20010815175659.A29749@sistina.com> <20010815182548.U3941@gum01m.etpnet.phys.tue.nl> <20010815185005.A32239@sistina.com> <20010815190428.A11146@athlon.random> <20010815210622.A1221@btconnect.com> <20010815152432.A27984@omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010815152432.A27984@omnifarious.org>; from hopper@omnifarious.org on Wed, Aug 15, 2001 at 03:24:32PM -0500
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Aug 15, 2001 at 03:24:32PM -0500, Eric M. Hopper wrote:
> On Wed, Aug 15, 2001 at 09:06:22PM +0100, Joe Thornber wrote:
> > 
> > From looking at the metadata I have no way of knowing which version of
> > software the PV was created with.  This is a sorry state of affairs,
> > but sadly true.  So the upgrade script does the following:
> > 
> > o interrogate the existing tools that created the PV to find where they put
> >   the PE's
> > 
> > o write this value into the new field.
> > 
> > At this point the new driver, and tools should be installed.
> 
> 	So, has the metadata also been updated to have a version number
> field in an easily found location?  This is a very unpleasant state of
> affairs, and it will happen again if you haven't done this.

The metadata has always had a version number field.  This is a single
integer field rather than a major/minor/patchlevel triplet which I
would prefer.  This field used to be set to 1, and is now set to two
since the extra field was added.  The real problem was that the
metadata format wasn't self consistent, it didn't tell you everything
you needed to know, there was 'magic' in the tools.

> 	This helps my peace of mind about doing the upgrade.  Perhaps
> now I will do it with confidence that it will work and I'll get the
> order of operations right.

Read the instructions and follow the steps carefully and you should
have no trouble.

> 
> 	One question I have:
> 
> 	Does it hurt for the old drivers to be in the kernel at the time
> you run the upgrade script if none of the VGs are 'active'?

Let's see ... I think the old drivers do need to be present, so if
necessary a dummy LV can be created on empty PV's in order to get
pvdisplay to show the location of the start PE.  Yes.

> 	I compiled LVM into my kernel instead of leaving it as a module,
> so if it were a problem, I'd have to compile a new kernel that didn't
> have the drivers.

If I were you I'd have builds of both the old and new kernel/tools
ready before you start.  

- Joe
