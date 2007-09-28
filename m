Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8SFoaSF017097
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2007 11:50:36 -0400
Received: from shuttlerun.csg.stercomm.com (scidalsmtp02.csg.stercomm.com
	[204.214.3.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8SFoXL8021759
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2007 11:50:33 -0400
Message-ID: <46FD22C1.3070705@stercomm.com>
Date: Fri, 28 Sep 2007 10:50:25 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on a share environnement (SAN inside)
References: <D1DF25FB-02EE-46BF-92AF-4DB9039BFFB8@ensil.unilim.fr>	<46FBEA1B.7070905@stercomm.com>	<290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>	<46FC1CAC.2050304@stercomm.com>
	<1E7EE5CF-B754-4D22-9D8B-41DC8AD5C0DC@ensil.unilim.fr>
In-Reply-To: <1E7EE5CF-B754-4D22-9D8B-41DC8AD5C0DC@ensil.unilim.fr>
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
> but the vg can be accessed by the two host.
> For example:
> on xen1, there is vm1, vm2, vm3 and vm4  access from SAN by
> /dev/domU_VG/vm{1,2,3,4}-disk
> on xen2, there is vm5, vm6, vm7 and vm8  access from SAN by
> /dev/domU_VG/vm{5,6,7,8}-disk
> 
> If xen1 comes down, vm1,vm2,vm3 and vm4 are reload (manually or by
> script) on xen2
> If there is intendance task on xen2, simply migrate vm{5,6,7,8} on xen1
> 
> There is no filesystem access simulty but the same vg is seen by the two
> host.

There's NO need for the visibility until the heart beat fails and you
make the cutover decision.  Don't make the vg active.  Have your
up/down scripts for failover and restore leave the vg inactive until
it's confirmed that it's safe and desired to bring it up on
the host.

Alternatively, use something cluster aware (if you want truer... but
not necessarily more reliable HA).

> 
> thank's for your help ;)
> 
> 
> 
> 
> 
> Le 27 sept. 07 � 23:12, Chris Cox a �crit :
> 
>> hubert chomette wrote:
>>> the two machine use the same lun, on this lun, there is one vg with a
>>> logical volume by virtual machine (10 virtual machine).
>>> The idea is if one xen is down, the other can launch the virtual machine
>>> ad continu service.
>>
>> Ok..  so the psedo HA model I mentioned.  Access to the LUN isn't live
>> (in concept) but only becomes available to the failover system when
>> the primary system fails.
>>
>> Nothing wrong with this.  Remember, that when you disconnect
>> a LUN and reconnect it to a new host that it will scan what is
>> out there.  The difficulty would be for hardcoded names of
>> volumes, etc, if you changed those things while the secondary
>> system is in charge (same issue with the config on the secondary
>> when the primary is in charge).
>>
>>  You might be able to do something
>> with auto discovery and a script rather than with fstab with
>> regards to bring LUN LVM filesystem back online.  That's probably
>> how I'd do it... That way, you can at least take a good stab
>> of making sense of the LVM when it comes online.
>>
>>
>>>
>>> Le 27 sept. 07 � 19:36, Chris Cox a �crit :
>>>
>>>> hubert chomette wrote:
>>>>> Hi,
>>>>> I recently install a SAN at my work. One lun is used for XEN and
>>>>> can be
>>>>> used by two xen server.
>>>>> For more flexibility I use lvm on this lun. I was very happy of the
>>>>> result, unless I discover (during a conversation with a friend)
>>>>> that lvm
>>>>> metadata can be compromised if the two server simulty modify metadata.
>>>>> - So what can I do?
>>>>
>>>> Use seperate LUNs.  I'm not sure what your friend is talking about.
>>>> Unless you have two machines using the same LUN, in which case
>>>> there are issues... this would be a cluster filesystem issue, or
>>>> near-high availability issue...
>>>>
>>>>> - Is it possible to allow LVM metadata modification by only one
>>>>> server?
>>>>> - should I use clvm instead?
>>>>
>>>> Metadata won't creep outside of what is visible.
>>>>
>>>>> - Is it possible to migrate lvm to clvm without any data lost?
>>>>
>>>> Not sure.
>>>>
>>>>>
>>>>> thank's for your help
>>>>>
>>>>> regards,
>>>>>
>>>>> ps: sorry for my poor english
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@redhat.com
>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>>
>>>>
>>>>
>>>> -- 
>>>> Chris Cox
>>>> Sr. Unix Sys Admin
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
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
