Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8OFFx9A008685
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 11:15:59 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8OFFqqe029963
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 11:15:52 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id E93ED53F45
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 17:15:45 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id AEE809356
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 17:15:44 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id tUKuX1n9K1dn for <linux-lvm@redhat.com>;
	Mon, 24 Sep 2007 17:15:40 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-246-105.netcologne.de
	[87.78.246.105]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 17:15:40 +0200 (CEST)
Message-ID: <46F7D49A.2090206@wpkg.org>
Date: Mon, 24 Sep 2007 17:15:38 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Overhead
References: <1C8CF1EA1A5B5940B81B0710B2A4C9381DF6018911@an-ex.ActiveNetwerx.int>
	<46F7D242.3030707@stercomm.com>
In-Reply-To: <46F7D242.3030707@stercomm.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Chris Cox schrieb:
> Joseph L. Casale wrote:
>> Hi,
>> I am wanting to use LVM behind an iet iscsi target and I am wondering
>> how much overhead if any does LVM add? Would the performance degrade
>> any, currently I am exporting full unpartitioned discs and am happy with
>> the performance. From what I am reading now, I would likely partition
>> the physical discs and use that in LVM then export a volume.
> 
> Overhead is negligible.  I haven't seen any impact at all.

Quite the contrary - unless the default settings are not changed.


By default, the readahead values for LVM volumes is quite low / for 
iSCSI, I always have to change it to get acceptable performance (one 
might want to replace the $HOSTNAME with the name of the PV, or define a 
separate list; "setra" values might need some experimenting, too):


LVMS=$(/bin/ls /dev/$HOSTNAME/)

for LVM in $LVMS
     do
         blockdev --setra 16384 /dev/$HOSTNAME/$LVM
     done


-- 
Tomasz Chmielewski
http://blog.wpkg.org
