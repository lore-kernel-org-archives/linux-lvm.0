References: <582049AF.7010905@strike.wu.ac.at>
	<6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
	<5820A497.80501@strike.wu.ac.at>
	<3c20480f-45e2-5864-cebc-ddc43b563944@redhat.com>
	<5821EC1A.306@strike.wu.ac.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <888348b3-6080-24fc-7dd0-6b37d59c35f1@redhat.com>
Date: Fri, 18 Nov 2016 11:12:18 +0100
MIME-Version: 1.0
In-Reply-To: <5821EC1A.306@strike.wu.ac.at>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] very slow sequential writes on lvm raid1 (bitmap?)
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
To: linux-lvm@redhat.com, leo@strike.wu.ac.at

Dne 8.11.2016 v 16:15 Alexander 'Leo' Bergolth napsal(a):
> On 11/08/2016 10:26 AM, Zdenek Kabelac wrote:
>> Dne 7.11.2016 v 16:58 Alexander 'Leo' Bergolth napsal(a):
>>> On 11/07/2016 11:22 AM, Zdenek Kabelac wrote:
>>> Is there a way to change the regionsize for an existing LV?
>>
>> I'm afraid there is not yet support for runtime 'regionsize' change
>> other then rebuilding array.
>
> Unfortunately even rebuilding (converting to linear and back to raid1)
> doesn't work.
>
> lvconvert seems to ignore the --regionsize option and use defaults:
>
> lvconvert -m 0 /dev/vg_sys/lv_test
> lvconvert --type raid1 -m 1 --regionsize 128M /dev/vg_sys/lv_test
>
> [10881847.012504] mdX: bitmap initialized from disk: read 1 pages, set
> 4096 of 4096 bits
>
> ... which translates to a regionsize of 512k for a 2G volume.



Hi

After doing some simulations here -

What is the actually USB device type used here?

Aren't you trying to deploy some attached SD-Card/USB-Flash  as your secondary 
leg?

Regards

Zdenek
