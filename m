Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iB7JwJH6020181
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 19:58:19 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CblTX-0005UL-1L
	for linux-lvm@redhat.com; Tue, 07 Dec 2004 19:58:19 +0000
Date: Tue, 7 Dec 2004 19:58:18 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] recovering a lvm volume group after one partition's
	deletion
Message-ID: <20041207195818.GE24229@agk.surrey.redhat.com>
References: <b9a453c204120710477fb9fcf7@mail.gmail.com>
	<20041207192907.GD24229@agk.surrey.redhat.com>
	<b9a453c204120711564bb852b0@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a453c204120711564bb852b0@mail.gmail.com>
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

On Tue, Dec 07, 2004 at 08:56:14PM +0100, �scar �lvarez Vilaplana wrote:
> Now the logical volumes appear in /dev/mygroup/, but when I try to
> mount them I get the error "mount: special device /mount/mygroup/myvol
> does not exist"

vgmknodes

lvchange -ay
 
Alasdair
-- 
agk@redhat.com
