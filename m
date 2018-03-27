References: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
	<c5d1945b-a58e-4e4a-4f0f-83b32635b250@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <3aa5c210-13f1-02d7-6fec-79762087325c@assyoma.it>
Date: Tue, 27 Mar 2018 13:05:22 +0200
MIME-Version: 1.0
In-Reply-To: <c5d1945b-a58e-4e4a-4f0f-83b32635b250@redhat.com>
Content-Language: en-US
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

On 27/03/2018 12:39, Zdenek Kabelac wrote:
> Hi
> 
> I've forget to mention� there is� "thin_ls" tool (comes with 
> device-mapper-persistent-data package (with thin_check) - for those who 
> want to know precise amount of allocation and what amount of blocks is 
> owned exclusively by a single thinLV and what is shared.
> 
> It's worth to note - numbers printed by 'lvs' are *JUST* really rough 
> estimations of data usage for both� thin_pool & thin_volumes.
> 
> Kernel is not maintaining full data-set - only a needed portion of it - 
> and since 'detailed' precise evaluation is expensive it's deferred to 
> the tool thin_ls...

Ok, thanks for the remind about "thin_ls" (I often forgot about these 
"minor" but very useful utilities...)

> And last but not least comment -� when you pointed out 4MB extent usage 
> - it's relatively huge chunk - and if the 'fstrim' wants to succeed - 
> those 4MB blocks fitting thin-pool chunks needs to be fully released. >
> So i.e. if there are some 'sparse' filesystem metadata blocks places - 
> they may prevent TRIM to successeed - so while your filesystem may have 
> a lot of free space for its data - the actually amount if physically 
> trimmed space can be much much smaller.
> 
> So beware if the 4MB chunk-size for a thin-pool is good fit here....
> The smaller the chunk is - the better change of TRIM there is...

Sure, I understand that. Anyway, please note that 4MB chunk size was 
*automatically* chosen by the system during pool creation. It seems to 
me that the default is to constrain the metadata volume to be < 128 MB, 
right?

> For heavily fragmented XFS even 64K chunks might be a challenge....

True, but chunk size *always* is a performance/efficiency tradeoff. 
Making a 64K chunk-sided volume will end with even more fragmentation 
for the underlying disk subsystem. Obviously, if many snapshot are 
expected, a small chunk size is the right choice (CoW filesystem as 
BTRFS and ZFS face similar problems, by the way).

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
