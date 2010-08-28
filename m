Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7SD7qUe017984
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2010 09:07:52 -0400
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7SD7gxd023117
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2010 09:07:42 -0400
Received: by qyk33 with SMTP id 33so4113242qyk.12
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2010 06:07:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=7+9EGKAG8J52sEKwFgJYnj2t0cUpDpuX3VF5P@mail.gmail.com>
References: <AANLkTi=7+9EGKAG8J52sEKwFgJYnj2t0cUpDpuX3VF5P@mail.gmail.com>
Date: Sat, 28 Aug 2010 22:07:41 +0900
Message-ID: <AANLkTikX3X+Cto3dx-NfHwUAtwGzCYnZ7cUDJiT5KBRZ@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Subject: Re: [linux-lvm] How to "break-off" system disk mirror?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Aug 28, 2010 at 03:45, Jon Price <jonelwoodprice@gmail.com> wrote:
>
>
> Hi,
>
> If we use lvm to mirror our system disk and we are about to install patches, how to "break-off" mirror to have backout in case patches go awry?
>
> Or can you point me to documents/procedures about this?
>

I think this thread should be of interest to you:

http://markmail.org/message/mcotwz2cnhbaful7#query:+page:1+mid:25gvgo4zevee4zt5+state:results

Basically, doesn't seem there is a built-in clean way to "break-off"
your mirror, but there are lots of work-arounds that like good
alternatives.

Romeo
