References: <5735AEE4.4080402@assyoma.it> <20160516185518.GA3320@redhat.com>
	<573AE007.7040603@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <573B1B15.4050204@assyoma.it>
Date: Tue, 17 May 2016 15:22:29 +0200
MIME-Version: 1.0
In-Reply-To: <573AE007.7040603@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Backup superblock for thin provision?
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>


>
> There is always the option to take 'metadata' snapshot and just
> thin_dump content of metadata to a file (located in some 'safe' place)
>

Something as "dmsetup reserve_metadata_snap", thin_dump, "dmsetup 
release_metadata_snap" ? If so, I'm already using for testing purpose ;)

> However validation of 'restore'  if there are some 'snapshots' is
> questionable as the b-tree describing mapped blocks may change
> significantly
> so 'rescued' content may than reference lots of bad blocks.

Sure, with snapshots the situation is surely more complex, as due to the 
CoW the old metadata can point to stale data, right?
>
> If you want to just protect 'superblock' against disk fault - usage
> of 'raid' could be an option - but ATM there are some 'related' costs
> with management of 'stacked' device tree.
>

Both my tmeta and tdata reside on a RAID6 array provided by a 
BBU-protected RAID card, so I should be safe here.


-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
