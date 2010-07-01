Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o61NOmnE001472
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 19:24:48 -0400
Received: from web120413.mail.ne1.yahoo.com (web120413.mail.ne1.yahoo.com
	[98.138.85.220])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o61NOaQC006800
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 19:24:37 -0400
Message-ID: <383964.49593.qm@web120413.mail.ne1.yahoo.com>
Date: Thu, 1 Jul 2010 16:24:36 -0700 (PDT)
From: Philippe Cerfon <philcerf@yahoo.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] when to vgscan/pvscan/lvscan
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
To: linux-lvm@redhat.com

Hi.
Thanks for your reply.

--- On Wed, 6/30/10, Alasdair G Kergon <agk@redhat.com> wrote:
>The safest approach if you want to remove the vgscan at boot is
>to specify the precise VGs you want to activate by name on the
>vgchange command line instead of letting it default to 'all'.
Is it also possible to scan for a specific LV?

When I use udev, will newly added devices be automatically scanned for LVM stuff (i.e. PVs) if they're block devices?

>Then it knows what VGs are supposed to be there, and if it didn't
>think it needed to scan but doesn't see one or more of them that'll
>be enough to trigger the scan.
Nice.

Thanks,
Philippe.


      
