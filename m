Return-Path: <jweber@valinux.com>
Date: Fri, 19 Jan 2001 07:56:26 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Message-ID: <Pine.LNX.4.30.0101190750570.27286-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
Subject: [linux-lvm] Kernel panic while snapshotting.
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

Hi,

I just got a kernel panic while snapshotting with 0.9.1beta2.  I wonder if
anybody has seen any similar issues or I possibly fubar'd the patch on my
end?

Panic was:

	Kernel panic: brw_kiovec: iobuf not locked for I/O

This occured while simultanously copying 20 tarballs back and forth
between two dirs on the source volume and performing a snapshot at that
time.  It appears to have hung my lvcreate (snapshot) command shell.
Oh, this was also using loop device for the source volume on my laptop in
this case.  Hmm, actually could this panic be related to the following
change in lvm.c?  It did work prior in 0.9.1beta1.

@@ -492,7 +488,7 @@
                goto out;

        err = -ENOMEM;
-       iobuf->locked = 1;
+       iobuf->locked = 0;
        iobuf->nr_pages = 0;
        for (i = 0; i < nr_pages; i++)
        {


I haven't seen this one before myself, but in testing on our bigger scsi
based boxes in the back while snapshots are active and heavy IO is
performed on the source volume, the box tends to hang.  I gather this is
related to having to journal all source volume changes to the snapshot and
when you throw massive IO@it, things get slow. Any thoughts on this one
as well?
