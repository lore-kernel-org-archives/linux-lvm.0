References: <1599752247-30793-1-git-send-email-heming.zhao@suse.com>
	<45b6ac96-64b3-eaaf-aec3-f1864d66a801@redhat.com>
	<8194d70b-ade7-24ce-f72a-f570cb0dd26f@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0c95152f-4f2e-7ac7-febe-8db412e97e0c@redhat.com>
Date: Fri, 11 Sep 2020 16:32:45 +0200
MIME-Version: 1.0
In-Reply-To: <8194d70b-ade7-24ce-f72a-f570cb0dd26f@suse.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "heming.zhao@suse.com" <heming.zhao@suse.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: teigland@redhat.com

Dne 11. 09. 20 v 15:59 heming.zhao@suse.com napsal(a):
> 
> 
> On 9/11/20 8:17 PM, Zdenek Kabelac wrote:
>> Dne 10. 09. 20 v 17:37 Zhao Heming napsal(a):
>>> The code in vg_read():
>>> ```
>>> if (missing_pv_dev || missing_pv_flag)
>>>  ���� vg_mark_partial_lvs(vg, 1);
>>> ```
>>> the missing_pv_dev not zero when pv->dev is null.
>>> the missing_pv_flag not zero when pv->dev is not null but status MISSING_PV is true.
>>> any above condition will trigger code to set PARTIAL_LV.
>>> So in _lv_mark_if_partial_single(), there should add� '|| (!pv->dev)' case.
>>>
>>> Below comment by David:
>>> And the MISSING_PV flag was not used consistently, so there were cases
>>> where pv->dev was null but the flag was not set. So to check for null dev
>>> until it's more confidence in how that flag is used.
>>
>>
>> Hi
>>
>> While the .gitignore patch is no problem, this one is somewhat puzzling.
>>
>> Do you have an reproducible test case where you can exercise this code path?
>>
>> It seems more logical if we move flag correctly marked for PV
>> so is_missing_pv() works - as if it does not - we would have to spread test for� pv->dev!=NULL� check everywhere, which is not really wanted.
>>
>> So what we need to check here is all assings of pv->dev needs to handle
>> MISSING_PV flag properly.
>>
>> Zdenek
>>
> 
> I don't have test case.
> There are some code or comments about not consistent issue.

Yep - we know there is some problem somewhere.

There are several commits which may need closer inspecation as they just seem 
to be reacting on some hidden problem in device handling:

2f29765e7fd1135d070310683cf486f07d041c81
98d420200e16b450b6b7e33b83bdf36a59196d6d
607858538132a33a27039e0ff4796b1a7d9f4f32

> e.g.
> 1> in _check_devs_used_correspond_with_vg()
>          /*
>           * FIXME: It's not clear if the meaning
>           * of "missing" should always include the
>           * !pv->dev case, or if "missing" is the
>           * more narrow case where VG metadata has
>           * been written with the MISSING flag.
>           */

MISSING may come from metadata - so even if we can see the device - once
it's marked in lvm2 metadata - we can't work with it - unless it's
vgextend --restoremissing.

> 
> 2> in vg_read()
> ```
>       * The PV's device may be present while the PV for the device has the
>       * MISSING_PV flag set in the metadata.  This happened because the VG
>       * was written while this dev was missing, so the MISSING flag was
>       * written in the metadata for PV.  Now the device has reappeared.
>       * However, the VG has changed since the device was last present, and
>       * if the device has outdated data it may not be safe to just start
>       * using it again.
> ```

Existing logic shell mark as MISSING all PVs that are not available
and preserve already missing PVs as well.

What is currently not well defined is the behavior with new raids - where
a 'temporary' missing device should not be handled by lvm2 and left
for actual md core to be 'covered' - but IMHO I don't think this can work in 
long term - but in some case  handling of MISSING is simply still evolving.

Zdenek
