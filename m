Return-Path: <lda@winux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14995.51952.832793.443201@nv.winux.com>
Date: Wed, 21 Feb 2001 09:04:32 -0500
From: lvm@winux.com
Subject: Re: [linux-lvm] snapshot of Reiserfs
In-Reply-To: <20010221085959.C568@tykepenguin.com>
References: <20010220224907.D21281@srv.sistina.com>
	<14995.16871.694699.166774@nv.winux.com>
	<20010221085959.C568@tykepenguin.com>
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

Patrick Caulfield writes:
> From: Patrick Caulfield <caulfield@sistina.com>
> Sender: linux-lvm-admin@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] snapshot of Reiserfs
> Date: Wed, 21 Feb 2001 08:59:59 +0000
> 
> On Tue, Feb 20, 2001 at 11:19:51PM -0500, lvm@winux.com wrote:
> > Heinz J. Mauelshagen writes:
> > > ... Linux Logical Volume Manager 0.9.1 Beta 5 is available now ...
> > > ...
> > > Please help us to stabilize for 0.9.1 ASAP and test is as much as possible!
> > 
> > I am using LVM 0.9.1 beta 5 on Linux 2.4.1 with Reiserfs.
> > I have applied both of the following patches:
> > 
> > 0.9.1_beta5/PATCHES/lvm-0.9.1_beta5-2.4.1.patch
> > 0.9.1_beta5/PATCHES/linux-2.4.1-VFS-lock.patch
> > 
> > Snapshots created when the filesystem is active cannot be mounted.
> > If I `umount' the filesystem before creating the snapshot, all is well.
> 
> Did you remember to uncomment LVM_VFS_ENHANCEMENT in lvm.c ?
> 
> patrick

Bingo!  That was the problem!  Many thanks!

Shouldn't that change be included in the VFS-lock patch?

In fact, why are these separate patches?  Shouldn't they
eventually be "the standard" and find their way into the
stock kernel?  It's arguably the correct behavior.

Larry
