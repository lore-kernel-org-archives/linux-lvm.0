Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7RHvkdg015819
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 13:57:46 -0400
Received: from mail.esperi.org.uk (user79519@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7RHviWl027666
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 13:57:45 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k7RHvbB2016287
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 18:57:37 +0100
From: Nix <nix@esperi.org.uk>
Date: Sun, 27 Aug 2006 18:57:37 +0100
Message-ID: <87fyfirrhq.fsf@hades.wkstn.nix>
MIME-Version: 1.0
Subject: [linux-lvm] Creation of snapshots failing with `in use' errors
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

(This is with kernel 2.6.17.11, device-mapper 1.02.09, and lvm 2.02.09.)

I'm trying to create a snapshot-the-whole-visible-filesystem-tree script
to use in backup scripts, which makes readonly[1] mounts of network
filesystems and non-LVMed block devices, remounts pseudo-filesystems
(other than /dev which gets bind-mounted), re-binds bind mounts, and
creates and mounts snapshots of LVMed filesystems, before chrooting
into the resulting tree, running some command in there, and then
reversing all its work.

But the apparent asychronousness of LVM is throwing me off.

Specifically, snapshot creation randomly fails if you've recently done
another LVM command. The command might be another snapshot creation
(since they seem to be asynchronous): or it might be much simpler.  By
its very nature this script creates (or removes) about a dozen snapshots
in quick succession, first using lvs(8) to determine the size of the
original filesystem, since LVM maintains a snapshot percentage counter
but doesn't appear to expose it in the commands (at least if it does
it's not documented) and I want these snapshots to have a fixed
percentage of their source available for expansion.

Here's an example:

loki:~# lvs; lvcreate --size 600M --name snap-packages.bin-oKHOHQzu --snapshot /dev/raid/packages.bin
  LV           VG    Attr   LSize   Origin Snap%  Move Log Copy%
  music        disks -wi-ao  17.50G
  news         disks -wn-ao 912.00M
  news-bofh    disks -wn-ao   1.00G
  spam         disks -wi-ao   1.00G
  swap0        disks -wc-ao 592.00M
  swap1        disks -wc-ao 608.00M
  swap2        disks -wc-ao 608.00M
  doc          raid  -wi-ao   1.00G
  home         raid  -wi-ao   6.00G
  mirror       raid  -wi-ao   1.00G
  non-free     raid  -wi-ao   1.00G
  packages     raid  -wi-ao  20.00G
  packages.bin raid  -wi-ao   6.00G
  root         raid  -wi-ao 200.00M
  usr          raid  -wi-ao   6.00G
  var          raid  -wi-ao   1.00G
  LV raid/snap-packages.bin-oKHOHQzu in use: not deactivating
  Couldn't deactivate new snapshot.

This has not only not worked for no good reason (it's not in use! it's
brand new!) but has then proceed to leave a sort of garbage LV behind,
not marked as a snapshot but no good as anything else either:

loki:~# lvs
  LV                         VG    Attr   LSize   Origin Snap%  Move Log Copy%
  music                      disks -wi-ao  17.50G
  news                       disks -wn-ao 912.00M
  news-bofh                  disks -wn-ao   1.00G
  spam                       disks -wi-ao   1.00G
  swap0                      disks -wc-ao 592.00M
  swap1                      disks -wc-ao 608.00M
  swap2                      disks -wc-ao 608.00M
  doc                        raid  -wi-ao   1.00G
  home                       raid  -wi-ao   6.00G
  mirror                     raid  -wi-ao   1.00G
  non-free                   raid  -wi-ao   1.00G
  packages                   raid  -wi-ao  20.00G
  packages.bin               raid  -wi-ao   6.00G
  root                       raid  -wi-ao 200.00M
  snap-packages.bin-oKHOHQzu raid  -wi-a- 600.00M
  usr                        raid  -wi-ao   6.00G
  var                        raid  -wi-ao   1.00G

Is there any way I can arrange for lvcreate and lvremove to actually
*work* consistently such that I can usefully use them in scripts like
this? I'd have no objection to lvcreate/lvremove blocking until whatever
it is that's locking the VG is completed, but dying and leaving debris
behind seems a bit off.


[1] when 2.6.18 comes out so readonly mounts work

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
