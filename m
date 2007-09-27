Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8RLCN3c021429
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 17:12:23 -0400
Received: from shuttlerun.csg.stercomm.com (scidalsmtp02.csg.stercomm.com
	[204.214.3.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8RLCM2S009368
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 17:12:22 -0400
Message-ID: <46FC1CAC.2050304@stercomm.com>
Date: Thu, 27 Sep 2007 16:12:12 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on a share environnement (SAN inside)
References: <D1DF25FB-02EE-46BF-92AF-4DB9039BFFB8@ensil.unilim.fr>	<46FBEA1B.7070905@stercomm.com>
	<290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>
In-Reply-To: <290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

hubert chomette wrote:
> the two machine use the same lun, on this lun, there is one vg with a
> logical volume by virtual machine (10 virtual machine).
> The idea is if one xen is down, the other can launch the virtual machine
> ad continu service.

Ok..  so the psedo HA model I mentioned.  Access to the LUN isn't live
(in concept) but only becomes available to the failover system when
the primary system fails.

Nothing wrong with this.  Remember, that when you disconnect
a LUN and reconnect it to a new host that it will scan what is
out there.  The difficulty would be for hardcoded names of
volumes, etc, if you changed those things while the secondary
system is in charge (same issue with the config on the secondary
when the primary is in charge).

 You might be able to do something
with auto discovery and a script rather than with fstab with
regards to bring LUN LVM filesystem back online.  That's probably
how I'd do it... That way, you can at least take a good stab
of making sense of the LVM when it comes online.


> 
> Le 27 sept. 07 � 19:36, Chris Cox a �crit :
> 
>> hubert chomette wrote:
>>> Hi,
>>> I recently install a SAN at my work. One lun is used for XEN and can be
>>> used by two xen server.
>>> For more flexibility I use lvm on this lun. I was very happy of the
>>> result, unless I discover (during a conversation with a friend) that lvm
>>> metadata can be compromised if the two server simulty modify metadata.
>>> - So what can I do?
>>
>> Use seperate LUNs.  I'm not sure what your friend is talking about.
>> Unless you have two machines using the same LUN, in which case
>> there are issues... this would be a cluster filesystem issue, or
>> near-high availability issue...
>>
>>> - Is it possible to allow LVM metadata modification by only one server?
>>> - should I use clvm instead?
>>
>> Metadata won't creep outside of what is visible.
>>
>>> - Is it possible to migrate lvm to clvm without any data lost?
>>
>> Not sure.
>>
>>>
>>> thank's for your help
>>>
>>> regards,
>>>
>>> ps: sorry for my poor english
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>>
>> -- 
>> Chris Cox
>> Sr. Unix Sys Admin
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Chris Cox
Sr. Unix Sys Admin
