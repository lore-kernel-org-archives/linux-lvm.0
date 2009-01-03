Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n03ISqJi018855
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 13:28:52 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LJBEy-0005Mt-FE
	for linux-lvm@redhat.com; Sat, 03 Jan 2009 18:28:52 +0000
Date: Sat, 3 Jan 2009 18:28:52 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM mapper and device names
Message-ID: <20090103182852.GG11060@agk.fab.redhat.com>
References: <b08d3e870901030855i7d8f7d25x4dee43a6fc93a397@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b08d3e870901030855i7d8f7d25x4dee43a6fc93a397@mail.gmail.com>
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

On Sat, Jan 03, 2009 at 05:55:37PM +0100, Markus Baertschi wrote:
> /dev/mapper/datavg-work on /work type jfs (rw)
 
> When I now have a mounted filesystem, how can I
> determine reliably which is the original lv I've used ?

lvs -o vg_name,name /dev/mapper/datavg-work

Alasdair
-- 
agk@redhat.com
