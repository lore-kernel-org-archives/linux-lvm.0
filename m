Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r269ZUHS015973
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 04:35:30 -0500
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r269ZRDO019737
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 04:35:28 -0500
Message-ID: <51370DDB.5010002@hoster-ok.com>
Date: Wed, 06 Mar 2013 12:35:23 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
In-Reply-To: <5137091A.4070300@pse-consulting.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG
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
To: Andreas Pflug <pgadmin@pse-consulting.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

06.03.2013 12:15, Andreas Pflug wrote:
> Am 06.03.13 08:58, schrieb Vladislav Bogdanov:
>> 06.03.2013 10:40, Andreas Pflug wrote:
>>> Am 01.03.13 16:41, schrieb Vladislav Bogdanovr?
>>>
>>>> Hi Andreas,
>>>> Lock convertion is only enabled if you pass --force flag.
>>>> Also, to upgrade local lock to exclusive one, you need to ensure IIRC
>>>> that no more node holds local lock.
>>> Hm, tried that as well:
>>>
>>> tools/lvm lvchange --force -aey  -vvvv vg/locktest
>>>
>>> --force changes the error from "resource busy" to "invalid argument":
>> Is volume active on other nodes at that time?
> 
> I made sure it's not active on other nodes: lvchange -an vg/locktest ;
> lvchange -aly vg/locktest
>> And do you run clvmd from that build tree as well?
>>
>> Also, can you please try attached patch (on top of that one you have)? I
>> polished conversion a bit more, denying -an if volume is ex-locked
>> somewhere and other fixes to logic.
> I tried that additional patch. I'm running this test versions on my test
> node only (including clvmd), the other nodes are still running clvmd
> 2.2.95 (I guess this shouldn't matter since all are inactive). Same result:

I believe this matters, because error you see is received from a remote
node. Is node with ID 7400a8c0 local?

> 
> #lvchange.c:258     Activating logical volume "locktest" exclusively
> (forced)
> #activate/dev_manager.c:284         Getting device info for vg-locktest
> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
> #ioctl/libdm-iface.c:1724         dm info
> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
> NF   [16384] (*1)
> #activate/activate.c:1067       vg/locktest is active
> #activate/dev_manager.c:284         Getting device info for vg-locktest
> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
> #ioctl/libdm-iface.c:1724         dm info
> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
> NF   [16384] (*1)
> #activate/activate.c:1067       vg/locktest is active
> #activate/dev_manager.c:284         Getting device info for vg-locktest
> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
> #ioctl/libdm-iface.c:1724         dm info
> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
> NF   [16384] (*1)
> #activate/activate.c:1067       vg/locktest is active
> #locking/cluster_locking.c:513       Locking LV
> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX
> (LV|NONBLOCK|CLUSTER|LOCAL|CONVERT) (0x40dd)
> #locking/cluster_locking.c:400   Error locking on node 7400a8c0: Invalid
> argument
> 
> 
>> This patch also allows locking (activation) to be performed on remote
>> nodes. I only tested this with corosync2 (which is set up in a way
>> latest pacemaker - post-1.1.8 git master - needs, nodes has additional
>> 'name' value in nodelist, please see
>> http://clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/s-node-name.html).
>>
> 
> I'm running corosync 1.4.2 (debian wheezy).

Which cluster manager interface does clvmd detect? corosync or openais?
You should use former, openais one is(was) using LCK service which is
very unstable.

> 
> Regards,
> Andreas
