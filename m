Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9GD9TQY010549
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 14:09:29 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIoJN-0002Fa-Fw
	for linux-lvm@redhat.com; Sat, 16 Oct 2004 14:09:29 +0100
Date: Sat, 16 Oct 2004 14:09:29 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "Cannot allocate memory" creating VGDA
Message-ID: <20041016130929.GH24242@agk.surrey.redhat.com>
References: <20041016110547.Q27758@sphinx.mythic-beasts.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041016110547.Q27758@sphinx.mythic-beasts.com>
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

On Sat, Oct 16, 2004 at 11:05:47AM +0100, Paul Warren wrote:
> lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
> "/dev/mainvg/rootsnapshot" in kernel

> Any ideas on this one?
 
Ensure the LVM1 part of your kernel is fully patched (there
was a memory over-allocation bug IIRC, but I forget the details).
Try using larger chunk sizes.

Alasdair
-- 
agk@redhat.com
