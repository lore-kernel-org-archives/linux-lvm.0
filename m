Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with SMTP id n5HERVkk007108
	for <linux-lvm@redhat.com>; Wed, 17 Jun 2009 10:27:31 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n5HER9hl013915
	for <linux-lvm@redhat.com>; Wed, 17 Jun 2009 10:27:10 -0400
Message-Id: <11905247.42271245248829110.JavaMail.servlet@kundenserver>
From: liam@landv.org.uk
Subject: Re: [linux-lvm] Exposing the same VG from two different disks
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Jun 2009 16:27:09 +0200
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
To: linux-lvm@redhat.com

I've had a closer look at the vgimportclone script and I think the fix for the
 lost filter is very straight forward. The errors are coming out of the final
 vgscan and it seems to be caused by the LVM_SYSTEM_DIR variable being set to an 
empty string rather than being unset. So I made the following change and it seemed 
to fix the errors...

327,333c327
<
< if [[ -z ${ORIG_LVM_SYS_DIR} ]]
< then
<       unset LVM_SYSTEM_DIR
< else
<       LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
< fi
---
> LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}

I'm not sure if this change causes any issues but I'd be suprised.
Thanks
Liam

>Thanks to everyone who replied. The vgimportclone worked really well and I can 
>recommend it to anyone who is in my situation. 
>
>I have a follow up question about how the LVM filter works in the script. 
>Should I post here or to the LVM Devel list instead?
>
>Just in case here is the right place !!! My question is, I have multiple paths 
>to the same disks so I have masked the individual paths (the sd devices) and 
>just exposed the logical deives (the emcpower devices). The script loses this 
>filter and complains about lots of duplicate PV ids as it runs through. This 
>"problem" is purely cosmetic and doesn't seem to in anyway effect the script 
>from working. If this is not expected behaviour and the fix is fairly straight 
>forward I'd be more than happy to test any fix. I've had a look at trying to 
>see where the errors are coming from but I have to admit my LVM knowledge 
>isn't up to it.
>
>Thanks again to everyone for their hope,
>Liam
>
>
>
>>On Fri, 2009-06-05 at 15:18 +0200, liam@landv.org.uk wrote:
>>> Hi,
>>> 
>>> I'm not sure if what I'm trying to do is possible or not but hopefully
>>>  someone out there can help!!
>>> 
>>> I have a volume group which consists of a LUN (/dev/emcpowerv1) in an
>>>  EMC cabinet. To backup up the disk I use EMC technology to synchronise
>>>  a second LUN (/dev/emcpoweraf1) with the first, when the
>>>  synchronisation is complete I then break the connection. At this point
>>>  I have two identical volume groups exposed to the same host. What I
>>>  would like to do is rename the second volume group and mount its
>>>  logical volumes. However I can't because (understandably) LVM doesn't
>>>  like having two identical volume groups so when I issue pvchange -u I
>>>  get...
>>> 
>>> 
>>> # pvchange -u /dev/emcpoweraf1
>>>   Found duplicate PV dXiYI6nVqu8UpXO2mlaWiKKPKSBPrRbn: using 
>/dev/emcpowerv1 
>>not /dev/emcpoweraf1
>>>   get_pv_from_vg_by_id: vg_read failed to read VG !
>>>   /dev/emcpowerv1: write failed after 0 of 4096 at 4096: Operation not 
>>permitted
>>>   pv_write with new uuid failed for /dev/emcpowerv1.
>>>   0 physical volumes changed / 1 physical volume not changed
>>> 
>>> Notice I issue the command against /dev/emcpoweraf1 but it complains about 
>
>>writing to /dev/emcpowerv1.
>>
>>Take a look at the vgimportclone script posted to the lvm-devel list
>>last month:
>>
>>http://www.redhat.com/archives/lvm-devel/2009-May/msg00130.html
>>
>>Regards,
>>Bryn.
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
