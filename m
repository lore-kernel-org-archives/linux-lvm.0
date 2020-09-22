References: <4972578.pTZnC5dHRY@walnut> <2262429.nQIR6vq4BO@walnut>
	<a8b503ce-ab2f-20b0-05e0-e596459a7756@redhat.com>
	<5115744.4jzXO94mnC@walnut>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8d90a730-8985-7e7d-fdcd-0db609bb36b2@redhat.com>
Date: Tue, 22 Sep 2020 12:59:55 +0200
MIME-Version: 1.0
In-Reply-To: <5115744.4jzXO94mnC@walnut>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why isn't issue_discards enabled by default?
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
To: nl6720 <nl6720@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 22. 09. 20 v 12:38 nl6720 napsal(a):
> On Tuesday, 22 September 2020 13:15:19 EEST Zdenek Kabelac wrote:
>> Dne 22. 09. 20 v 11:14 nl6720 napsal(a):
>>> On Monday, 21 September 2020 21:51:39 EEST Zdenek Kabelac wrote:
>>>> Dne 21. 09. 20 v 16:14 nl6720 napsal(a):
>>>>> Hi,
>> thin-pool is using LVs  - so this is again about handling the discard
>> on a _tdata LV and it is completely unrelated to issue_discards
>> setting.
> 
> from lvmthin(7):
> "passdown: Process discards in the thin pool (as with nopassdown), and
> pass the discards down the the underlying device.  This is the default
> mode."
> 
> It's the "underlying device" that's confusing me.

All it means is -  _tdata LV is placed on some PV/device.

So the passdown means - TRIM goes through thinLV to thin-pool and then through
its _tdata LV it lands on 'underlying device' aka PV used for this LV.

If there is better and less confusing way how to describe this case,
feel free to submit better wording.

Zdenek
