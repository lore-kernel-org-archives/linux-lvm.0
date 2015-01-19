Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0JMw7Sl012512
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2015 17:58:08 -0500
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0JMw6cH020720
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2015 17:58:07 -0500
Received: by mail-qa0-f54.google.com with SMTP id w8so25201991qac.13
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2015 14:58:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150119222134.GA17599@agk-dp.fab.redhat.com>
References: <CAPWkaSVZEeL6yP+3ax2Z0Z7iMJQezEGUvVOXZ8PUrA7ytEeA=w@mail.gmail.com>
	<20150119222134.GA17599@agk-dp.fab.redhat.com>
Date: Mon, 19 Jan 2015 15:58:06 -0700
Message-ID: <CAPWkaSV-o0Tf=1yopWbrmKLuEnS6qbp_pEhikgean7M5vitr4w@mail.gmail.com>
From: John Griffith <john.griffith8@gmail.com>
Subject: Re: [linux-lvm] Slow response from lvs and vgs commands
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
Content-Transfer-Encoding: 7bit
To: John Griffith <john.griffith8@gmail.com>, linux-lvm@redhat.com

On Mon, Jan 19, 2015 at 3:21 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> On Mon, Jan 19, 2015 at 02:05:39PM -0700, John Griffith wrote:
>> I'm wondering if there's something I should be looking at more closely
>> to debug this, or if there's a way to filter the lvs and vgs commands
>> to make them more efficient?
>
> Add -vvvv to the command lines and see if that helps you to see
> where the slowness is.
>
> Alasdair
>

Thanks Alasdair,

Turns out I got a great suggestion to wrap this up in strace via the
IRC channel.  Turns out I'm scanning on some devices that are being
plugged in and out of the system and the failure is due to the fact
that the raw device gets ripped out from under the vgscan.

Going to try limiting the devices I interact with via lvm.conf, I
think that will address the issue.

Thanks,
John
