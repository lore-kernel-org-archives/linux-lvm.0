Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VLB1V12959
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:11:01 -0400
Received: from gw.osk.ch (80-218-244-161.dclient.hispeed.ch [80.218.244.161])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7VLAmgC000831
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:10:59 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7VLAj001120
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:10:45 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7VLAi3Q011696
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:10:44 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7VLAiEB011692
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 23:10:44 +0200
Date: Wed, 31 Aug 2005 23:10:44 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM Solved
Message-ID: <20050831211044.GB11522@gutek>
References: <20050829200548.GB11271@gutek.swissptt.ch>
	<20050831154651.GD15141@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050831154651.GD15141@agk.surrey.redhat.com>
Reply-To: lvm@osk.ch,
	LVM general discussion and development <linux-lvm@redhat.com>
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


Thank you for your answer Alasdair.

That means my filter line should just read:

     filter = [ "r|/dev/cdrom.*|", "r|/dev/cdroms.*|" ]

which means "skip (reject) all devices matching those two regexp
and scan (allow) anything else and ir works for me.

Regards,
Chris


On Wed, Aug 31, 2005 at 04:46:51PM +0100, Alasdair G Kergon wrote:
> And only *the first* 'filter=' setting gets used - others
> are ignored.  
> 
> For now, I've added a warning to the example.conf comments.
> 
> We'll update the code to handle this better some day,
> probably by concatenating items with identical names into
> lists as we load them in.  
> 
> [If anyone wants to offer a patch, it starts with _file() 
> in lib/config/config.c: before the parser adds each new node 
> to the tree, check for a duplicate identifier within the
> same section and append/convert the entries as appropriate.]
> 
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
