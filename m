Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0BEOBxg001247
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 14:24:11 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CoMwN-0006r8-C6
	for linux-lvm@redhat.com; Tue, 11 Jan 2005 14:24:11 +0000
Date: Tue, 11 Jan 2005 14:24:11 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] strange logical volume issue
Message-ID: <20050111142411.GU26670@agk.surrey.redhat.com>
References: <20050110234240.749ebab3@eric.placeverte.home>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050110234240.749ebab3@eric.placeverte.home>
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

On Mon, Jan 10, 2005 at 11:42:40PM +0100, messmate wrote:
> there is somewhat strange with a lv of mine: lv_usr-local.
> Marked as /dev/mapper/vg1_hda1-lv_usr--local    and
> as /dev/vg1_hda/lv_usr-local  !
 
> See the (-) differences.

A hyphen in the name in /dev/mapper separates the volume
group name from the logical volume name.

If you put hyphens in either of those names they
get quoted by doubling them up.

Alasdair
-- 
agk@redhat.com
