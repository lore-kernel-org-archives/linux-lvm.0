References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
	<06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
	<4968bb3c-cec6-c746-fc2e-7f3754e3711b@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <406ad441-5832-3ad7-fb90-fe775a331785@redhat.com>
Date: Fri, 19 Oct 2018 11:49:53 +0200
MIME-Version: 1.0
In-Reply-To: <4968bb3c-cec6-c746-fc2e-7f3754e3711b@assyoma.it>
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <linux@izyk.ru>

Dne 19. 10. 18 v 11:42 Gionatan Danti napsal(a):
> On 19/10/2018 11:12, Zdenek Kabelac wrote:
>> And final note - there is upcoming support for accelerating writes with new 
>> dm-writecache target.
> 
> Hi, should not it be already possible with current dm-cache and writeback 
> caching?


Hi

dm-cache targets different goal - new  dm-writeback cache has way more optimal 
write-pattern to accelerate writes - compared even with 'writeback' mode.

Another point is - dm-writecache is written with 'NVDIMMs' in mind and it's 
also simpler.


Zdenek
