Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8PGoKin018269
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 17:50:20 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CBFka-0008E6-CU
	for linux-lvm@redhat.com; Sat, 25 Sep 2004 17:50:20 +0100
Date: Sat, 25 Sep 2004 17:50:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] which files, which physical volumes?
Message-ID: <20040925165020.GN11810@agk.surrey.redhat.com>
References: <4153BF33.6030008@myself.gen.nz>
	<CB8795BC-0F0E-11D9-AF91-000A95730E92@spamaps.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CB8795BC-0F0E-11D9-AF91-000A95730E92@spamaps.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 25, 2004 at 09:20:20AM -0700, Clint Byrum wrote:
> Yours seems to be telling you that you can't move 1292 physical extents 
> into 780. You'll have to add physical volumes (NFS mounted loopback? 
> External USB harddrive?), or remove other logical volumes.
 
Or break the 1292 up into smaller parts if there *is* already room 
elsewhere: the allocation routines don't do this for you yet.

e.g. pvmove /dev/hda:1000-1779 
to move a specific 780 extents off hda.

[I suggest using version 2.00.24 is best for pvmove]

Alasdair
-- 
agk@redhat.com
