References: <5735AEE4.4080402@assyoma.it> <20160516185518.GA3320@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <573B1A13.7050006@assyoma.it>
Date: Tue, 17 May 2016 15:18:11 +0200
MIME-Version: 1.0
In-Reply-To: <20160516185518.GA3320@redhat.com>
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>



On 16/05/2016 20:55, Mike Snitzer wrote:
>
> There is more to the thinp metadata than just the metadata superblock.
>
> The DM thin-pool's metadata device was purposely split out from the data
> device to allow for additional metadata fault protection using RAID.
>
> I'll defer to the LVM developers for if/how LVM can be used to have
> thinp metadata redundancy even if you don't have multiple devices to be
> able to use a conventional RAID device.
>

Sure - I'm using thinp on a RAID6 volume, with two disks redundancy.

But what about an user error, or a lvm-related bug, which invalidate the 
superblock? In this case, RAID is of no help. On the other side, a 
superblock backup copy can be used to restore the system without major 
data loss.

More in general, how do you deal with metadata backups?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
