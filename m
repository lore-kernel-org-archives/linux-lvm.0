Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBEE0w2R030604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 09:00:59 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1NKBTu-0003sw-56
	for linux-lvm@redhat.com; Mon, 14 Dec 2009 14:00:58 +0000
Date: Mon, 14 Dec 2009 14:00:58 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate does not respect units?
Message-ID: <20091214140057.GA14009@agk-dp.fab.redhat.com>
References: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
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

On Mon, Dec 14, 2009 at 02:45:21PM +0100, Thomas Voegtle wrote:
> vgdisplay  Free  PE / Size       6127 / 25.70 GB

> root@(none):~# lvcreate -L 25.50g datavolume -n datavolume
> lvcreate  Insufficient free extents (6127) in volume group datavolume:  
> 6528 required

> So it seems lvcreate does not respect the unit in power of 1000?

Use either:
   lvcreate -l 6127
or
   lvcreate -l 100%FREE

Alasdair
