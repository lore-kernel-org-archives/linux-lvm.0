Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9SKLKr11446
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 16:21:20 -0400
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9SKL9mC003626
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 16:21:09 -0400
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CNGlg-0007No-00
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 22:21:08 +0200
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 22:21:08 +0200
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 22:21:08 +0200
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Thu, 28 Oct 2004 21:17:11 +0200
Message-ID: <n6t752-uf2.ln1@triangulo.it.uc3m.es>
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
	<41808B37.40406@monjoin.net>
	<20041028063530.GA13279@percy.comedia.it>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Software raid on top of lvm logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Luca Berra <bluca@comedia.it> wrote:
> On Thu, Oct 28, 2004 at 08:01:27AM +0200, Eric Monjoin wrote:
> >md9 : active raid1 emcpowerd1[2] [dev e8:e1][0]
> >      42829184 blocks [2/1] [U_]
> >      [>....................]  recovery =  1.4% (630168/42829184) 
> >finish=68.1min speed=10315K/sec
> this is a problem with linux md raid. it does not support fast resync
> with a bitmap of changed sectors, there is a project to implement it,
> but it is not yet in the standard kernel.
> look on the linux-raid mailing list archives for something called 'fast
> raid 1'.

   fr1.sf.net (also fr5.sf.net may be of interest).

   and http://www.it.uc3m.es/ptb/fr1

(yes, I am the author). Those are for 2.4 kernels. A version fo fr1
for 2.6 kernels with additional ondisk bitmaps has been done by Paul
Clements, the linux nbd maintainer, and patches by him are around.

I should look them up and merge the two .. bids accepted!

> i do not believe you would have any advantage in stacking md above lvm
> anyway.

That is right. In fact it sounds downright risky to me.

Peter
