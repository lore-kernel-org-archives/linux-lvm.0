Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8OI6gvC012399
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 14:06:42 -0400
Received: from pd4mo1so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8OI6U05006115
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 14:06:36 -0400
Received: from pd3mr2so.prod.shaw.ca
	(pd3mr2so-qfe3.prod.shaw.ca [10.0.141.178]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JOV00L5IWW1F670@l-daemon> for linux-lvm@redhat.com; Mon,
	24 Sep 2007 12:04:49 -0600 (MDT)
Received: from pn2ml9so.prod.shaw.ca ([10.0.121.7])
	by pd3mr2so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JOV00MBEWW17F00@pd3mr2so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 24 Sep 2007 12:04:50 -0600 (MDT)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JOV00G3CWW1E211@l-daemon> for linux-lvm@redhat.com; Mon,
	24 Sep 2007 12:04:49 -0600 (MDT)
Received: from an-ex.ActiveNetwerx.int (an-ex.activenetwerx.int [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id 60CBB2821D	for
	<linux-lvm@redhat.com>; Mon, 24 Sep 2007 12:36:01 -0600 (MDT)
Date: Mon, 24 Sep 2007 12:04:43 -0600
From: "Joseph L. Casale" <jcasale@activenetwerx.com>
Subject: RE: [linux-lvm] LVM Overhead
In-reply-to: <46F7D49A.2090206@wpkg.org>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93820128EDAB9@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C9381DF6018911@an-ex.ActiveNetwerx.int>
	<46F7D242.3030707@stercomm.com> <46F7D49A.2090206@wpkg.org>
Content-Transfer-Encoding: 8bit
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Thanks guys!
You'll have to bear with me here, but how and where do I run the commands you noted here to set this value?

Thanks!
jlc

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Tomasz Chmielewski
Sent: Monday, September 24, 2007 9:16 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] LVM Overhead

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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
