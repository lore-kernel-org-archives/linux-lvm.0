References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <55ED79A1.3060205@redhat.com>
Date: Mon, 7 Sep 2015 13:48:49 +0200
MIME-Version: 1.0
In-Reply-To: <55ED77AA.7030708@redhat.com>
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

On 09/07/2015 01:40 PM, Peter Rajnoha wrote:
> On 09/07/2015 09:30 AM, Peter Rajnoha wrote:
>> On 09/05/2015 01:56 PM, Chris Webb wrote:
>>> Our hosts use local md arrays as LVM2 PVs in a very straightforward way.
>>> They also have lots of slower iscsi devices which LVM shouldn't scan or
>>> touch, so we use a simple filter in lvm.conf:
>>>
>>>     devices {
>>>       filter = [ "a|^/dev/md.*|", "r|.*|" ]
>>>     }
>>>
>>> Upon upgrading from lvm-2.02.106 to 2.02.129, commands like lvdisplay
>>> and lvs dramatically slowed down. Investigating, we found the filter
>>> wasn't excluding the unwanted devices anymore: they were being scanned
>>> despite being explicitly excluded.
>>>
>>
>> I'll check it, thanks for the report...
>>
> 
> OK, I've refreshed my memory now on this topic...
> 
> I'd advise you to use global_filter instead which should do the job
> you need as global_filter is always evaluated at the beginning of the filter
> chain. It's also more appropriate to use global_filter in your case if you
> want to be sure that devices are filtered completely all the time, never
> scanned, even if you switched to using lvmetad.

Note:
Since lvm2 v2.02.116, we have a new feature in LVM which causes it
to reuse existing scanned information from udev database. See also
"devices/external_device_info_source" setting in lvm.conf. If you
switch that from "none" (default) to "udev", lots of the information
used for filtering is gathered from udev database, hence avoiding
the scans which are already done by udev (and mostly the blkid
call while processing udev rules).

This can avoid scanning for partition tables and md component
scanning which takes probably the most time (other scans do not
read from the disk directly, but they read information from /sysfs
and/or they do operations on devices via ioctl).

So besides filtering out some devices completely just because
of the time it takes to scan the device, you can also try the
"udev" external device info source to be used by LVM instead
so LVM doesn't gather the same info again when it's already
in udev database.

-- 
Peter
