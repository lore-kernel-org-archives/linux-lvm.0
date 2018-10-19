References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
	<06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
	<8ecbd3c8-4819-9ff2-40b1-315e6ae03c97@izyk.ru>
	<36f0f734-c49f-eaf9-7ff5-8aedfd7345b3@redhat.com>
	<707aafdc-cfd2-3bdd-13bb-1bfdc08c6ad9@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c6043f6f-f10a-5e6f-19ba-b50508e48ee0@redhat.com>
Date: Fri, 19 Oct 2018 15:08:55 +0200
MIME-Version: 1.0
In-Reply-To: <707aafdc-cfd2-3bdd-13bb-1bfdc08c6ad9@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why doesn't the lvmcache support the discard (trim)
 command?
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <mail@izyk.ru>

Dne 19. 10. 18 v 14:45 Gionatan Danti napsal(a):
> On 19/10/2018 12:58, Zdenek Kabelac wrote:
>> Hi
>>
>> Writecache simply doesn't care about caching your reads at all.
>> Your RAM with it's page caching mechanism keeps read data as long as there 
>> is free RAM for this - the less RAM goes to page cache - less read 
>> operations remains cached.
> 
> Hi, does it mean that to have *both* fast write cache *and* read cache one 
> should use a dm-writeback target + a dm-cache writethrough target (possibly 
> pointing to different devices)?
> 
> Can you quantify/explain why and how faster is dm-writeback for heavy write 
> workload?



Hi

It's rather about different workload takes benefit from different caching 
approaches.

If your system is heavy on writes -  dm-writecache is what you want,
if you mostly reads - dm-cache will win.

That's why there is  dmstats to also help identify hotspots and overal logic.
There is nothing to win always in all cases - so ATM 2 different targets are 
provided -  NVDIMMs already seems to change game a lot...

dm-writecache could be seen as 'extension' of your page-cache to held longer 
list of dirty-pages...

Zdenek
