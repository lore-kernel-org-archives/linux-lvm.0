References: <d2703951-8ad3-9419-82b3-ead1481c58c1@assyoma.it>
	<4dcb6809-f993-4ab1-ab23-0f424e765cd3@redhat.com>
	<fcca00bc-8ab3-e9d6-494b-e1c3d82f95ec@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <69cb8183-73a1-233b-130f-e815f70058f9@redhat.com>
Date: Fri, 30 Nov 2018 11:23:20 +0100
MIME-Version: 1.0
In-Reply-To: <fcca00bc-8ab3-e9d6-494b-e1c3d82f95ec@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] bcache as a new i/o layer?
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 30. 11. 18 v 11:03 Gionatan Danti napsal(a):
> On 30/11/2018 10:52, Zdenek Kabelac wrote:
>> Hi
>>
>>
>> The name of i/o layer bcache is only internal to lvm2 code for caching
>> reads form disks during disk processing - the name comes from usage
>> of� bTree and caching - thus the name bcache.
>>
>> It's not a dm target - so nothing you could use for LVs.
>> And has nothing in common with exiting� bcache kernel block device.
>>
>> The only purpose is to slightly accelerate device scanning and probing - and 
>> helps mostly in cases your system has tons a devices that needs to be scanned,
>> since this bcache is also using async disk reads for its filling....
>>
> 
> Hi Zdenek, thanks for the information.
> I can imagine bcache being instrumental to the deprecation of lvmetad, right?

Hi

Well lvmetad was dropped from release  2.03  (upstream HEAD)

But for different reason - it's had some core design issues which were not 
fixable with exist state of code ATM, so the whole lvmetad was dropped and for 
now replaced with storage of some data in /run/lvm/pvs_online  so at least 
auto-activation still works in some way.

IMHO internal bcache is a bit to heavy weapon for its purpose, but it will 
evolve into a self contained io-manager.


Zdenek
