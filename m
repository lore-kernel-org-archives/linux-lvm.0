Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JH5fdR026891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:05:42 -0400
Message-ID: <4BF41A57.5010507@redhat.com>
Date: Wed, 19 May 2010 18:05:27 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>	<20100519162601.GA18162@us.ibm.com>	<05c901caf771$a3161920$e9424b60$@com>
	<4BF415FE.5060806@alteeve.com>
In-Reply-To: <4BF415FE.5060806@alteeve.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 05/19/2010 05:46 PM, Digimer wrote:
> On 10-05-19 12:37 PM, kevin wrote:
>>
>>> If I were you, I would not bother with partition(s). I will add the
>>> whole disk to LVM.
>>
>>
>> I intend for the entire disk to be used -- so I should just skip the fdisk
>> step?
>>
>>
>>
>> Thanks,
>>
>>
>> Kevin
>> http://blog.stardothosting.com
> 
> Unless Malahal knows something I don't (which is always possible), then 
> you still need to create a single partition that consumes the whole disk 
> and then assign that to you VG.
> 

Running pvcreate on a whole disk works just fine.

Regards,
Bryn.
