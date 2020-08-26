Date: Wed, 26 Aug 2020 12:03:20 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200826170320.GA11966@redhat.com>
References: <1598457044-28853-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598457044-28853-1-git-send-email-heming.zhao@suse.com>
Subject: Re: [linux-lvm] [PATCH] lvdisplay: dispaly correct status on linear
	type
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
To: Zhao Heming <heming.zhao@suse.com>
Cc: linux-lvm@redhat.com

On Wed, Aug 26, 2020 at 11:50:44PM +0800, Zhao Heming wrote:
> It commit is enhancement for 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571
> 1d0dc74f9147 only supports all raid type, this commit adds linear type.
> 
> With this patch, for linear type LV, one of two disks missing,
> lvdisplay will show
> from:
>   LV Status              available (partial)
> to:
>   LV Status              NOT available (partial)

It would be nice if you could come up with a more formal definition for
what you're calling "lv_is_available", and also in the same terms define
the existing "lv_is_partial", explaining how they differ.  Both properties
may be useful to show in lvs reporting fields (and possibly lv_attr).
Reporting this state only via the lvdisplay line above seems strange.

> +			} else if (seg_type(seg, s) == AREA_PV) {
> +				if (seg_pv(seg, s)->status & MISSING_PV)

Using only MISSING_PV is probably insufficient, because that flag is used
only when the metadata is written while the device is missing.  i.e.
pv->dev can be NULL when the flag is not set.

Dave
