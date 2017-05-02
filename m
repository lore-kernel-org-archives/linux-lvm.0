References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<0535f3d744145eceea9121b1e68b622d@assyoma.it>
	<d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
	<4fb6f017d9734892eff6b0ef544d99fc@assyoma.it>
	<20ddda25-dacf-f4e2-8df4-f9bed1c62fe7@redhat.com>
	<c5bee073-7871-fbb9-370d-8a1b322bbd86@assyoma.it>
	<921a6b9c-103e-3c71-97d2-44ceb5a6bf87@redhat.com>
	<f87b9a3de7c1871142cd47251e18c5fe@assyoma.it>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <a8c9afaa-6b63-e60c-e37e-a845fdc8ff40@assyoma.it>
Date: Tue, 2 May 2017 13:00:37 +0200
MIME-Version: 1.0
In-Reply-To: <f87b9a3de7c1871142cd47251e18c5fe@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>



On 26/04/2017 18:37, Gionatan Danti wrote:
> True, but the case exists that, even on a full pool, an application with
> multiple outstanding writes will have some of them completed/commited
> while other get I/O error, as writes to already allocated space are
> permitted while writes to non-allocated space are failed. If, for
> example, I overwrite some already-allocated files, writes will be
> committed even if the pool is completely full.
>
> In past discussion, I had the impression that the only filesystem you
> feel safe with thinpool is ext4 + remount-ro, on the assumption that
> *any* failed writes will trigger the read-only mode. But from my test it
> seems that only *failed metadata updates* trigger the read-only mode. If
> this is really the case, remount-ro really is a mandatory option.
> However, as metadata can reside on alredy-allocated blocks, even of a
> full pool they have a chance to be committed, without triggering the
> remount-ro.
>
> At the same time, I thought that you consider the thinpool + xfs combo
> somewhat "risky", as xfs does not have a remount-ro option. Actually,
> xfs seems to *always* shutdown the filesystem in case of failed metadata
> update.
>
> Maybe I misunderstood some yours message; in this case, sorry for that.
>
> Anyway, I think (and maybe I am wrong...) that the better solution is to
> fail *all* writes to a full pool, even the ones directed to allocated
> space. This will effectively "freeze" the pool and avoid any
> long-standing inconsistencies.
>
> Thanks.
>

Hi Zdeneck, I would *really* to hear back you on these questions.
Can we consider thinlvm + xfs as safe as thinlvm + ext4 ?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
