Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j04JnX0a014516
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 19:49:33 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ClugP-0003Tv-1P
	for linux-lvm@redhat.com; Tue, 04 Jan 2005 19:49:33 +0000
Date: Tue, 4 Jan 2005 19:49:33 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] mount my lv with write permisions locks up OS
Message-ID: <20050104194932.GD26670@agk.surrey.redhat.com>
References: <41D00FDB.20000@speakeasy.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41D00FDB.20000@speakeasy.net>
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

On Mon, Dec 27, 2004 at 08:36:27AM -0500, Richard S. Bunke wrote:
> If I try to 
> mount it with write access it locks up the whole OS -- no errors.
 
> here is the setup:
> lvm2
> 2.6.9 kernel on Gentoo

Which lvm2 version?
It's only worth investigating if you can reproduce it with at least 
lvm2 2.00.25 (preferably 2.00.32) and a recent kernel (eg 2.6.10).

Alasdair
-- 
agk@redhat.com
