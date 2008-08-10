Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7AHjTBt027817
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2008 13:45:29 -0400
Received: from mule.trantor.org.uk (mule.trantor.org.uk [213.146.154.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7AHjH25027331
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2008 13:45:17 -0400
Received: from lion.trantor.org.uk (cpc1-leds8-0-0-cust743.leed.cable.ntl.com
	[82.30.178.232])
	by mule.trantor.org.uk (Postfix) with ESMTP id DCE9A15049
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2008 18:45:16 +0100 (BST)
Received: from [192.168.87.26] (unknown [192.168.87.26])
	by lion.trantor.org.uk (Postfix) with ESMTP id E957DC0048
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2008 19:02:15 +0100 (BST)
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way
	to increase PV metadatasize?
From: John Leach <john@johnleach.co.uk>
In-Reply-To: <20080807194151.GT7257@agk.fab.redhat.com>
References: <1218132476.4013.10.camel@dogen.thepride.>
	<20080807194151.GT7257@agk.fab.redhat.com>
Date: Sun, 10 Aug 2008 18:45:16 +0100
Message-Id: <1218390316.9292.6.camel@dogen.thepride.>
Mime-Version: 1.0
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

On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:

> To remove the metadata areas you need to:
> 
>    get an up-to-date metadata backup (vgcfgbackup)
> 
>   pvcreate --restorefile pointing at a copy of that backup file requesting 0 metadata areas
> and specifying the same uuid as it had before
> 
>   vgcfgrestore from the backup file
>  

This doesn't look like something you can do with the volume group active
(with cluster lvm anyway):

[root@testnode0 ~]# pvcreate --restorefile san-metadata -u fTLglk-j1C1-02Z7-8k6l-DTAm-2WNj-9ZGT19 --metadatacopies 0 /dev/hdb -ff
Really INITIALIZE physical volume "/dev/hdb" of volume group "san" [y/n]? y
  Can't open /dev/hdb exclusively.  Mounted filesystem?

Is that right, or am I missing something?

Thanks,

John.
