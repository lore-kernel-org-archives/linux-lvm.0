Return-Path: <jsissom@indiana.edu>
Date: Tue, 27 Mar 2001 11:01:50 -0500 (EST)
From: Jay Sissom <jsissom@indiana.edu>
Subject: Re: [linux-lvm] safe to ru-run vgscan after mounting LV root?
In-Reply-To: <20010327161517.G993@tykepenguin.com>
Message-ID: <Pine.LNX.4.30.0103271059250.25693-100000@bongo.fms.indiana.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Just a warning.  When I run vgscan on my system, it deletes my LV.  I
still don't know why.  There seems to be a terrible bug in vgscan.

Be careful if you run it.  You might have to do a vgcfgrestore to get your
LV's back.

I am using the beta6 code, so I don't have old code.

Jay

On Tue, 27 Mar 2001, Patrick Caulfield wrote:

> On Wed, Mar 28, 2001 at 02:14:21AM +1200, Mark van Walraven wrote:
> > Hi All,
> >
> > First, let me say how impressed I am with LVM.  I've just set up a 2.4.2
> > system with all filesystems in logical volumes, on an MD mirror.  I am
> > an experienced (i.e., "jaded") sysadmin, so please take my enthusiasm
> > as a truly singular occurrence.  Kudos to you.
> >
> > Now for my question: The system above runs vgscan (and vgchange) from an
> > initrd before mounting the root filesystem.  After that, the /etc/lvmtab*
> > files and directories need to be refreshed from the initrd.  Instead of
> > keeping the initrd hanging around until then, could vgscan simply be
> > run again to recreate /etc/lvmtab*, even though PVs and LVs are active?
>
> You can run vgscan as many times as you like. The main reason you wouldn't is
> the time it can take. But even that is small compared to the initialisation time
> of most SCSI cards so at bootup it shouldn't be a problem.
>
> patrick
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
