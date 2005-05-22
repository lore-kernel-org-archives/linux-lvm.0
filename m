Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4MKs8O16295
	for <linux-lvm@redhat.com>; Sun, 22 May 2005 16:54:08 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4MKs2Jb021721
	for <linux-lvm@redhat.com>; Sun, 22 May 2005 16:54:02 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DZxQS-000689-O3
	for linux-lvm@redhat.com; Sun, 22 May 2005 22:51:56 +0200
Received: from pd90234a7.dip.t-dialin.net ([217.2.52.167])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 22 May 2005 22:51:56 +0200
Received: from bill.mair by pd90234a7.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 22 May 2005 22:51:56 +0200
From: Bill Mair <bill.mair@web.de>
Date: Mon, 23 May 2005 00:52:41 +0200
Message-ID: <d6qrbv$f5k$1@sea.gmane.org>
References: <d6pnof$irl$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <d6pnof$irl$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: HELP: LVM1 not starting automatically
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Bill Mair wrote:
> Hi all,
> 
> After a HD failure "mid-pvmove" no less, my LVM won't start 
> automatically :(
> 
> System: Debian sarge with LVM1.

<snip/>

Many thanks to Robot101 (Robert McQueen) for his help on IRC (irc.freenode.net
on the #lvm channel).

It back up and running now, I had to upgrade to LVM2, and it was happy with 
the situation.

Because my kernel already had device-mapper support compiled in, it wasn't a
problem to move to LVM2.

What I did (under Robert's instruction) was the following:

1) Grabbed the lvm2 package (without installing)
  apt-get -d install lvms

2) Unpacked it to access the tools
   mkdir lvm2
   cd lvm2
   dpkg -x /var/cache/apt/archives/lvm2 .... .deb

3) Rebooted to single user mode

4) cd lvm2/lib/lvm-200

** USE LOCAL LVM2 TOOLS !

5) ./vgscan

-- LVM2 found rootvg without a problem

** USE LOCAL LVM2 TOOLS !

6) ./vgchange -a y

-- LVM2 activated rootvg without a problem

7) Installed lvm2

   dpkg -i /var/cache/apt/archives/lvm2 .... .deb

8) reboot

Voila, no more LVM problems.

After that I unitsalled lvm10 and adjusted /etc/lvm/lvm.conf so that it
wasn't looking for LVM devices on the loop back interface or /dev/hd.*

Everythings working now as I wanted, so once again many thanks to
Robot101 :)

--
Bill
