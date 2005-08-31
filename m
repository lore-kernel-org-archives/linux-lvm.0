Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VLVLV20890
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:31:21 -0400
Received: from gw.osk.ch (80-218-244-161.dclient.hispeed.ch [80.218.244.161])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7VLVJgB009348
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:31:20 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7VLVJ001326
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:31:19 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7VLVJIR011755
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:31:19 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7VLVJdn011751
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 23:31:19 +0200
Date: Wed, 31 Aug 2005 23:31:19 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM Solved
Message-ID: <20050831213119.GD11522@gutek>
References: <20050829200548.GB11271@gutek.swissptt.ch>
	<20050831154651.GD15141@agk.surrey.redhat.com>
	<20050831211044.GB11522@gutek>
	<20050831211341.GH15141@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050831211341.GH15141@agk.surrey.redhat.com>
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

On Wed, Aug 31, 2005 at 10:13:41PM +0100, Alasdair G Kergon wrote:
> On Wed, Aug 31, 2005 at 11:10:44PM +0200, Chris Osicki wrote:
> >      filter = [ "r|/dev/cdrom.*|", "r|/dev/cdroms.*|" ]
> 
> Which is the same as:
> 
>   filter = [ "r|/dev/cdrom|" ]
> 
> The trailing .* is implied unless you append $ .

Ooops, sure. Thanks again.
> 
> Alasdair
> -- 
> agk@redhat.com

Regards,
Chris

> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Chris Osicki osk@osk.ch
Dipl. Informatik-Ing. HTL
