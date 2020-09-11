References: <1599752247-30793-1-git-send-email-heming.zhao@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <45b6ac96-64b3-eaaf-aec3-f1864d66a801@redhat.com>
Date: Fri, 11 Sep 2020 14:17:47 +0200
MIME-Version: 1.0
In-Reply-To: <1599752247-30793-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 1/2] metadata: check pv->dev null when
	setting PARTIAL_LV
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
Cc: teigland@redhat.com

Dne 10. 09. 20 v 17:37 Zhao Heming napsal(a):
> The code in vg_read():
> ```
> if (missing_pv_dev || missing_pv_flag)
>      vg_mark_partial_lvs(vg, 1);
> ```
> the missing_pv_dev not zero when pv->dev is null.
> the missing_pv_flag not zero when pv->dev is not null but status MISSING_PV is true.
> any above condition will trigger code to set PARTIAL_LV.
> So in _lv_mark_if_partial_single(), there should add  '|| (!pv->dev)' case.
> 
> Below comment by David:
> And the MISSING_PV flag was not used consistently, so there were cases
> where pv->dev was null but the flag was not set. So to check for null dev
> until it's more confidence in how that flag is used.


Hi

While the .gitignore patch is no problem, this one is somewhat puzzling.

Do you have an reproducible test case where you can exercise this code path?

It seems more logical if we move flag correctly marked for PV
so is_missing_pv() works - as if it does not - we would have to spread test 
for  pv->dev!=NULL  check everywhere, which is not really wanted.

So what we need to check here is all assings of pv->dev needs to handle
MISSING_PV flag properly.

Zdenek
