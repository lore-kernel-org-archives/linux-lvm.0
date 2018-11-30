References: <d2703951-8ad3-9419-82b3-ead1481c58c1@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4dcb6809-f993-4ab1-ab23-0f424e765cd3@redhat.com>
Date: Fri, 30 Nov 2018 10:52:34 +0100
MIME-Version: 1.0
In-Reply-To: <d2703951-8ad3-9419-82b3-ead1481c58c1@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 30. 11. 18 v 10:35 Gionatan Danti napsal(a):
> Hi list,
> in BZ 1643651 I read:
> 
> "In 7.6 (and 8.0), lvm began using a new i/o layer (bcache)
> to read and write data blocks."
> 
> Last time I checked, bcache was a completely different caching layer, 
> unrelated from LVM. The above quote, instead, implies that bcache is now 
> actively used by LVM.
> 
> Am I missing something? Can you explain how they interact/behave?



Hi


The name of i/o layer bcache is only internal to lvm2 code for caching
reads form disks during disk processing - the name comes from usage
of  bTree and caching - thus the name bcache.

It's not a dm target - so nothing you could use for LVs.
And has nothing in common with exiting  bcache kernel block device.

The only purpose is to slightly accelerate device scanning and probing - and 
helps mostly in cases your system has tons a devices that needs to be scanned,
since this bcache is also using async disk reads for its filling....


Regards

Zdenek
