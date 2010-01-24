Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0O8TgGn001416
	for <linux-lvm@redhat.com>; Sun, 24 Jan 2010 03:29:42 -0500
Received: from mailrelay1.sccon.de (mailrelay1.sccon.de [93.94.80.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0O8TQMi016890
	for <linux-lvm@redhat.com>; Sun, 24 Jan 2010 03:29:27 -0500
Received: from mailstore.cl3m.sccon.de (mailstore.cl3m.sccon.de [93.94.80.14])
	by mailrelay1.sccon.de (Postfix) with ESMTP id 46D8D88398
	for <linux-lvm@redhat.com>; Sun, 24 Jan 2010 09:29:26 +0100 (CET)
Received: from Dirks-MacBook-Pro.local ([79.208.237.140])
	(authenticated user dirk.schulz@kinzesberg.de)
	by mailstore.cl3m.sccon.de
	(using TLSv1/SSLv3 with cipher AES256-SHA (256 bits))
	for linux-lvm@redhat.com; Sun, 24 Jan 2010 09:29:23 +0100
Message-ID: <4B5C04DF.4020507@kinzesberg.de>
Date: Sun, 24 Jan 2010 09:29:19 +0100
From: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Federicos patch for clustered snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,

I am new to the list, so please bear with me.

This is from this list some 15 months ago:

> On Tue, Oct 14, 2008 at 10:12 AM, Federico Simoncelli
> <federico.simoncelli@???> wrote:
> > Looking at the LVM2 code (LVM2.2.02.40, tools/lvcreate.c:640):
> >
> > /* FIXME Allow exclusive activation. */
> > if (vg_is_clustered(vg)) {
> > log_error("Clustered snapshots are not yet supported.");
> > return 0;
> > }
> >
> > looks like there is no way to activate a snapshot in a clustered
> > volume group. Is the documentation wrong?
> > Is there anyone actively working on the "exclusive activation" FIXME
> > that is mentioned in the comment?
>
> Hi all,
> I worked a little on this issue and I came up with a working patch
> for LVM2.2.02.32.
> ...
> To be able to set the lv as exclusive you have to deactivate it on the
> other nodes with the command:
>
> # lvchange -aln /dev/vg00/lvol1
>
> and then you can create the snapshot:
>
> # lvcreate --size 100M --snapshot --name snap /dev/vg00/lvol1
> Logical volume "snap" created
>
> It automatically takes care to set the lv device as exclusive 
> (vgchange -aey).
> Can anyone review the patch? 
I would be very interested in the outcome of this patch. Has it been 
reviewed, how was the result, are there binaries/source code I could deploy?

Any hint or help would be greatly appreciated.

Dirk
