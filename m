References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <55ED77AA.7030708@redhat.com>
Date: Mon, 7 Sep 2015 13:40:26 +0200
MIME-Version: 1.0
In-Reply-To: <55ED3D10.4070203@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Richard Davies <richard.davies@elastichosts.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 09/07/2015 09:30 AM, Peter Rajnoha wrote:
> On 09/05/2015 01:56 PM, Chris Webb wrote:
>> Our hosts use local md arrays as LVM2 PVs in a very straightforward way.
>> They also have lots of slower iscsi devices which LVM shouldn't scan or
>> touch, so we use a simple filter in lvm.conf:
>>
>>     devices {
>>       filter = [ "a|^/dev/md.*|", "r|.*|" ]
>>     }
>>
>> Upon upgrading from lvm-2.02.106 to 2.02.129, commands like lvdisplay
>> and lvs dramatically slowed down. Investigating, we found the filter
>> wasn't excluding the unwanted devices anymore: they were being scanned
>> despite being explicitly excluded.
>>
> 
> I'll check it, thanks for the report...
> 

OK, I've refreshed my memory now on this topic...

I'd advise you to use global_filter instead which should do the job
you need as global_filter is always evaluated at the beginning of the filter
chain. It's also more appropriate to use global_filter in your case if you
want to be sure that devices are filtered completely all the time, never
scanned, even if you switched to using lvmetad.


Now, more about this delicate part of the code and how it actually works.
Feel free to skip this if you're not interested in details, I'm putting
this here just for the record.

There were lots of changes around filters, mainly due to the introduction of
lvmetad daemon which is used to cache LVM metadata. For both the lvmetad and
non-lvmetad case to still work properly and effectively, we needed to do some
changes to the LVM filter chain. This is history of LVM filter chain throughout
versions that happened:


Original filter chain before lvmetad and its global_filter (before v2.02.98):
=============================================================================
persistent_filter -> sysfs_filter -> regex_filter -> type_filter ->
md_component_filter -> mpath_component_filter

Filter chain right after introduction of global_filter (v2.02.98):
==================================================================
global_regex_filter -> persistent_filter -> sysfs_filter -> regex_filter ->
type_filter -> md_component_filter -> mpath_component_filter


Filter chain you mentioned worked for you well (v2.02.106):
===========================================================

Without lvmetad v106:
---------------------
persistent_filter -> regex_filter -> type_filter ->
mpath_component_filter -> partition_filter -> md_component_filter


With lvmetad v106:
------------------
  - to update lvmetad:
    global_regex_filter -> persistent_filter -> regex_filter -> type_filter ->
    mpath_filter -> partiton_filter -> md_filter

  - to retrieve info from lvmetad:
    persistent_filter -> regex_filter -> type_filter -> mpath_filter ->
    partiton_filter -> md_filter


Then later on, filter chain changed so some parts were not uselessly
reevaluated when using lvmetad and also fixing a few other
filter-related problems where some filters were not even evaluated
by mistake (v2.02.112):
====================================================================

Without lvmetad v112:
---------------------
persistent_filter -> sysfs_filter -> global_regex_filter -> type_filter ->
usable->filter -> mpath_component_filter -> partition_filter ->
md_component_filter -> regex_filter

With lvmetad v112:
------------------
  - to update lvmetad:
    sysfs_filter -> global_regex_filter -> type_filter -> usable_filter ->
    mpath_component_filter -> partition_filter -> md_component_filter

  - to retrieve info from lvmetad:
    persistent_filter -> usable_filter -> regex_filter

The regex_filter moved at the end of the filter chain as part of this patch:
https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=a7be3b12dfe7388d1648595e6cc4c7a1379bb8a7


====

The key here is that the position of the regex_filter (controlled by
devices/filter setting) changed in that v112. That should be moved back
to the from of the particular filter chain if possible.

The chains should be probably fixed so they look like this:

Without lvmetad:
----------------
persistent_filter -> sysfs_filter -> global_regex_filter -> regex_filter ->
type_filter -> usable->filter -> mpath_component_filter -> partition_filter ->
md_component_filter

With lvmetad:
-------------
  - to update lvmetad:
    sysfs_filter -> global_regex_filter -> type_filter -> usable_filter ->
    mpath_component_filter -> partition_filter -> md_component_filter

  - to retrieve info from lvmetad:
    persistent_filter -> regex_filter -> usable_filter

But first I need to make sure this won't cause any regressions, mainly after
taking into account the https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=a7be3b12dfe7388d1648595e6cc4c7a1379bb8a7
and the reasons why the move has been done at all...

-- 
Peter
