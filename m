Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5SElU3N007423
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 15:47:30 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DnHN4-0000GS-S7
	for linux-lvm@redhat.com; Tue, 28 Jun 2005 15:47:30 +0100
Date: Tue, 28 Jun 2005 15:47:30 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Export an LV?
Message-ID: <20050628144730.GL27078@agk.surrey.redhat.com>
References: <20050627235904.GA16989@ofb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050627235904.GA16989@ofb.net>
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

On Mon, Jun 27, 2005 at 04:59:04PM -0700, Jason Heiss wrote:
> Now I'd like to find out if there is a right way
> to move an LV to another machine.  As before I've got a VG with two
> LVs.  One LV is on one physical drive, the other LV is spread over two
> drives.  I'd like to move the second LV to another system.  

(pvmove + ) vgsplit + vgexport + vgimport ?

Alasdair
-- 
agk@redhat.com
