Return-Path: <root@srv.sistina.com>
Date: Tue, 13 Mar 2001 13:25:10 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [OT] Re: [linux-lvm] *** ANNOUNCEMENT ***  LVM 0.9.1 Beta 6  available at www.sistina.com
Message-ID: <20010313132510.C11305@sistina.com>
References: <20010313012136.A10157@sistina.com> <Pine.LNX.4.21.0103131227130.28428-100000@www.scotty.co.at>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0103131227130.28428-100000@www.scotty.co.at>; from fl@fl.priv.at on Tue, Mar 13, 2001 at 12:31:21PM +0100
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

On Tue, Mar 13, 2001 at 12:31:21PM +0100, Friedrich Lobenstock wrote:
> On Tue, 13 Mar 2001, Heinz J. Mauelshagen wrote:
> 
> > See the CHANGELOG file contained in the tarball for further information.
> 
> Despite the CHANGELOG is in the tarball, could you please
> post its content to this list. 

Sure, I will.

> 
> I think a lot of people who are watching this list like me,
> don't want to test every beta release but would like to know
> what's going on.

Here  it is:

<BEGIN Logical Volume Manager Changelog>

Changelog for 0.9.1_beta5 to 0.9.1_beta6
----------------------------------------

LVM
---

o **IMPORTANT** IOP version has moved back to 10, make sure tools and
kernel driver are both upgraded to beta6, if you are running beta5.

Driver
------

o Fixes to get LVM working on UltraSPARC boxes.  Note this requires an
  additional kernel patch.

o Fixed bug in lvm_do_lvcreate() in order to avoid invalid accesses
  to user space addresses in vg->lv[]

o factored lvm_get_snapshot_use_rate out of blk_ioctl

o introduced the P_DEV macro and changed some internal functions to be static

o Added VG_CREATE_OLD ioctl for IOP 10 compatibility

o Reverted IOP back to 10

o lvextend/reduce was stamping over the snapshot semaphore causing an oops.
  This fixes the reiserfs + lvextend problem reported on the mailing list

o status that a snapshot was dropped is now stored on disk in order to be
  restored correctly by vgchange

o new lvm-release.h include reflecting the version

o lvm locking is now fixed

o bmap IOCTL changes for LILO support

Tools
-----

o pvdata -U now works

o lvdisplay on an original LV no lists the active/inactive status per snapshot

o lvscan now shows the target for a snapshot LV

o vgchange now informs the administrator about dropped snapshots and restores
  them correctly in order to be able to lvremove them


Library
-------

o -fPIC flag now used when building shared libs.

Install
-------

<END Logical Volume Manager Changelog>

> 
> 
> Regards
> Friedrich Lobenstock
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
