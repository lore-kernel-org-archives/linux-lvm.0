Received: from jeltz.chrissie.net (vpn-10-52.str.redhat.com [10.32.10.52])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1PDqvl3027418
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 08:52:57 -0500
Message-ID: <49A54D38.9030309@redhat.com>
Date: Wed, 25 Feb 2009 13:52:56 +0000
From: Chrissie Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd-corosync should check lksb.sb_status instead
	of	return code ?
References: <1cafab770902250235x39c180a4x63b9e5e6d9a761d5@mail.gmail.com>	<49A547EB.6020106@redhat.com>
	<1cafab770902250534m38e712cepc2f0c3e80ad93257@mail.gmail.com>
In-Reply-To: <1cafab770902250534m38e712cepc2f0c3e80ad93257@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Xinwei Hu wrote:
> Hi Chrissie,
> 
>   You are right. It should be returned in errno. Also, it seems errno
> should positive as lksb.sb_status too.
> 
>   I modified the patch a little bit further.
> 
>   Any comments ?


Hi

You're right ... this kernel-itis is catching! lksb status are indeed
positive and correct for returning as errno.

I'll commit this patch

Thank you.

Chrissie

> 2009/2/25 Chrissie Caulfield <ccaulfie@redhat.com>:
>> Xinwei Hu wrote:
>>> Hi all,
>>>
>>>   In clvmd-corosync, lock_resource calls dlm_ls_lock_wait with flags
>>> set to LKF_NOQUEUE.
>>>   When LKF_NOQUEUE is set, the return code of dlm_ls_lock_wait is
>>> always 0, while the actual errno is in lksb.sb_status.
>>>
>>>   This causes problem when using vgchange -aey or something like.
>>>
>>>   I attached a patch to try to fix this issue.
>>>
>>>   Please help to review. Thanks.
>> Hi
>>
>> You are correct, the functions do need to check the LKSB. Your patch
>> isn't quite right I don't think though - the lksb status should be
>> returned in errno as shown below:
>>
>> --
>>
>> Chrissie
