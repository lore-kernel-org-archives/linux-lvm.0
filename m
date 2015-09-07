Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Chris Webb <chris@arachsys.com>
In-Reply-To: <55ED92A4.7050901@redhat.com>
Date: Mon, 7 Sep 2015 15:00:40 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <5D21B7B0-B3BE-4652-947F-0919E6240F50@arachsys.com>
References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
	<5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
	<6D2FDF98-0E23-4A90-9ED1-3AAD61C3CACB@arachsys.com>
	<55ED8FCD.6050007@redhat.com> <55ED92A4.7050901@redhat.com>
Subject: Re: [linux-lvm] devices.filter changed behaviour in 80ac8f37d6
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Richard Davies <richard.davies@elastichosts.com>, LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 09/07/2015 03:23 PM, Peter Rajnoha wrote:
>> On 09/07/2015 03:08 PM, Chris Webb wrote:
>>> Just one final thought. A second reason we deliberately exclude those
>>> iSCSI devices is that they're actually the drives backing customer VMs,
>>> so any LVM metadata on them should be interpreted by an untrusted guest
>>> kernel and not by the host. Untrusted third parties have complete
>>> control over the contents of the block devices.
>>>
>>> Is LVM well-secured against attacks from block devices containing
>>> malicious LVM metadata? If not, an unexpected change in filtering
>>> behaviour might potentially be a security issue in some environments.
>>
>> Before, we advised use of the filters to filter out all the LVM
>> layout from guest's disks that is not supposed to be visible on
>> host side that may interfere heavily with the LVM layout on the
>> host then (e.g. same VG/LV names used inside guest as in host).
>>
>> There's a new feature called "systemid" in LVM which got included
>> in lvm2 v2.02.117. This one can be also used to solve this issue
>> (without a need to define filters). Check also
>> https://git.fedorahosted.org/cgit/lvm2.git/tree/man/lvmsystemid.7.in.
>
> Of course, from security point of view, you need to take care that
> your systemid is not stolen so that someone doesn't fake metadata inside
> guest with that systemid.
>
> There are several sources for systemid and you can choose which one you
> want to use so it's pretty configurable. One of the sources is  completely
> in your own hands - the "lvmlocal.conf" settings where you can define  
> systemid
> of your own (may it be a long, random and very hard to guess string).

Yes, you caught me halfway through replying that guests might be malicious  
rather than accidental! Given there's space for enough entropy in there to  
secure it, it sounds like an excellent idea. I assume it's possible to tell  
LVM to ignore PVs with no systemid as well as a systemid that doesn't match  
the secret one?

Out of curiosity, at what level do you filter PVs based on this systemid?  
Is it a fixed offset byte string in the PV header, or do you have to do  
quite a bit of metadata parsing before you can ignore the PV? (I'm just  
wondering what the security exposure from malicious foreign/non-systemid  
PVs is like.)

Best wishes,

Chris.
