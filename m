Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0ADhYr11489
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 08:43:34 -0500
Received: from alpha.geneseo.edu (alpha.geneseo.edu [137.238.1.190])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0ADhSkp008360
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 08:43:28 -0500
Received: from [137.238.1.104] (helo=mars.geneseo.edu)
	by alpha.geneseo.edu with esmtp (Exim 4.34) id 1CnzpQ-00066S-3t
	for linux-lvm@redhat.com; Mon, 10 Jan 2005 08:43:28 -0500
Received: from mars.geneseo.edu (localhost.localdomain [127.0.0.1])
	by mars.geneseo.edu (8.12.9/8.12.5) with ESMTP id j0ADhORh031014
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 08:43:24 -0500
Received: from localhost (valites@localhost)
	by mars.geneseo.edu (8.12.9/8.12.9/Submit) with ESMTP id j0ADhOYR031011
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 08:43:24 -0500
Date: Mon, 10 Jan 2005 08:43:24 -0500 (EST)
From: "Mark T. Valites" <valites@geneseo.edu>
Subject: Re: [linux-lvm] Problem Upgrading from LVM1 to LVM2
In-Reply-To: <20050109210423.GB24979@percy.comedia.it>
Message-ID: <Pine.LNX.4.44.0501100838210.30140-100000@mars.geneseo.edu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 9 Jan 2005, Luca Berra wrote:

> On Sun, Jan 09, 2005 at 01:51:17PM -0500, Mark T. Valites wrote:
> >I'd like to upgrade my LVM1 based machine to LVM2. I recently compiled a
> >new 2.4.28 kernel and patched in the
> >linux-2.4.26-rc1-devmapper-ioctl.patch patch from;
> >
> >ftp://sources.redhat.com/pub/dm/patches/2.4-stable/2.4.26/linux-2.4.26-rc1-devmapper-ioctl.patch
> >
> >A copy of my kernel config is available here:
> >
> >http://www.geneseo.edu/~valites/config-2.4.28-x86_mythtv-dev_mapper
> >
> use only one of lvm1 or device-mapper.

Hmm. Taking LVM1 one support out of my kernel (# CONFIG_BLK_DEV_LVM is not
set) didn't seem to help. I still get:

myth:~# pvscan
  logical extent (56202) already mapped.
  Couldn't fill logical volume maps.
  No matching physical volumes found
myth:~# vgscan
  Reading all physical volumes.  This may take a while...
  logical extent (56202) already mapped.
  Couldn't fill logical volume maps.
  Volume group "music_vg" not found

And of course the LVM1 tools don't work now. Any ideas?

-- 
Mark T. Valites
Unix Systems Analyst
Computing & Information Technology
SUNY Geneseo
>--))> >--))>
