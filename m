References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<1c4af753-8f20-c50d-37a4-a3d8d8f979f9@redhat.com>
	<fa490a40-1c58-f905-b5bb-93df3c9f22a2@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ba1b5f76-88eb-67df-29bd-029813303200@redhat.com>
Date: Mon, 13 Jan 2020 15:49:27 +0100
MIME-Version: 1.0
In-Reply-To: <fa490a40-1c58-f905-b5bb-93df3c9f22a2@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata device too small
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>, listac@nebelschwaden.de

Dne 13. 01. 20 v 15:32 Gionatan Danti napsal(a):
> On 12/01/20 19:11, Zdenek Kabelac wrote:
>> With 16G there is 'problem' (not yet resolved known issue) with different 
>> max size used by thin_repair (15.875G) & lvm2 (15.8125G) tools.
>>
>> If you want to go with current max size supported by lvm2 - use the value 
>> -L16192M.
> 
> Hi Zdenek,
> just for confirmation: so using a 16 GiB thin metadata volume *will* result in 
> activation problems? For example, a
> 
> lvcreate --thin system --name thinpool -L 100G --poolmetadatasize 16G
> 
> will be affected by the problem you wrote above?
> 
> Finally, does it means that lvmthin man page is wrong when stating that "Thin 
> pool metadata LV sizes can be from 2MiB to 16GiB" (note the GiB suffix rather 
> than GB)?
> 

Hi

Well the size is 'almost' 16GiB - and when the size of thin-pools metadata is 
always maintained by lvm2 - it's OK -  the size is internally 'clamped' 
correctly - the problem is when you use this size 'externally' - so you make 
16GiB regular LV used for thin-repair - and then you swap-in such LV into 
thin-pool.

So to make it clear - when you 'lvcreate' thin-pool with 16GiB of metadata - 
it will work - but then when you will try to fix such thin-pool - it will 
fail.  So it's always better to create thin-pool with  -L15.812G then using  16G.

Regards

Zdenek
