Received: from dobby.usersys.redhat.com (unknown [10.40.193.90])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E20B10021AA
	for <linux-lvm@redhat.com>; Mon, 12 Oct 2020 10:57:08 +0000 (UTC)
References: <fee58e48-151f-9eab-a6a2-eb31c690029c@alteeve.ca>
	<32651cc4-159f-a7f3-83cc-1e1c50071b93@redhat.com>
	<b3d53a4d-dafe-4d92-700a-f9df28061020@alteeve.ca>
	<20201009153924.GC13687@IUPUI.Edu>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <c1666089-355d-44a6-d86a-6ba4738d2e2f@redhat.com>
Date: Mon, 12 Oct 2020 12:57:06 +0200
MIME-Version: 1.0
In-Reply-To: <20201009153924.GC13687@IUPUI.Edu>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM PV UUID problem
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

On 10/9/20 5:39 PM, Mark H. Wood wrote:
> On Fri, Oct 09, 2020 at 11:18:38AM -0400, Digimer wrote:
>> On 2020-10-09 10:43 a.m., Zdenek Kabelac wrote:
>>> Dne 09. 10. 20 v 15:12 Digimer napsal(a):
>>>> Hi all,
>>>>
>>>>  �� I'm storing LVM information in a postgres database, and wanted to use
>>>> the UUID from the PVs / VGs / LVs as the UUIDs in the database. I
>>>> noticed when I tried to do this that postgres complained that the UUID
>>>> was not valid. I checked with an online UUID validator
>>>> (https://www.freecodeformat.com/validate-uuid-guid.php) and it also
>>>> reported as invalid.
>>>>
>>>> Example;
>>>>
>>>> ====
>>>> # pvdisplay | grep UUID
>>>>  �� PV UUID�������������� jLkli2-dEXx-5Y8n-pYlw-nCcy-9dFL-3B6jU3
>>>> ====
>>>>
>>>>  �� Is this a known issue?
>>>>
>>>
>>> Hi
>>>
>>> At the time of lvm2 devel I believe UUID was just a unique identifier,
>>> later some effort to standardize it came in.
>>>
>>> But really you should NOT be using basically internal unique identifiers
>>> in your DB - this are internal to DM/LVM work and might be changed at
>>> any time to something else.
>>>
>>> User is supposed to use� 'vgname' & 'lvname'� - so there you can put those
>>> valid UUID sequences - although human readable strings are always nicer ;)
>>>
>>> Zdenek
>>
>> The trick is that VG and LV names can change, so I wanted to use the
>> (so-called) UUID as a way to keep track of a given item through name
>> changes.
>>
>> I suppose I'll have to rework to use the internal "UUIDs" as more like
>> serial numbers instead...
> 
> Well, if we are stuck with non-standard "UUID"s, at least they are
> meant to be Universally Unique, so they can be treated as unique
> opaque string tokens.  Or you might find a library function that can
> return the unencoded binary value and you can encode it as you please.
> However, the issue of persistence remains.
> 
> FWIW I think it's quite reasonable for someone to want immutable
> unique identifiers for distinct objects such as LVM PVs, especially
> when the "unique identifier" part is already available and quite
> visible.

...and then there is lvconvert which takes existing LV and creates a new 
object with the same name, and original LV is used as a "compnent" (e.g. 
raid1 leg, or snapshot origin)

So now there are two objects, one with the same name, and other one - 
the original LV, which one should use the original UUID?

Just consider LVM UUIDs as MUST BE unique IDs.

Or better MUST BE for lvm to work properly, and SHOULD BE in reality (as 
duplicates occur e.g. when SAN snapshots are visible to the system and 
you run into troubles, and so there are filters,...)

-- Martian

> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
