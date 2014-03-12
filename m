Message-ID: <53201EF8.3020104@redhat.com>
Date: Wed, 12 Mar 2014 09:46:48 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <0b4701cf3d86$4a25d8a0$de7189e0$@acm.org>
In-Reply-To: <0b4701cf3d86$4a25d8a0$de7189e0$@acm.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] migrating a thick LV to a thin LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>, henson@acm.org

On 03/12/2014 01:01 AM, Paul B. Henson wrote:
> I'm looking at converting a system to using thin provisioning, and have a
> handful of existing fixed size LV's I want to migrate to the thinpool.
> Ideally, after the migration they would also be thinly provisioned, only
> taking up the amount of space they are actually using, not their existing
> size. All of them have ext4 filesystems on them.
>
> One option would be to use resize2fs to shrink the filesystems down to their
> bare minimum, resize the existing LV to that, dd it onto a thin LV of the
> original size, and then run resize2fs again to bring the filesystem back to
> full capacity without any blocks wasted.
>
> However, I was wondering if I just dd'd the existing LV onto a thin LV of
> the same size, and then ran fstrim, would that release the unused space? I
> see that thin pools support passing down discards to the underlying device,
> but it's not clear whether they also process them internally, freeing up
> space in the thinpool that is no longer in use by the thin LV.

Yes, discarded blocks in the thin-pool data device which are not 
referenced from other thin-volumes (snapshots) are released regardless 
whether the device at the bottom supports discards or not.

-- Martian

>
> Any thoughts?
>
> Thanks.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
