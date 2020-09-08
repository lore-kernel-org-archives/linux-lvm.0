Date: Tue, 8 Sep 2020 12:47:44 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200908174744.GD31357@redhat.com>
References: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
	<6b1c4f75-37ee-caa9-623a-363a8e791e4d@suse.com>
	<53a24f12-9f5e-535d-bf80-83b9db9259c6@gmail.com>
	<c5d20f7f-e3f6-6d92-5b79-b73dc167d679@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5d20f7f-e3f6-6d92-5b79-b73dc167d679@suse.com>
Subject: Re: [linux-lvm] [PATCH] lvs: add -o lv_usable
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
To: "heming.zhao" <heming.zhao@suse.com>
Cc: linux-lvm@redhat.com, Zdenek Kabelac <zdenek.kabelac@gmail.com>

On Tue, Sep 08, 2020 at 02:40:43PM +0800, heming.zhao wrote:
> Does it acceptable to add new status bit in lv->status?
> I ever sent it in previoud patch "[PATCH v2] lib/metadata: add new api lv_is_available()"
> The define as below (the 'NOT_AVAIL_LV' will change to 'NOT_USABLE_LV'):
> ```
> +#define NOT_AVAIL_LV	UINT64_C(0x0000000080000000)	/* LV - derived flag, not
> +							   written out in metadata*/
> 
> +#define lv_is_available(lv)	(((lv)->status & NOT_AVAIL_LV) ? 0 : 1)
> ```
> 
> some description about the new patch:
> - it will combine with two patches:
>   - [PATCH v2] lib/metadata: add new api lv_is_available()
>   - [PATCH] lvs: add -o lv_usable
> - the new patch will add new status bit NOT_USABLE_LV, and this bit will be
>   set in _lv_mark_if_partial_single().
> - The only output which related with new status bit: lvs -o lv_usable
> 
> if above is acceptable, I will send the v2 patch. if not, I will give up this 'lv_usable' patch.

That sounds better, the old patch was closer to what we need.  It can look
at the PVs listed for the LV in the metadata, and check if those PVs have
a device on the system (pv->dev is set) and are not flagged missing.
device mapper state would not be needed for that (lv_mapping_table
dm_has_lvdev functions are not needed.)

To report info about the active state of LVs is more complex and requires
different sort of code as Zdenek mentioned.

Dave
