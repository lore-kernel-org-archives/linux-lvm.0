Date: Wed, 10 May 2017 11:58:40 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170510165840.GB27800@redhat.com>
References: <CABOR3+xoAwjiE2G_OWS=z7t=GVGSR_=QtpJ8gdP+2e95-kCB1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABOR3+xoAwjiE2G_OWS=z7t=GVGSR_=QtpJ8gdP+2e95-kCB1w@mail.gmail.com>
Subject: Re: [linux-lvm] lvm/openstack: stripe all volumes and distribute
 them round robin on PVs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd <ecki@zusammenkunft.net>
Cc: linux-lvm@redhat.com

On Wed, May 10, 2017 at 01:13:37PM +0200, Bernd wrote:
> Hello,
> 
> when using local lvm2 logical volumes for OpenStack Nova ephemeral pool
> then the created logical volumes are linear (not striped) and what is worse
> than that, all volumes are allocated on the same first physical volume
> (until it is filled up).
> 
> I made a ServerFault question about that:
> 
> https://serverfault.com/questions/849088/automatically-distribute-lvm-stripes-for-specific-lvm2-vg-on-linux/849255#849255
> 
> It was suggested that raid_stripe_all_devices should help (to turn on
> striping by default), but it did not. So I went ahead and patched the
> lvm.py of nova to turn the striping on. However I still wonder if there is
> a lvm option (allocation policy for that).
> 
> Besides that, it looks like it is still creating the first stripe on the
> first device. It would make more sense to have it (even in the linear case)
> to round robin the LVs. Because first of all it might be the most busy part
> of the volume and secondly it helps for keeping room for expanding volumes.
> 
> Is there anything planned in this direction?

If you're concerned with placement of LVs on PVs, I'd probably skip
striping and add some logic specifying different PVs directly:

lvcreate -n name -L size VG PV ...

means the LV will be created using only the specified PVs.
