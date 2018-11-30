References: <d2703951-8ad3-9419-82b3-ead1481c58c1@assyoma.it>
	<4dcb6809-f993-4ab1-ab23-0f424e765cd3@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <fcca00bc-8ab3-e9d6-494b-e1c3d82f95ec@assyoma.it>
Date: Fri, 30 Nov 2018 11:03:26 +0100
MIME-Version: 1.0
In-Reply-To: <4dcb6809-f993-4ab1-ab23-0f424e765cd3@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 30/11/2018 10:52, Zdenek Kabelac wrote:
> Hi
> 
> 
> The name of i/o layer bcache is only internal to lvm2 code for caching
> reads form disks during disk processing - the name comes from usage
> of� bTree and caching - thus the name bcache.
> 
> It's not a dm target - so nothing you could use for LVs.
> And has nothing in common with exiting� bcache kernel block device.
> 
> The only purpose is to slightly accelerate device scanning and probing - 
> and helps mostly in cases your system has tons a devices that needs to 
> be scanned,
> since this bcache is also using async disk reads for its filling....
> 

Hi Zdenek, thanks for the information.
I can imagine bcache being instrumental to the deprecation of lvmetad, 
right?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
