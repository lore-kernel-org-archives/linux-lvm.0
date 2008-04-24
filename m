Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3O4AdBO007964
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 00:10:39 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.180])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3O4AMdM011537
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 00:10:22 -0400
Received: by py-out-1112.google.com with SMTP id a29so3501836pyi.0
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 21:10:22 -0700 (PDT)
Message-ID: <a71bd89a0804232110o28f37e17j486315d745ae7724@mail.gmail.com>
Date: Wed, 23 Apr 2008 21:10:21 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Snapshot question... [scaling problem]
In-Reply-To: <1209009445.11656.97.camel@corn.betterworld.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
	<1209009445.11656.97.camel@corn.betterworld.us>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 23, 2008 at 8:57 PM, Ross Boylan <ross@biostat.ucsf.edu> wrote:
>  > > but
>  > > when you write to it, the system makes sure that unless it has
>  > > been done already, the block you're modifying are being copied
>  > > first from the "real" volume to COW volume before being modified
>  > > in the "real" volume.
>  >
>  > And to be clear, the COW volumes of _all_ snapshots[1].  This is where
>  > the snapshot scaling problem arises.
>  Could someone say a bit more, because I definitely don't follow this.

If you have a single original volume, and you keep ten snapshots
of it, and then you write a block to the original volume, you
may end up needing to write eleven blocks.  Ouch!

Thus the write overhead of LVM snapshots scales poorly with the
number of snapshots per volume.

Note that LVM snapshots scale well with the number of volumes,
but that's not interesting or surprising, as each volume is independent.
- Dan
