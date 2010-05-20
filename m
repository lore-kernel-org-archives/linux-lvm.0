Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4KBLlZp004478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 07:21:49 -0400
Message-ID: <4BF51B3D.5010005@redhat.com>
Date: Thu, 20 May 2010 12:21:33 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>	<20100519162401.GA4163@trillian.comsick.at>
	<4BF4660C.60307@cox.net>
In-Reply-To: <4BF4660C.60307@cox.net>
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

On 05/19/2010 11:28 PM, Ron Johnson wrote:
> On 05/19/2010 11:24 AM, Michael Guntsche wrote:
>> On 2010.05.19 11:58:03 , Digimer wrote:
>>> On 10-05-19 11:43 AM, kevin wrote:
>>>> Howdy,
>>>>
>>>> (fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding
>>>
>>> The mkfs isn't supposed to be there, just set the new drive's
>>> partition to type '8e' (Linux LVM).
>> Or use the full device without any partition at all.
>>
> 
> I wonder if this will have any adverse affects on drives with 4KB 
> sectors?
> 

Not really, if anything it simplifies getting correct alignment for the
data region of the PV.

Regards,
Bryn.
