Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBCFLQBM018510
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 15:21:26 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ElpUU-00033K-4f
	for linux-lvm@redhat.com; Mon, 12 Dec 2005 15:21:26 +0000
Date: Mon, 12 Dec 2005 15:21:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Newbie of LVM
Message-ID: <20051212152126.GA25866@agk.surrey.redhat.com>
References: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
	<4399D72B.80408@mattgillen.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4399D72B.80408@mattgillen.net>
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

On Fri, Dec 09, 2005 at 02:12:43PM -0500, Matthew Gillen wrote:
> Way Loss wrote:

> > /dev/md5              153G  119G   27G  82% /www

> >     My md5 is almost full and I wanna use LVM to merge
> > my md5 with a new partition from a new hdd. I wanna
> > ask if this possible for LVM to merge 2 partition
> > together while one of them have data on it? I can't
> > suffer any data loss and want to make sure that LVM
> > works perfectly to what I want.

> You're out of luck.  You can't take an existing partition and keep the
> data yet switch it over to LVM.

See also:
  https://www.redhat.com/archives/linux-lvm/2005-October/msg00110.html

Alasdair
-- 
agk@redhat.com
