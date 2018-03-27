References: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
	<fa1aa317-d9cd-749f-5da0-3f15bf8c4dd1@redhat.com>
	<02958f63-ba2b-a6b5-1629-69581c1af316@assyoma.it>
	<5efcabfd-fad5-a228-8887-b9f4d38d2d1d@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <0a45b797-70f3-6220-b7f5-525aacc40f0e@assyoma.it>
Date: Tue, 27 Mar 2018 12:58:40 +0200
MIME-Version: 1.0
In-Reply-To: <5efcabfd-fad5-a228-8887-b9f4d38d2d1d@redhat.com>
Content-Language: it-IT
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Higher than expected metadata usage?
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 27/03/2018 12:18, Zdenek Kabelac wrote:
> Tool for size estimation is giving some 'rough' first guess/first choice 
> number.
> 
> The metadata usage is based in real-word data manipulation - so while 
> it's relatively easy to 'cup'� a single thin LV metadata usage - once 
> there is a lot of sharing between many different volumes - the exact 
> size estimation
> is difficult - as it depend on the order how the 'btree' has been 
> constructed.
> 
> I.e. it is surely true the i.e. defragmentation of thin-pool may give 
> you a more compact tree consuming less space - but the amount of work 
> needed to get thin-pool into the most optimal configuration doesn't pay 
> off.� So you need to live with cases, where the metadata usage behaves 
> in a bit unpredictable manner - since it's more preferred speed over the 
> smallest consumed space - which could be very pricey in terms of CPU and 
> memory usage.
> 
> So as it has been said - metadata is 'accounted' in chunks for a 
> userspace app (like lvm2 is or what you get with 'dmsetup status') - but 
> how much free space is left in these individual chunks is kernel 
> internal...

Ok, understood.

> It's time to move on, you address 7TB and you 'extremely' care about 
> couple MB 'hint here' - try to investigate how much space is wasted in 
> filesystem itself ;)

Mmm no, I am caring for the couple MBs themselves. I was concerned about 
the possibility to get a full metadata device by writing far less data 
than expected. But I now get the point.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
