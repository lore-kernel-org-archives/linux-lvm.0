References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
	<e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
	<b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
	<f82cf9e82a9ecb2e4465a469219c53af@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c3423f37-6f6f-0623-527b-e1039659de3d@redhat.com>
Date: Tue, 12 Sep 2017 16:57:56 +0200
MIME-Version: 1.0
In-Reply-To: <f82cf9e82a9ecb2e4465a469219c53af@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 12.9.2017 v 14:47 Xen napsal(a):
> Zdenek Kabelac schreef op 12-09-2017 14:03:
> 
>> Unfortunatelly lvm2 nor dm� can be responsible for whole kernel logic and
>> all user-land apps...
> 
> What Gionatan also means, or at least what I mean here is,
> 
> If functioning is chain and every link can be the weakest link.
> 
> Then sometimes you can build in a little redundancy so that other weak links 
> do not break so easily. Or that your part can cover it.
> 
> Linux has had a mindset of reducing redundancy lately. So every bug anywhere 
> can break the entire thing.
> 
> Example was something I advocated for myself.
> 
> I installed GRUB2 inside PV reserved space.
> 
> That means 2nd sector had PV, 1st sector had MBR-like boot sector.
> 
> libblkid stopped at MBR and did not recognise PV.
> 

This bug has been reported (by me even to libblkid maintainer) AND already 
fixed already in past....

Yes - surprise software has bugs...

But to defend a bit libblkid maintainer side :) - this feature was not really 
well documented from lvm2 side...

>> You can sync every second to minimize amount of dirty pages....
>>
>> Lots of things....� all of them will in some other the other impact
>> system performance....
> 
> He said no people would be hurt by such a measure except people who wanted to 
> unpack and compile kernel pure in page buffers ;-).


So clearly you need to spend resources effectively and support both groups...
Sometimes is better to use large RAM (common laptops have 32G of RAM nowadays)
Sometimes is better to have more 'data' securely and permanently stored...


Regards

Zdenek
