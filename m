Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p24M7WCS029410
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 17:07:32 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p24M7Mqb028068
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 17:07:23 -0500
Received: by eyx24 with SMTP id 24so913975eyx.33
	for <linux-lvm@redhat.com>; Fri, 04 Mar 2011 14:07:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=cG9BWm9Eq0-LhghZfgW-_mkK0yTYDzNSGGwbL@mail.gmail.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<1299275347.11519.19.camel@green>
	<AANLkTi=cG9BWm9Eq0-LhghZfgW-_mkK0yTYDzNSGGwbL@mail.gmail.com>
Date: Fri, 4 Mar 2011 17:07:22 -0500
Message-ID: <AANLkTikq_+vbbWEOLEDUzf6-Ac9FjRNEyeVXGaxD9Mbi@mail.gmail.com>
From: John Drescher <drescherjm@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 4, 2011 at 5:05 PM, John Drescher <drescherjm@gmail.com> wrote:
> On Fri, Mar 4, 2011 at 4:49 PM, Koen Vermeer <koen@vermeer.tv> wrote:
>> On 03/03/2011 06:25 AM, Scott Arthur wrote:
>>> �1 � � �32.3kB �296MB � 296MB � primary � ext4 � � � � boot
>>> �2 � � �296MB � 1000GB �1000GB �extended
>>> �5 � � �296MB � 1000GB �1000GB �logical � � � � � � � �lvm
>>> I'm obviously wanting to expand the LVM partition to fill the
>>> remaining 1TB of space.
>>
>> I'm just a regular LVM user and maybe I'm misunderstanding you, but why
>> not simply add partition #2 as a physical volume? I thought that was one
>> of the advantages of LVM: not having to worry about that kind of thing.
>>
> LVM pvresize is safe. I have done this many times at work. Even with >
> 10TB physical volumes. There is one potential problem if your pv has 2
> metadata areas however it will inform you and in this case it will
> refuse to resize instead of causing breakage.
>

BTW, I did not mention but the fix for this is in the works.

John
