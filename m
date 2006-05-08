Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k48MJFIx002187
	for <linux-lvm@redhat.com>; Mon, 8 May 2006 18:19:15 -0400
Received: from batmobile.robinbowes.com
	(84-51-160-76.pambow882.adsl.metronet.co.uk [84.51.160.76])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k48MJDd8023507
	for <linux-lvm@redhat.com>; Mon, 8 May 2006 18:19:14 -0400
Message-ID: <445FC3D8.3000406@robinbowes.com>
Date: Mon, 08 May 2006 23:19:04 +0100
From: Robin Bowes <robin-lists@robinbowes.com>
MIME-Version: 1.0
References: <01b701c66dcb$5176d9d0$0101000a@jack>
In-Reply-To: <01b701c66dcb$5176d9d0$0101000a@jack>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Snapshot segfaults lvremove + bug kernel
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
To: linux-lvm@redhat.com

Gabriel Barazer wrote:
> > Hello,
> >
> > I recently posted a LVM freeze while deleting snapshot, which could
> > be workaround-ed by issuing a dmsetup resume command.
> >
> > I was replied on the list that my tools weren't up to date (i had the
> > stable versions, the up to date are devel), so I retried the whole
> > thing (adding/deleting snapshot) with the new tools
> >
> > Versions are :
> > Kernel 2.6.16.1
> > LVM 2.02.05
> > Livdevmapper 1.02.05
> > Driver 4.5.0
> >
> > The lvcreate has been successfully created , but the lvremove after
> > gave me a segfault. Then the whole LVM system froze. After
> > hard-rebooting, the snapshot is still here. Anyone got the same , or
> > found a solution ?

I'm seeing a similar thing.

I've just started using snapshots as part of my backup process. I create
a snapshot, mount it, and take the backup from the snapshot then umount
and lvremove the snapshot when the backup has finished.

This seemed to be working but the server hung and required rebooting.
Now when I try and use lvremove to remove the snapshots the server hangs.

This is the output of lvs:

  LV           VG         Attr   LSize   Origin  Snap%  Move Copy%
  lv_home      VolGroup00 owi-ao   5.00G
  lv_home.snap VolGroup00 swi-a- 512.00M lv_home   5.35
  lv_root      VolGroup00 owi-ao   1.00G
  lv_root.snap VolGroup00 swi-a- 512.00M lv_root   9.14
  lv_scratch   VolGroup00 -wi-ao  50.00G
  lv_swap_01   VolGroup00 -wi-ao   4.00G
  lv_usr       VolGroup00 owi-ao   5.00G
  lv_usr.snap  VolGroup00 swi-a- 512.00M lv_usr    5.86
  lv_var       VolGroup00 owi-ao  54.09G
  lv_var.snap  VolGroup00 swi-a- 512.00M lv_var   40.77

This is on an x86_64 Fedora Core 4 system:

  Kernel:          kernel-2.6.16-1.2096_FC4
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.02 (2005-05-17)
  Driver version:  4.5.0

Any idea what might be causing this?

Any idea how to clean up the system, i.e. remove the
snapshots?

R.
