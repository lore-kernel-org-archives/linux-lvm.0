Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p57ErhPQ001565
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 10:53:43 -0400
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p57Ergm4006887
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 10:53:42 -0400
Received: by gyd10 with SMTP id 10so2670011gyd.33
	for <linux-lvm@redhat.com>; Tue, 07 Jun 2011 07:53:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1106070822200.11302@bmsred.bmsi.com>
References: <BANLkTi=O_ua2rMCA3Cs4tvvExzjo5cxBOg@mail.gmail.com>
	<alpine.LRH.2.00.1106070822200.11302@bmsred.bmsi.com>
From: Misc Things <formisc@gmail.com>
Date: Tue, 7 Jun 2011 10:53:02 -0400
Message-ID: <BANLkTikGwknQ7r5P76UqifeCeFRkaX=G=g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Installation fails if VG is exported
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

On Tue, Jun 7, 2011 at 8:25 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Mon, 6 Jun 2011, Misc Things wrote:
>
>> During the HDs checking phase, anaconda terminates with the message "
>> unalbe to activate exported VG".
>> I googled around with not much success. The only similar issue was
>> closed in2007 (https://bugzilla.redhat.com/show_bug.cgi?id=191879)
>
> Exporting the VG is *supposed* to prevent activation. �You can reverse this
> with vgimport. �Why did you wish to prevent activation? �Normally,
> vgexport is used prior to physically removing a VG from the system.
> (And then vgimport after attaching the drives to the new system.)

Well, I just want to keep my data intact while i'm playing with the
installation. I understand that @ this point it's just easier to pull
the power on the HDs with the VG in question. But i'm curious why this
is a problem...

Andrew
