Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBUJ2HSG022958
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:02:17 -0500
Received: from mail.muc.de (colin.muc.de [193.149.48.1])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBUJ1FtH004500
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:01:36 -0500
Date: Tue, 30 Dec 2008 19:52:11 +0100
From: Harald Milz <hm@seneca.muc.de>
Subject: Re: [linux-lvm] Convert a non-striped LV to a striped LV without data
	loss?
Message-ID: <20081230185211.GB27523@seneca.muc.de>
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
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

On Mon, Dec 29, 2008 at 09:54:20PM -0500, Doug Eubanks wrote:
> Is it possible to convert a logical volume that's only on one physical
> volume to a striped logical volume without data loss, and preferably online?

No - only by copying data to a temp space before. But why would you want to
stripe an LV on a single PV? Burn spare CPU cycles and stress the disk?


-- 
The trouble with superheros is what to do between phone booths.
		-- Ken Kesey
