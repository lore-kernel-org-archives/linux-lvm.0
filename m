Message-ID: <582EE127.8060909@strike.wu.ac.at>
Date: Fri, 18 Nov 2016 12:08:23 +0100
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
References: <582049AF.7010905@strike.wu.ac.at>
	<6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
	<5820A497.80501@strike.wu.ac.at>
	<3c20480f-45e2-5864-cebc-ddc43b563944@redhat.com>
	<5821EC1A.306@strike.wu.ac.at>
	<888348b3-6080-24fc-7dd0-6b37d59c35f1@redhat.com>
In-Reply-To: <888348b3-6080-24fc-7dd0-6b37d59c35f1@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

On 11/18/2016 11:12 AM, Zdenek Kabelac wrote:
> Dne 8.11.2016 v 16:15 Alexander 'Leo' Bergolth napsal(a):
>> On 11/08/2016 10:26 AM, Zdenek Kabelac wrote:
>>> Dne 7.11.2016 v 16:58 Alexander 'Leo' Bergolth napsal(a):
>>>> On 11/07/2016 11:22 AM, Zdenek Kabelac wrote:
>>>> Is there a way to change the regionsize for an existing LV?
>>>
>>> I'm afraid there is not yet support for runtime 'regionsize' change
>>> other then rebuilding array.
>>
>> Unfortunately even rebuilding (converting to linear and back to raid1)
>> doesn't work.
>>
>> lvconvert seems to ignore the --regionsize option and use defaults:
>>
>> lvconvert -m 0 /dev/vg_sys/lv_test
>> lvconvert --type raid1 -m 1 --regionsize 128M /dev/vg_sys/lv_test
>>
>> [10881847.012504] mdX: bitmap initialized from disk: read 1 pages, set
>> 4096 of 4096 bits
>>
>> ... which translates to a regionsize of 512k for a 2G volume.
> 
>
> After doing some simulations here -
> 
> What is the actually USB device type used here?

I did my tests with two 5k-RPM SATA disks connected to a single USB 3.0
port using a JMS562 USB 3.0 to SATA bridge in JBOD mode. According to
lsusb -t, the uas module is in use and looking at
/sys/block/sdX/queue/nr_requests, command queuing seems to be active.

I've discussed my problems with Heinz Mauelshagen yesterday, who was
able to reproduce the issue using two SATA disks, connected to two USB
3.0 ports that share the same USB bus. However, he didn't notice any
speed penalties if the same disks are connected to different USB buses.

So it looks like the problem is USB related...

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
