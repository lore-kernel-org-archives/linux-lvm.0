Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9B4IQ9Z028829
	for <linux-lvm@redhat.com>; Sat, 11 Oct 2008 00:18:26 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9B4IB2u028680
	for <linux-lvm@redhat.com>; Sat, 11 Oct 2008 00:18:11 -0400
Received: by yw-out-2324.google.com with SMTP id 5so272451ywb.81
	for <linux-lvm@redhat.com>; Fri, 10 Oct 2008 21:18:11 -0700 (PDT)
Message-ID: <f4f537b50810102118gb1e7d7el459f56e3d4d06cea@mail.gmail.com>
Date: Fri, 10 Oct 2008 23:18:10 -0500
From: "Eugene Vilensky" <evilensky@gmail.com>
Subject: Re: [linux-lvm] device-mapper may have read performance issue
In-Reply-To: <701452.25518.qm@web92206.mail.cnh.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <alpine.LNX.1.10.0810091047140.19362@bernoulli.globalphasing.com>
	<701452.25518.qm@web92206.mail.cnh.yahoo.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,
How important are these read ahead settings for random, database IO?

On 10/10/08, Ben Huang <ben_devel@yahoo.cn> wrote:
> Hi all,
>
> --- Peter Keller <pkeller@globalphasing.com>д��:
>
>> Hi all,
>>
>> On Wed, 8 Oct 2008, thomas62186218@aol.com wrote:
>>
>> > Ben,
>> >
>> > I have seen this same issue as well. I have
>> created an md device capable of
>> > 425MB/sec using the hdparm -t command, yet an LVM
>> volume fully comprising
>> > this md device only got about 150MB/sec. I am not
>> sure what the issue is. I
>> > am running Ubuntu Hardy 804 server edition,
>> 64-bit.
>> >
>> > -Thomas
>>
>> I have fixed this kind of problem by tweaking the
>> readahead of the LVM
>> volume using 'blockdev --setra' and/or 'blockdev
>> --setfra'.
>
> It make effect
>
>
> blockdev --setra 65536 /dev/md0
> blockdev --setra 65536 /dev/mapper/DG5-lv1
>
> dd if=/dev/md0 of=/dev/null bs=1M
> 353185562624 bytes (353 GB) copied, 420.033 s, 841
> MB/s
>
> dd if=/dev/mapper/DG5-lv1 of=/dev/null bs=1M
> 155551006720 bytes (156 GB) copied, 216.576 s, 718
> MB/s
>
> Warm regards,
> -Ben
>
>
>       ___________________________________________________________
>  �Ż����䣬�����������䣡
> http://cn.mail.yahoo.com/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

-- 
Sent from my mobile device

Eugene Vilensky
evilensky@gmail.com
