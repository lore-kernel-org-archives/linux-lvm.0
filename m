References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
	<06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
	<8ecbd3c8-4819-9ff2-40b1-315e6ae03c97@izyk.ru>
	<36f0f734-c49f-eaf9-7ff5-8aedfd7345b3@redhat.com>
	<707aafdc-cfd2-3bdd-13bb-1bfdc08c6ad9@assyoma.it>
	<c6043f6f-f10a-5e6f-19ba-b50508e48ee0@redhat.com>
	<0e965099-0e41-119c-8026-4db73ab2b077@izyk.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5429c96c-900a-6f38-2342-1bf7a61d79cb@redhat.com>
Date: Mon, 22 Oct 2018 12:54:41 +0200
MIME-Version: 1.0
In-Reply-To: <0e965099-0e41-119c-8026-4db73ab2b077@izyk.ru>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <mail@izyk.ru>

Dne 19. 10. 18 v 19:00 Ilia Zykov napsal(a):
>>
>> dm-writecache could be seen as 'extension' of your page-cache to held
>> longer list of dirty-pages...
>>
>> Zdenek
>>
> 
> Does it mean that the dm-writecache is always empty, after reboot?
> Thanks.
> 

No, writecache is journaled -  so after reboot used content is remembered and 
read for use.


Zdenek
