Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8RJ3XTW025832
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 15:03:33 -0400
Received: from smtp.unilim.fr (mail.unilim.fr [164.81.1.45])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8RJ3P6p029867
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 15:03:26 -0400
Received: from root.ensil.unilim.fr (root.ensil.unilim.fr [193.50.177.246])
	by smtp.unilim.fr (8.13.1/8.13.1) with ESMTP id l8RJ3Jdl002563
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 21:03:19 +0200
Received: from [127.0.0.1] (cluster1.ensil.unilim.fr [193.50.177.250])
	by root.ensil.unilim.fr (8.14.1/8.13.4) with ESMTP id l8RJ5734006017
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 21:05:07 +0200 (CEST)
	(envelope-from chomette@ensil.unilim.fr)
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <46FBEA1B.7070905@stercomm.com>
References: <D1DF25FB-02EE-46BF-92AF-4DB9039BFFB8@ensil.unilim.fr>
	<46FBEA1B.7070905@stercomm.com>
Message-Id: <290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>
From: hubert chomette <chomette@ensil.unilim.fr>
Subject: Re: [linux-lvm] lvm on a share environnement (SAN inside)
Date: Thu, 27 Sep 2007 21:01:30 +0200
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
Content-Type: text/plain; charset="utf-8"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

the two machine use the same lun, on this lun, there is one vg with a  
logical volume by virtual machine (10 virtual machine).
The idea is if one xen is down, the other can launch the virtual  
machine ad continu service.

Le 27 sept. 07 � 19:36, Chris Cox a �crit :

> hubert chomette wrote:
>> Hi,
>> I recently install a SAN at my work. One lun is used for XEN and  
>> can be
>> used by two xen server.
>> For more flexibility I use lvm on this lun. I was very happy of the
>> result, unless I discover (during a conversation with a friend)  
>> that lvm
>> metadata can be compromised if the two server simulty modify  
>> metadata.
>> - So what can I do?
>
> Use seperate LUNs.  I'm not sure what your friend is talking about.
> Unless you have two machines using the same LUN, in which case
> there are issues... this would be a cluster filesystem issue, or
> near-high availability issue...
>
>> - Is it possible to allow LVM metadata modification by only one  
>> server?
>> - should I use clvm instead?
>
> Metadata won't creep outside of what is visible.
>
>> - Is it possible to migrate lvm to clvm without any data lost?
>
> Not sure.
>
>>
>> thank's for your help
>>
>> regards,
>>
>> ps: sorry for my poor english
>>
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
> -- 
> Chris Cox
> Sr. Unix Sys Admin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
