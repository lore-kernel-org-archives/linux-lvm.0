Message-ID: <542BB112.1030103@redhat.com>
Date: Wed, 01 Oct 2014 09:45:22 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAN_kG3nR8LWs1rwXeOCS76KRhjQ_V1iNMt5_doawOQCquWP_Q@mail.gmail.com>
In-Reply-To: <CAAN_kG3nR8LWs1rwXeOCS76KRhjQ_V1iNMt5_doawOQCquWP_Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin provisioned pool errors
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
To: linux-lvm@redhat.com, timur@maginatics.com

Dne 1.10.2014 v 02:43 Timur Alperovich napsal(a):
> Hi all,
>
> We are using LVM thin in EC2 and recently bumped into an error that seems to
> indicate metadata corruption. I was hoping someone on the list could clarify
> what likely happened and point to what we could do to avoid this in the future
> (any recent patches or other work).
> The device mapper error is repeated until the VM was taken offline and the EBS
> volumes snapshotted. At this point, running thin_check, produces the following:
> examining superblock
> examining devices tree
>    missing devices: [159, 277]
>      bad checksum in btree node
> examining mapping tree
>    missing all mappings for devices: [229, 229]
>      bad checksum in btree nodeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node typeunknown node
> typeunknown node typeunknown node typeunknown node type
>    thin device 230 is missing mappings [57251, -]
>      invalid key
>
> The missing mappings error is repeated for many devices.
>
> At this point, would going through the steps of thin_dump/thin_repair remedy this?
>
> Is there any additional information I can get from the system to understand
> what happened? I wonder if there was an issue with the underlying EBS storage,
> but have no way of confirming that at the moment.
>
> Lastly, this is Ubuntu 12.04 LTS. I did pull in the thin provisioning tools
> version 0.3.1, but the kernel is 3.8.0 (3.8.0-32-generic) and LVM2 package is:
>    LVM version:     2.02.98(2) (2012-10-15)
>    Library version: 1.02.77 (2012-10-15)
>
> Are there known patches that we may be missing that would remedy some of these
> issues?

I'm afraid version 3.8 is very very old for thinp usage.
I'd strongly recommend to use 3.15 or newer kernel with thinp.
(or kernel where patches from this kernel for thinp are backported)

Metadata on these newer kernels have a lot more securing checksums preventing
to do any major damage to them and also they have more hints for repair.

3.8 kernel was from 'early' days of thinp and it's been still not matured enough.

You could try to use latest thin repair tools from git repo - but I've already 
seen metadata which are simply too broken to be repaired from older kernels.

Zdenek
