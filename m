Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8OGdRNR027478
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 12:39:27 -0400
Received: from shuttlerun.csg.stercomm.com (scidalsmtp02.csg.stercomm.com
	[204.214.3.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8OGdRxj015210
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2007 12:39:27 -0400
Message-ID: <46F7E839.8040805@stercomm.com>
Date: Mon, 24 Sep 2007 11:39:21 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Overhead
References: <1C8CF1EA1A5B5940B81B0710B2A4C9381DF6018911@an-ex.ActiveNetwerx.int>	<46F7D242.3030707@stercomm.com>
	<46F7D49A.2090206@wpkg.org> <46F7E720.4060304@stercomm.com>
In-Reply-To: <46F7E720.4060304@stercomm.com>
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

Chris Cox wrote:
> Tomasz Chmielewski wrote:
>> Chris Cox schrieb:
>>> Joseph L. Casale wrote:
>>>> Hi,
>>>> I am wanting to use LVM behind an iet iscsi target and I am wondering
>>>> how much overhead if any does LVM add? Would the performance degrade
>>>> any, currently I am exporting full unpartitioned discs and am happy with
>>>> the performance. From what I am reading now, I would likely partition
>>>> the physical discs and use that in LVM then export a volume.
>>> Overhead is negligible.  I haven't seen any impact at all.
>> Quite the contrary - unless the default settings are not changed.
>>
>>
>> By default, the readahead values for LVM volumes is quite low / for
>> iSCSI, I always have to change it to get acceptable performance (one
>> might want to replace the $HOSTNAME with the name of the PV, or define a
>> separate list; "setra" values might need some experimenting, too):
>>
>>
>> LVMS=$(/bin/ls /dev/$HOSTNAME/)
>>
>> for LVM in $LVMS
>>     do
>>         blockdev --setra 16384 /dev/$HOSTNAME/$LVM
>>     done
>>
>>
> 
> Hmmm, perhaps for iSCSI.  But using fibre SAN, I saturate my
> 2Gbps link (almost 200MB/sec).
> 
> 

I check my local drives, they all use the default 1024....
Is setting the read ahead that big of a deal with just LVM?
I would think if it's an issue, it's an issue everywhere.


-- 
Chris Cox
Sr. Unix Sys Admin
