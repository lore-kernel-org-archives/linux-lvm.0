Return-Path: <jweber@valinux.com>
Date: Fri, 19 Jan 2001 08:56:54 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] Kernel panic while snapshotting.
In-Reply-To: <Pine.LNX.4.30.0101190750570.27286-100000@beefcake.hdqt.valinux.com>
Message-ID: <Pine.LNX.4.30.0101190855320.28293-100000@beefcake.hdqt.valinux.com>
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

This was on 2.2.18 based kernel it includes several (and I mean several)
other patches as well in this case.  I just reproduced the problem without
the IO in the background and I'm thinking the removal of LockPage or the
iobuf->locked=0 bit is whats causing this.  I'll report back shortly with
some more results.

On Fri, 19 Jan 2001, Jay Weber wrote:

> Date: Fri, 19 Jan 2001 07:56:26 -0800 (PST)
> From: Jay Weber <jweber@valinux.com>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Kernel panic while snapshotting.
>
> Hi,
>
> I just got a kernel panic while snapshotting with 0.9.1beta2.  I wonder if
> anybody has seen any similar issues or I possibly fubar'd the patch on my
> end?
>
> Panic was:
>
> 	Kernel panic: brw_kiovec: iobuf not locked for I/O
>
> This occured while simultanously copying 20 tarballs back and forth
> between two dirs on the source volume and performing a snapshot at that
> time.  It appears to have hung my lvcreate (snapshot) command shell.
> Oh, this was also using loop device for the source volume on my laptop in
> this case.  Hmm, actually could this panic be related to the following
> change in lvm.c?  It did work prior in 0.9.1beta1.
>
> @@ -492,7 +488,7 @@
>                 goto out;
>
>         err = -ENOMEM;
> -       iobuf->locked = 1;
> +       iobuf->locked = 0;
>         iobuf->nr_pages = 0;
>         for (i = 0; i < nr_pages; i++)
>         {
>
>
> I haven't seen this one before myself, but in testing on our bigger scsi
> based boxes in the back while snapshots are active and heavy IO is
> performed on the source volume, the box tends to hang.  I gather this is
> related to having to journal all source volume changes to the snapshot and
> when you throw massive IO at it, things get slow. Any thoughts on this one
> as well?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
