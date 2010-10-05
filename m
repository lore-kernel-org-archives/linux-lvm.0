Message-ID: <4CAB480A.8050906@cfl.rr.com>
Date: Tue, 5 Oct 2010 11:45:14 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
	<4CAB14C9.7040707@redhat.com>
In-Reply-To: <4CAB14C9.7040707@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] moving an LVM as an ISO can be moved
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
To: sugupta@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On 10/5/2010 8:06 AM, Sunil Gupta wrote:
> Use vgexport or snapshots. but if you are using the removable media then
> use any backup  device disk tape etc.

vgexport is to remove a physical volume from the set, while leaving any
logical volumes it holds in place.  It sounds like the OP does not want
to do that, but rather copy a volume over the network.

> --Sunil
> 
> Tapas Mishra wrote:
>> Can an LVM be copied or transferred to some remote server in a similar
>> fashion as I can do with ISO.
>> I copy the ISO at one one place to some other location and on the
>> second location I can mount this ISO
>> as a loopback device and do what ever I want.
>> Is similar thing possible with an LVM.

This is unrelated to LVM but if you want to image a disk volume you do
so the same way as with a cd/iso image: use dd.
