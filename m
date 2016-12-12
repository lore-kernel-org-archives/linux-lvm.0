Received: from [10.34.131.214] (dhcp131-214.brq.redhat.com [10.34.131.214])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCAbtat031131
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2016 05:37:55 -0500
References: <f82ba791c980a1d65f6943888f088b79@openmailbox.org>
	<4cd9f8f50271ad956b6f0668bf186787@openmailbox.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d04f3383-ca18-449f-60c9-fe809ddace5a@redhat.com>
Date: Mon, 12 Dec 2016 11:37:54 +0100
MIME-Version: 1.0
In-Reply-To: <4cd9f8f50271ad956b6f0668bf186787@openmailbox.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce used before resizing file system, what now?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 11.12.2016 v 04:12 veleiro@openmailbox.org napsal(a):
> Nevermind. Figured it out.  resizing to max available did the trick. I was lucky!
>
>  sudo lvresize -l +100%FREE /dev/ubuntu-vg/root
>
> On 2016-12-10 21:38, veleiro@openmailbox.org wrote:
>> Hello,
>>
>> I was following this guide
>> https://help.ubuntu.com/community/ResizeEncryptedPartitions#Detailed_resizing_.2BAH4_Reducing_an_encrypted_partition
>>

And next time you will try to follow some 'dated'  help pages - it's always 
good idea to check 'man' page as well.

If you would did that, you would know about:

lvreduce -r


Regards

Zdenek


PS: BOLD warnings with '!' are not there just for fun...
