Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1PE8neO031174
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 09:08:49 -0500
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.26])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1PE7jop023881
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 09:07:45 -0500
Received: by ey-out-2122.google.com with SMTP id 9so7097eyd.39
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 06:07:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <49A54D38.9030309@redhat.com>
References: <1cafab770902250235x39c180a4x63b9e5e6d9a761d5@mail.gmail.com>
	<49A547EB.6020106@redhat.com>
	<1cafab770902250534m38e712cepc2f0c3e80ad93257@mail.gmail.com>
	<49A54D38.9030309@redhat.com>
Date: Wed, 25 Feb 2009 22:07:42 +0800
Message-ID: <1cafab770902250607j4b39a765ua592f672897848b3@mail.gmail.com>
Subject: Re: [linux-lvm] clvmd-corosync should check lksb.sb_status instead of
	return code ?
From: Xinwei Hu <hxinwei@gmail.com>
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

2009/2/25 Chrissie Caulfield <ccaulfie@redhat.com>:
> Xinwei Hu wrote:
>> Hi Chrissie,
>>
>>   You are right. It should be returned in errno. Also, it seems errno
>> should positive as lksb.sb_status too.
>>
>>   I modified the patch a little bit further.
>>
>>   Any comments ?
>
>
> Hi
>
> You're right ... this kernel-itis is catching! lksb status are indeed
> positive and correct for returning as errno.
>
> I'll commit this patch

Good. Thanks for taking care of this.

> Thank you.
>
> Chrissie
>
>> 2009/2/25 Chrissie Caulfield <ccaulfie@redhat.com>:
>>> Xinwei Hu wrote:
>>>> Hi all,
>>>>
>>>>   In clvmd-corosync, lock_resource calls dlm_ls_lock_wait with flags
>>>> set to LKF_NOQUEUE.
>>>>   When LKF_NOQUEUE is set, the return code of dlm_ls_lock_wait is
>>>> always 0, while the actual errno is in lksb.sb_status.
>>>>
>>>>   This causes problem when using vgchange -aey or something like.
>>>>
>>>>   I attached a patch to try to fix this issue.
>>>>
>>>>   Please help to review. Thanks.
>>> Hi
>>>
>>> You are correct, the functions do need to check the LKSB. Your patch
>>> isn't quite right I don't think though - the lksb status should be
>>> returned in errno as shown below:
>>>
>>> --
>>>
>>> Chrissie
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
