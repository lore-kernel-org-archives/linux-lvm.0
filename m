Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C89F04FA20
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 10:18:23 +0000 (UTC)
Received: from moix.caosdigital.com (moix.caosdigital.com [178.79.168.75])
	by mx1.redhat.com (Postfix) with ESMTP id 8A9F0B15E
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 10:18:21 +0000 (UTC)
Received: from mail-lf0-f52.google.com (unknown [209.85.215.52])
	by moix.caosdigital.com (Postfix) with ESMTPSA id 870E51E76
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 10:18:20 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id g203-v6so27257523lfg.11
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 03:18:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
From: Fran Garcia <fran@caosdigital.com>
Date: Mon, 26 Mar 2018 12:17:49 +0200
Message-ID: <CAD+pdNfFB5mxqgVM6JB1Kz8e0cQjmkFe+AWWx3RSBmkSX-hJ1w@mail.gmail.com>
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 26 March 2018 at 08:04, Gang He <ghe@suse.com> wrote:
>> Gang He schreef op 23-03-2018 9:30:
>>
>>> 6) attach disk2 to VM2(tb0307-nd2), the vg on VM2 looks abnormal.
>>> tb0307-nd2:~ # pvs
>>>   WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not
>>> found or rejected by a filter.
>>>   PV         VG  Fmt  Attr PSize  PFree
>>>   /dev/vdc   vg2 lvm2 a--  20.00g 20.00g
>>>   /dev/vdd   vg1 lvm2 a--  20.00g 20.00g
>>>   [unknown]  vg1 lvm2 a-m  20.00g 20.00g
>>
>> This is normal because /dev/vdd contains metadata for vg1 which includes
>> now missing disk /dev/vdc      .... as the PV is no longer the same.
>
> It looks like each PV includes a copy meta data for VG, but if some PV has changed (e.g. removed, or moved to another VG),
> the remained PV should have a method to check the integrity when each startup (activated?), to avoid such inconsistent problem automatically.

Your workflow is strange. What are you trying to accomplish here?

Your steps in 5 should be:

vgreduce vg01 /dev/vdc /dev/vdc
pvremove /dev/vdc /dev/vdd

That way you ensure there's no leftover metadata in the PVs (specially
if you need to attach those disks to a different system)

Again a usecase to understand your workflow would be beneficial...

Cheers

Fran
