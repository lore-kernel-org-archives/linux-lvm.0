Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8QH0hMn022704
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 13:00:43 -0400
Received: from pd3mo1so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8QH0gJu027701
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 13:00:42 -0400
Received: from pd2mr4so.prod.shaw.ca
	(pd2mr4so-qfe3.prod.shaw.ca [10.0.141.107]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JOZ005ZXJ7CU9A0@l-daemon> for linux-lvm@redhat.com; Wed,
	26 Sep 2007 10:59:36 -0600 (MDT)
Received: from pn2ml3so.prod.shaw.ca ([10.0.121.147])
	by pd2mr4so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JOZ00646J7CTEB0@pd2mr4so.prod.shaw.ca> for
	linux-lvm@redhat.com; Wed, 26 Sep 2007 10:59:37 -0600 (MDT)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JOZ002Z8J78GXE1@l-daemon> for linux-lvm@redhat.com; Wed,
	26 Sep 2007 10:59:32 -0600 (MDT)
Received: from an-ex.ActiveNetwerx.int (an-ex.activenetwerx.int [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id AEA0428222	for
	<linux-lvm@redhat.com>; Wed, 26 Sep 2007 11:31:09 -0600 (MDT)
Date: Wed, 26 Sep 2007 10:59:28 -0600
From: "Joseph L. Casale" <jcasale@activenetwerx.com>
Subject: RE: [linux-lvm] LVM Overhead
In-reply-to: <46FA847D.5010405@stercomm.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93820455DF104@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C9381DF6018911@an-ex.ActiveNetwerx.int>
	<46F7D242.3030707@stercomm.com> <46F7D49A.2090206@wpkg.org>
	<1C8CF1EA1A5B5940B81B0710B2A4C93820128EDAB9@an-ex.ActiveNetwerx.int>
	<46FA847D.5010405@stercomm.com>
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

Thank you Chris!
jlc

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Chris Cox
Sent: Wednesday, September 26, 2007 10:11 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] LVM Overhead

Joseph L. Casale wrote:
> Thanks guys!
> You'll have to bear with me here, but how and where do I run the commands you noted here to set this value?

I'd probably create an init script and have it executed for a given
runlevel after the mounts are done.

Some distros have a mechanism to add "user" things to end of
the init process, but if not, just grab an init script and
mod it to do the blockdev commands you need (you could make
it smart so that it does some sort of checking for valid
names, etc.)

>
> Thanks!
> jlc
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Tomasz Chmielewski
> Sent: Monday, September 24, 2007 9:16 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] LVM Overhead
>
> Chris Cox schrieb:
>> Joseph L. Casale wrote:
>>> Hi,
>>> I am wanting to use LVM behind an iet iscsi target and I am wondering
>>> how much overhead if any does LVM add? Would the performance degrade
>>> any, currently I am exporting full unpartitioned discs and am happy with
>>> the performance. From what I am reading now, I would likely partition
>>> the physical discs and use that in LVM then export a volume.
>> Overhead is negligible.  I haven't seen any impact at all.
>
> Quite the contrary - unless the default settings are not changed.
>
>
> By default, the readahead values for LVM volumes is quite low / for
> iSCSI, I always have to change it to get acceptable performance (one
> might want to replace the $HOSTNAME with the name of the PV, or define a
> separate list; "setra" values might need some experimenting, too):
>
>
> LVMS=$(/bin/ls /dev/$HOSTNAME/)
>
> for LVM in $LVMS
>      do
>          blockdev --setra 16384 /dev/$HOSTNAME/$LVM
>      done
>
>
> --
> Tomasz Chmielewski
> http://blog.wpkg.org
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
