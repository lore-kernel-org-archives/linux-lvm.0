Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A757103CAE
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2020 13:59:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B18F9801181
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2020 13:59:45 +0000 (UTC)
References: <1599752247-30793-1-git-send-email-heming.zhao@suse.com>
	<45b6ac96-64b3-eaaf-aec3-f1864d66a801@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <8194d70b-ade7-24ce-f72a-f570cb0dd26f@suse.com>
Date: Fri, 11 Sep 2020 21:59:24 +0800
In-Reply-To: <45b6ac96-64b3-eaaf-aec3-f1864d66a801@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: teigland@redhat.com



On 9/11/20 8:17 PM, Zdenek Kabelac wrote:
> Dne 10. 09. 20 v 17:37 Zhao Heming napsal(a):
>> The code in vg_read():
>> ```
>> if (missing_pv_dev || missing_pv_flag)
>> ���� vg_mark_partial_lvs(vg, 1);
>> ```
>> the missing_pv_dev not zero when pv->dev is null.
>> the missing_pv_flag not zero when pv->dev is not null but status MISSING_PV is true.
>> any above condition will trigger code to set PARTIAL_LV.
>> So in _lv_mark_if_partial_single(), there should add� '|| (!pv->dev)' case.
>>
>> Below comment by David:
>> And the MISSING_PV flag was not used consistently, so there were cases
>> where pv->dev was null but the flag was not set. So to check for null dev
>> until it's more confidence in how that flag is used.
> 
> 
> Hi
> 
> While the .gitignore patch is no problem, this one is somewhat puzzling.
> 
> Do you have an reproducible test case where you can exercise this code path?
> 
> It seems more logical if we move flag correctly marked for PV
> so is_missing_pv() works - as if it does not - we would have to spread test for� pv->dev!=NULL� check everywhere, which is not really wanted.
> 
> So what we need to check here is all assings of pv->dev needs to handle
> MISSING_PV flag properly.
> 
> Zdenek
> 

I don't have test case. 
There are some code or comments about not consistent issue.
e.g.
1> in _check_devs_used_correspond_with_vg()
        /*
         * FIXME: It's not clear if the meaning
         * of "missing" should always include the
         * !pv->dev case, or if "missing" is the
         * more narrow case where VG metadata has
         * been written with the MISSING flag.
         */

2> in vg_read()
```
     * The PV's device may be present while the PV for the device has the
     * MISSING_PV flag set in the metadata.  This happened because the VG
     * was written while this dev was missing, so the MISSING flag was
     * written in the metadata for PV.  Now the device has reappeared.
     * However, the VG has changed since the device was last present, and
     * if the device has outdated data it may not be safe to just start
     * using it again.
```

3> in _check_pv_ext(), after calling is_missing_pv(), the function
still access (!pvl->pv->dev).

```
    dm_list_iterate_items(pvl, &vg->pvs) {
        if (is_missing_pv(pvl->pv))
            continue;

        /* is_missing_pv doesn't catch NULL dev */
        if (!pvl->pv->dev)
            continue;
```
