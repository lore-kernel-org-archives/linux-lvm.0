Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6D278DF0
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 13:26:19 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C3FC5D9E9
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 13:26:17 +0000 (UTC)
References: <59E60975.2000001@strike.wu.ac.at>
	<378f8596-dfae-2557-a53f-b614940bba22@strike.wu.ac.at>
	<0f68ed1ad140673541aa8a896b78de6e@assyoma.it>
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <1e1fd522-2fbe-efa2-3fea-6a9798a27a56@strike.wu.ac.at>
Date: Mon, 23 Oct 2017 15:26:09 +0200
MIME-Version: 1.0
In-Reply-To: <0f68ed1ad140673541aa8a896b78de6e@assyoma.it>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to recover from degraded raid1 with thin pool
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

On 10/20/2017 11:06 PM, Gionatan Danti wrote:
> Il 19-10-2017 13:45 Alexander 'Leo' Bergolth ha scritto:
>> On 10/17/2017 03:45 PM, Alexander 'Leo' Bergolth wrote:
>>> I just tested lv activation with a degraded raid1 thin pool.
>>> Unfortunately it looks like activation mode=degraded only works for
>>> plain raid1 lvs. If you add a thin pool, lvm won't activate it in
>>> degraded mode. (Unless you specify --activationmode partial, which is
>>> IMHO rather dangerous.)
>>
>> Unfortunately I cannot even replace a faulty PV if a thin pool is
>> present.
> 
> From you command history, I can see you are trying to remove the failed
> device (to re-add a good device later).
> Instead, can you try with lvconvert --repair or lvconvert --replace? Do
> they works?

lvconvert --repair doesn't work because there is also a linear LV
("boot") on this VG, which already has the error target assigned instead
of the missing PV:

-------------------- 8< --------------------
# lvconvert --repair /dev/vg_test/boot /dev/vdd
  WARNING: Disabling lvmetad cache for repair command.
  WARNING: Not using lvmetad because of repair.
  Couldn't find device with uuid 5ORr1v-kn3T-ROJW-quEg-0Lp5-3kdX-M3jr8S.
Attempt to replace failed RAID images (requires full device resync)?
[y/n]: y
  vg_test/boot has components with error targets that must be removed
first: vg_test/boot_rimage_1.
  Try removing the PV list and rerun. the command.
  Failed to remove the specified images from vg_test/boot.
  Failed to replace faulty devices in vg_test/boot.
-------------------- 8< --------------------

(But removing the missing PV doesn't work because of the Thin volume
which is considered as partial as described previously.)


lvconvert --replace also refuses to process bcause of the missing PV:
-------------------- 8< --------------------
# lvconvert --replace 5ORr1v-kn3T-ROJW-quEg-0Lp5-3kdX-M3jr8S
vg_test/Thin_tdata /dev/vdd
  Couldn't find device with uuid 5ORr1v-kn3T-ROJW-quEg-0Lp5-3kdX-M3jr8S.
  Cannot change VG vg_test while PVs are missing.
  Consider vgreduce --removemissing.
  Cannot process volume group vg_test
-------------------- 8< --------------------

--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
