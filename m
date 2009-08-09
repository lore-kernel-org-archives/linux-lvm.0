Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n79NavoX005780
	for <linux-lvm@redhat.com>; Sun, 9 Aug 2009 19:36:58 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1MaHwf-0001qJ-N1
	for linux-lvm@redhat.com; Mon, 10 Aug 2009 00:36:57 +0100
Date: Mon, 10 Aug 2009 00:36:57 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] can't remove snapshots
Message-ID: <20090809233657.GA7033@agk-dp.fab.redhat.com>
References: <4A7F5C5C.3020601@server-speed.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A7F5C5C.3020601@server-speed.net>
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

On Mon, Aug 10, 2009 at 01:31:40AM +0200, Florian Pritz wrote:
> lsof/fuser don't show anything and it's not mounted. This happens if
> roughly 50% of the cases and after that the creation of snapshots

Then check your udev rules - wouldn't be the first time udev
tried to use a device lvm wanted to remove...

[Quick test is to stop udev processing events temporarily and see if the
problem disappears.]

Alasdair
