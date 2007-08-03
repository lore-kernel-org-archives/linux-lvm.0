Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l73G1Hsr008492
	for <linux-lvm@redhat.com>; Fri, 3 Aug 2007 12:01:17 -0400
Received: from mail.terrascale.net ([64.254.245.114])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l73G1GlQ012519
	for <linux-lvm@redhat.com>; Fri, 3 Aug 2007 12:01:16 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.terrascale.net (Postfix) with ESMTP id BDE23A4029
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2007 16:01:15 +0000 (UTC)
Received: from mail.terrascale.net ([127.0.0.1])
	by localhost (mail.terrascale.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18296-05 for <linux-lvm@redhat.com>;
	Fri,  3 Aug 2007 12:01:14 -0400 (EDT)
Received: from [172.20.6.11] (monkey.ts [172.20.6.11])
	by mail.terrascale.net (Postfix) with ESMTP id A6534A4026
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2007 12:01:14 -0400 (EDT)
Message-ID: <46B35149.6090604@terrascale.net>
Date: Fri, 03 Aug 2007 12:01:13 -0400
From: Steeve McCauley <steeve@terrascale.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Listing physical volumes in a volume group
References: <46B3395A.5020701@terrascale.net> <46B34DDC.6020609@redhat.com>
In-Reply-To: <46B34DDC.6020609@redhat.com>
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


Milan,

Ah, I didn't realise one could use the pv_ column names
with the vgs utility.

That's much better.

Thanks,

steeve

Milan Broz wrote:
> Hi,
> 
> this will not help for using in script ?
> (comma separated list of PVS & PV UUID  in VG)
> 
> vgs --separator , --noheadings -o pv_name,pv_uuid <vgname>
> 
> Milan
> --
> mbroz@redhat.com
> 
> Steeve McCauley wrote:
>> I would like to know if there is a canonical way to list the
>> physical volumes in a volume group, specifically to extract
>> the uuid for those PVs in a bash script.  I am able to do
>> something along the lines of,
>>
>> PVS=$(vgdisplay -vv 2>&1 | grep "PV UUID" | awk '{print $3}')
>> PVUUID=$(pvs -o pv_uuid --noheadings /dev/sdx | awk '{print $1}')
>>
>> and then look for PVUUID in the list of PVS.
>>
>> for uuid in $PVS; do
>>    [ "$uuid" != "$PVUUID" ] && continue
>>    ...
>> done
>>
>> but this relies on the output format of 'vgdisplay -vv' and
>> I want to be sure that I will always get the expected result.
>>
>> Thanks,
>>
>> steeve
>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
Steeve McCauley
Director of Research and Development
Rackable Systems
407 McGill Street, Suite 1002
Montreal, Quebec, H2Y 2G3 (Canada)
Tel: 514-288-3343
http://www.rackable.com
:wq
