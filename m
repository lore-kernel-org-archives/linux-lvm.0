Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBU2RLkw007806
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 21:27:22 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBU2RKRt004495
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 21:27:20 -0500
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by mps1.wohnheimg.uni-frankfurt.de via ESMTP (Exim)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1VxSZb-0001HE-Pj
	for linux-lvm@redhat.com; Mon, 30 Dec 2013 03:27:19 +0100
Message-ID: <7d3b0b3660c7f0d8a6307d7a0bf513e5.squirrel@ssl.verfeiert.org>
In-Reply-To: <20131230015554.GA16777@agk-dp.fab.redhat.com>
References: <52C0C51C.7060806@gmail.com>
	<0930dbad0e746334315c5203d1b67457.squirrel@ssl.verfeiert.org>
	<20131230015554.GA16777@agk-dp.fab.redhat.com>
Date: Mon, 30 Dec 2013 03:27:19 +0100
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove is not deleting the file system
Reply-To: sven@whgl.uni-frankfurt.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Mon, December 30, 2013 02:55, Alasdair G Kergon wrote:
> On Mon, Dec 30, 2013 at 02:46:45AM +0100, Sven Eschenberg wrote:
>> Think of this, once you delete a partition table and recreate it with
>> the
>> same layout, all filesystems will be available, if the drive was not
>> touched in any way.
>
> Although lvcreate has a --zero option enabled by default that wipes
> the beginning of the new device (and the next upstream release extends
> this to wipe more signatures using libblkid).

Forgot about that. Then again my documentation says zero wipes the first
KB, which does not really catch BTRFS sigs (which the OP uses) nor various
mdraid signatures.

I honestly hope the libblkid dependency will be optional ;-).

>
> You need to investigate precisely how your version of 'xen-create-image'
> is
> using LVM and with which options.

The actual OP, you meant. As you noted in your other post wipefs can come
in handy. Additionally blkid and lsblk are two things that come in handy,
to see what is going on.
>
> Alasdair
>

-Sven
