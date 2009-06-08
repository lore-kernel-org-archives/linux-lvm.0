Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n58MN0Qt028147
	for <linux-lvm@redhat.com>; Mon, 8 Jun 2009 18:23:00 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1MDnF6-0002i9-68
	for linux-lvm@redhat.com; Mon, 08 Jun 2009 23:23:00 +0100
Date: Mon, 8 Jun 2009 23:23:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove or lv mirror/unmirror
Message-ID: <20090608222300.GH647@agk-dp.fab.redhat.com>
References: <d4016b450906081448i165c25aelb98a196bb53b5d38@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4016b450906081448i165c25aelb98a196bb53b5d38@mail.gmail.com>
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

pvmove should work OK, but with a large amount of data you might consider
dividing it into several smaller pvmove commands with the range syntax
  SourcePhysicalVolume[:PE[-PE]...
  /dev/xda:0-100000
to give you more checkpoints along the way.

Alasdair
