Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iB7JT7H6018471
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 19:29:07 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cbl1H-0005Tg-7o
	for linux-lvm@redhat.com; Tue, 07 Dec 2004 19:29:07 +0000
Date: Tue, 7 Dec 2004 19:29:07 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] recovering a lvm volume group after one partition's
	deletion
Message-ID: <20041207192907.GD24229@agk.surrey.redhat.com>
References: <b9a453c204120710477fb9fcf7@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a453c204120710477fb9fcf7@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Dec 07, 2004 at 07:47:57PM +0100, �scar �lvarez Vilaplana wrote:
> What I've tried is running pvcreate on the formatted partition, but
> vgdisplay complains that that it can't find the partition with the
> uuid of the lost partition. I then tried hexedit'ing the partition and
> changing its uuid, but this didn't fool lvm either: i got the same
> error.
 
man vgcfgrestore

Alasdair
-- 
agk@redhat.com
