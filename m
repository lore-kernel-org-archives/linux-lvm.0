Return-Path: <list@showme.wox.org>
Message-ID: <004701c0ad06$0ba5d400$0f01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
References: <005801c0ac4b$a781cc00$0f01a8c0@myplace.net> <200103132137.f2DLb6o05452@webber.adilger.int> <20010314163701.F14172@sistina.com>
Subject: Re: [linux-lvm] Changing device numbers.
Date: Wed, 14 Mar 2001 20:11:44 -0800
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

----- Original Message -----
From: Heinz J. Mauelshagen <Mauelshagen@sistina.com>
To: <linux-lvm@sistina.com>
Sent: woensdag 14 maart 2001 8:37
Subject: Re: [linux-lvm] Changing device numbers.


> On Tue, Mar 13, 2001 at 02:37:06PM -0700, Andreas Dilger wrote:
> > Bas writes:
> > > Rerunning lilo seemed to work, but I had the same problem just a while
ago
> > > without changing anything but adding a LV.
> >
> > Maybe because you are running "vgscan" on each boot?  It is not really
> > needed by LVM unless the disk configuration changes.  When you run it,
> > there is the possibility of the VG and LV devices changing major
numbers.
> >
> > Even so, it is a problem (IMHO) that LVM likes to delete all of the
> > device files each time vgscan is run.  The correct thing to do would
> > be to have "pvscan" create a file of UUID->disk mappings on each boot,
> > and leave the LVM devices alone.  Then vgscan would only be needed if
> > there is a major disaster.
>
> Andreas, we are planning for something very similar to this, because we
need
> it for Cluster-LVM anyway: the driver will do the scanning and keep
> the mapping list which can be requested by the tools later.
>

That looks good. How are minor numbers assigned now ? By LE (1st LE means
device number 58,0) ?
