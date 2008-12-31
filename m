Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBV91uVk032161
	for <linux-lvm@redhat.com>; Wed, 31 Dec 2008 04:01:56 -0500
Received: from mail.muc.de (colin.muc.de [193.149.48.1])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBV919SN025666
	for <linux-lvm@redhat.com>; Wed, 31 Dec 2008 04:01:09 -0500
Date: Wed, 31 Dec 2008 09:31:16 +0100
From: Harald Milz <hm@seneca.muc.de>
Subject: Re: [linux-lvm] Re: Convert a non-striped LV to a striped LV without
	data loss?
Message-ID: <20081231083116.GA1265@seneca.muc.de>
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
	<8c87cb5a0812301014w6b3f92c9p33e1a6d2699edb4d@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c87cb5a0812301014w6b3f92c9p33e1a6d2699edb4d@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Dec 30, 2008 at 01:14:26PM -0500, Doug Eubanks wrote:
> Would it be possible to extend the linear lv onto a striped lv area, move
> the data to the new extents and then remove the old lv area using lvreduce
> perhaps?

Oh, that. Yes, perfectly. Add the new PVs to the VG using vgextend, then
create whatever LV layout you need on the new PVs (lvcreate ... -i ... PV),
mkfs, then copy the data to the new filesystems, rearrange mountpoints,
then vgreduce the old PV from the VG.  Done. But not on-line... you can
move LVs to another PV within a VG, but you can't convert a normal LV to a
striped one. 

-- 
Die, v.:
	To stop sinning suddenly.
		-- Elbert Hubbard
