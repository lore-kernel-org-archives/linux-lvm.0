References: <ccfceced-9471-ebff-d2ed-1669b82013ad@strike.wu.ac.at>
	<56d4ab3a-671a-834d-a51e-d1eabcaae232@redhat.com>
	<9d5f6f1e-f53e-f21d-e89b-e6d7cdd84409@strike.wu.ac.at>
	<4f4c7bdd-c481-2141-d66c-30a4e6c99e95@gmail.com>
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <26da7162-c0d0-9a79-1251-ff2c0fc4f774@strike.wu.ac.at>
Date: Wed, 25 Oct 2017 10:47:13 +0200
MIME-Version: 1.0
In-Reply-To: <4f4c7bdd-c481-2141-d66c-30a4e6c99e95@gmail.com>
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] unable to remove snapshot of raid1 leg
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Heinz Mauelshagen <heinzm@redhat.com>

On 10/24/2017 01:03 PM, Zdenek Kabelac wrote:
> Dne 23.10.2017 v 18:40 Alexander 'Leo' Bergolth napsal(a):
>> On 10/23/2017 04:44 PM, Heinz Mauelshagen wrote:
>>> Removing such per leg snapshot should be possible after the raid1 LV got
>>> deactivated.
>>
>> Hmm. This LV is currently in use. Any chance to remove it with the raid1
>> LV active?
> 
> The one 'risky' idea could be to try 'vgcfgrestore' metadata before taking
> snapshot then (forcibly) remove  (dmsetup remove (-f)  vg-snapshot)  so
> snapshot is no longer referencing origin.
> (force should not be needed - but if some has opened snapshot...)
> 
> Then you should be able to use  'lvchange --refresh vg'
> 
> and finally drop  'left-over'  cow volume with dmsetup remove.
> (and make sure snapshot is already gone - if not - try remove again)


Thanks a lot!
I tried this on a test-box. Works perfect!

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
