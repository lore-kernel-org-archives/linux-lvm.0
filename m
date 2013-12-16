Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBGBXl0K022769
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 06:33:47 -0500
Received: from homiemail-a69.g.dreamhost.com (caibbdcaaaaf.dreamhost.com
	[208.113.200.5])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBGBXkBW011107
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 06:33:46 -0500
Received: from homiemail-a69.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a69.g.dreamhost.com (Postfix) with ESMTP id 61FF840119C17
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 03:33:45 -0800 (PST)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a69.g.dreamhost.com (Postfix) with ESMTPSA id
	407C240119C13
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 03:33:45 -0800 (PST)
Message-ID: <52AEE4F7.4040100@libertytrek.org>
Date: Mon, 16 Dec 2013 06:33:11 -0500
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
References: <52AE1740.2060501@libertytrek.org> <52AEC983.6070107@gmail.com>
In-Reply-To: <52AEC983.6070107@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to tell if thin provisioning is used?
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
To: linux-lvm@redhat.com

On 2013-12-16 4:36 AM, Zdenek Kabelac <zdenek.kabelac@gmail.com> wrote:
> Dne 15.12.2013 21:55, Tanstaafl napsal(a):
>> Hello,
>>
>> Is there a way to tell if thin-provisioning is being used on a given
>> volume
>> group?
>>
>
> lvs  -o+segtype
>
> and check if you can see the type: thin or thin-pool.

All came back as 'linear', so I guess that means no thin provisioning here?

Thanks!
