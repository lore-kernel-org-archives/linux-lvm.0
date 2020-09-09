References: <1599670049-6641-1-git-send-email-heming.zhao@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <74001d9c-1024-81c9-66f9-d5bc399e1ca1@redhat.com>
Date: Wed, 9 Sep 2020 19:17:42 +0200
MIME-Version: 1.0
In-Reply-To: <1599670049-6641-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH v2] lvs: add -o lv_usable
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zhao Heming <heming.zhao@suse.com>
Cc: teigland@sourceware.org

Dne 09. 09. 20 v 18:47 Zhao Heming napsal(a):
> report LV is usable for upper layer.
> 
> leave issues
> - this patch doesn't contain dm table comparison. So if the disk
>    is removed then re-inserted, but the re-inserted disk
>    major:minor is changed, the code doesn't have ability to detect.
> - raid10: removing any 2 disks will think as array broken.
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
> v2:
> - remove dm table parsing code in _lv_is_usable()
> - add new status bit NOT_USABLE_LV.
>    note, I chose the first available bit 0x0000000080000000
> - _lvusable_disp() uses lv_is_usable() to return usable status
> 
	dm_list_iterate_items(lvseg, &lv->segments) {
>   		for (s = 0; s < lvseg->area_count; ++s) {
>   			if (seg_type(lvseg, s) == AREA_PV) {
> -				if (is_missing_pv(seg_pv(lvseg, s)))
> +				pv = seg_pv(lvseg, s);
> +				if (!(pv->dev) && is_missing_pv(pv)) {
>   					lv->status |= PARTIAL_LV;
> +					lv->status |= NOT_USABLE_LV;
> +				}
>   			}
>   		}
>   	}

Hi

As it can be seen here - there is big intersection with meaning of
PARTIAL_LV.

And the question is - what does it mean in the context of various segment
types.

I believe we need to discuss with Heinz - whether we want to mark
Raid LVs partial in case they are actually 'only leg-pertial' and should
be actually activatable without partial activation  - which is ATM abused for 
this purpose.

ATM I'm not sure we want to introduce new flags, which has only slight
deviation from current partial flag - which should deserve closer look
of its meaning.

We'll try to find something with Heinz to agree with.


Zdenek
