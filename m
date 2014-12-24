Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBODpnmp002621
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2014 08:51:50 -0500
Received: from sr48maunaloa.caregroup.org (sr48maunaloa.caregroup.org
	[134.174.104.34])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBODpkZg008462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2014 08:51:48 -0500
Received: from pps.filterd (sr48maunaloa.caregroup.org [127.0.0.1])
	by sr48maunaloa.caregroup.org (8.14.7/8.14.7) with SMTP id
	sBODoNju002414
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2014 08:51:45 -0500
Received: from ss61babel.its.caregroup.org (ss61babel.bidmc.harvard.edu
	[10.85.1.126])
	by sr48maunaloa.caregroup.org with ESMTP id 1rdte0u7pj-1
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2014 08:51:45 -0500
From: <mghofran@bidmc.harvard.edu>
Date: Wed, 24 Dec 2014 08:51:44 -0500
Message-ID: <66BEED9E1579F2479F74AC14631BE1E30CEC77EBAB@EVS5CCR.its.caregroup.org>
References: <5493FEB9.7010009@crowie.net> <54945665.5060107@redhat.com>
	<5494AFBA.5010003@crowie.net>
In-Reply-To: <5494AFBA.5010003@crowie.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Missing Logical Volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

If your VG was not activated to begin with, you could not see any LV at all so "vgchange -a y" was not the way to go.

If you still have the issue, please attach the results of:

# vgdisplay -v /dev/array1
# grep -I filter /etc/lvm/lvmconf
# vgscan
# ls -al /dev/mapper


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of G Crowe
Sent: Friday, December 19, 2014 6:08 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Missing Logical Volumes


No, this didn't work.

[root@host1 ~]# vgchange -ay array1
   29 logical volume(s) in volume group "array1" now active

And the missing /dev/mapper files were not created (I left one LV un-fixed to try any suggested solutions)

All of the other LVs in the same VG are completely usable, so it doesn't seem to be a problem with the VG as a whole.


Thanks

GC


On 20/12/2014 3:46 AM, Jack Waterworth wrote:
> It sounds like the VG was not activated. You can activate it with the
> following command:
>
>     # vgchange -ay array1
>
>   Jack Waterworth, Red Hat Certified Architect
>   Senior Storage Technical Support Engineer
>   Red Hat Global Support Services ( 1.888.467.3342 )
>
> On 12/19/2014 05:32 AM, G Crowe wrote:
>> After rebooting, some of my logical volumes did not have device files.
>>
>> /dev/array1/LVpics
>> and
>> /dev/mapper/array1-LVpics
>> did not exist but the output of "lvdisplay" said that the volume was
>> available (see below).
>>
>> vgscan did not resolve the problem.
>>
>> I was able to regain access to the LV by renaming it, then renaming
>> it back...
>> [root@host1 ~]# lvrename /dev/array1/LVpics /dev/array1/LVpicsnew
>>   Renamed "LVpics" to "LVpicsnew" in volume group "array1"
>> [root@host1 ~]# lvrename /dev/array1/LVpicsnew /dev/array1/LVpics
>>   Renamed "LVpicsnew" to "LVpics" in volume group "array1"
>>
>> There are 29 LVs in the VG and 25 of them came up OK and 4 had this
>> problem. Note that there is only one single PV (a RAID6 array) in the
>> VG, and there are two VGs on the machine.
>>
>> Is this expected behaviour, or is it something I should be worried
>> about?
>>
>>
>>
>>   --- Logical volume ---
>>   LV Path                /dev/array1/LVpics
>>   LV Name                LVpics
>>   VG Name                array1
>>   LV UUID                WH7g9u-Ls7J-fIpQ-Hk2p-mUuH-QRKf-9uxcM2
>>   LV Write Access        read/write
>>   LV Creation host, time example.com, 2013-11-26 07:29:51 +1100
>>   LV Status              available
>>   # open                 0
>>   LV Size                350.00 GiB
>>   Current LE             89600
>>   Segments               2
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:9
>>
>>
>> I am running Fedora 19 with kernel 3.11.9-200.fc19.x86_64
>>
>>
>> Thanks
>>
>> GC
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

This message is intended for the use of the person(s) to whom it may be addressed. It may contain information that is privileged, confidential, or otherwise protected from disclosure under applicable law. If you are not the intended recipient, any dissemination, distribution, copying, or use of this information is prohibited. If you have received this message in error, please permanently delete it and immediately notify the sender. Thank you.
