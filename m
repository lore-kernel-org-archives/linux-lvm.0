Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r267ecun006723
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 02:40:38 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r267eZRm018162
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 02:40:36 -0500
Message-ID: <5136F2F1.3020202@pse-consulting.de>
Date: Wed, 06 Mar 2013 08:40:33 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
In-Reply-To: <aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Am 01.03.13 16:41, schrieb Vladislav Bogdanov:
> Sorry, forgot to reply to list from the first attempt.
>
> Andreas Pflug <pgadmin@pse-consulting.de> wrote:
>
>> Hi Vladislav,
>>
>> I tried the patch you mentioned in
>> https://www.redhat.com/archives/linux-lvm/2013-January/msg00006.html ,
>> but apparently it doesn't work for me. On a locally active LV, I still
>> get
>>
>> ./lvm lvchange -aey -vvvv vg/locktest
>>
>> ...
>> Activating logical volume "locktest" exclusively
>> #activate/dev_manager.c:284         Getting device info for vg-locktest
>>
>> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
>> #ioctl/libdm-iface.c:1724         dm info
>> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
>> NF   [16384] (*1)
>> #locking/cluster_locking.c:568         Lock held for
>> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node
>> 7400a8c0 : CR
>> #activate/activate.c:1067       vg/locktest is active
>> #locking/cluster_locking.c:508       Locking LV
>> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX
>> (LV|NONBLOCK|CLUSTER|LOCAL) (0xdd)
>> #locking/cluster_locking.c:395   Error locking on node 7400a8c0: Device
>>
>> or resource busy
>>
>> Can you give me a hint what to try further?
>>
>> Regards
>> Andreas
> Hi Andreas,
> Lock convertion is only enabled if you pass --force flag.
> Also, to upgrade local lock to exclusive one, you need to ensure IIRC that no more node holds local lock.

Hm, tried that as well:

tools/lvm lvchange --force -aey  -vvvv vg/locktest

--force changes the error from "resource busy" to "invalid argument":

#lvchange.c:243     Activating logical volume "locktest" exclusively 
(forced)
#activate/dev_manager.c:284         Getting device info for vg-locktest 
[LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
#ioctl/libdm-iface.c:1724         dm info 
LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN 
NF   [16384] (*1)
#locking/cluster_locking.c:568         Lock held for 
oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node 
7400a8c0 : CR
#activate/activate.c:1067       vg/locktest is active
#activate/dev_manager.c:284         Getting device info for vg-locktest 
[LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
#ioctl/libdm-iface.c:1724         dm info 
LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN 
NF   [16384] (*1)
#activate/activate.c:1067       vg/locktest is active
#activate/dev_manager.c:284         Getting device info for vg-locktest 
[LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
#ioctl/libdm-iface.c:1724         dm info 
LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN 
NF   [16384] (*1)
#locking/cluster_locking.c:568         Lock held for 
oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node 
7400a8c0 : CR
#activate/activate.c:1067       vg/locktest is active
#locking/cluster_locking.c:508       Locking LV 
oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX 
(LV|NONBLOCK|CLUSTER|LOCAL|CONVERT) (0x40dd)
#locking/cluster_locking.c:395   Error locking on node 7400a8c0: Invalid 
argument


Regards
Andreas
