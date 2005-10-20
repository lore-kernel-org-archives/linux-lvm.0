Received: from fentible.pjc.net (vpn-4-31.stuttgart.redhat.com [10.32.4.31])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9KAhHM0005941
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 11:43:18 +0100
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1ESXtG-00007v-Hc
	for linux-lvm@redhat.com; Thu, 20 Oct 2005 11:43:18 +0100
Message-ID: <435774C4.2070304@redhat.com>
Date: Thu, 20 Oct 2005 11:43:16 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: RIF: [linux-lvm] LVM2 problems!!
References: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA526@E2KMBX20VS.intranet.tim.it>
In-Reply-To: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA526@E2KMBX20VS.intranet.tim.it>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Caligiuri, Marco Ernesto wrote:
> On this machine ... i can't use redhat cluster suite , because we use a different cluster software.... the daemon clvmd is necessary ? is necessary configure redhat cluster for work with LVM2?
> Sorry i haven't a great experience ...about this   can you explain to me in simple words...what i need for create a volume....
> thank you


I don't know what cluster software you're using but if you can't use RHCS then
you're going to have real problems running GFS and cluster LVM - they're a
package you can't plug bits of one suite into another and expect it to work.

If you want to use LVM (note NOT clustered LVM) then reset locking_type to 1 in
/etc/lvm/lvm.conf.

But it sounds like you need to sort out your clustering environment first.


patrick
