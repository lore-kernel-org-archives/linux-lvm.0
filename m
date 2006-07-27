Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6R9rtWx031829
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 05:53:55 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.185])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6R9rm58018268
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 05:53:48 -0400
Received: by nf-out-0910.google.com with SMTP id x30so106261nfb
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 02:53:48 -0700 (PDT)
Message-ID: <8e3c40600607270252rb63513enc8b024c73fb20728@mail.gmail.com>
Date: Thu, 27 Jul 2006 11:52:15 +0200
From: "Dennis Ortsen" <dortsen@gmail.com>
Subject: Re: [linux-lvm] fc4 lvm2 snapshot problem
In-Reply-To: <200607261603.k6QG3M9Y009452@beta.mvs.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8e3c40600607250434p6ab2936er3986b6e9a4da4e29@mail.gmail.com>
	<20060725220410.GE4633@soda.linbit>
	<200607261603.k6QG3M9Y009452@beta.mvs.co.il>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ehud@unix.mvs.co.il, LVM general discussion and development <linux-lvm@redhat.com>

On 7/26/06, Ehud Karni <ehud@unix.mvs.co.il> wrote:
> On Wed, 26 Jul 2006 00:04:10 +0200, linux-lvm@linbit.com wrote:
> > >
> > > My best guess is udev that is messing about. I don't know whether I can safely
> > > disable udev on a production server. But more importantly: what can I
> > > do to get this properly fixed? Am I missing an important update? Are
> > > there any known conflicts with other packages or third party software
> > > (such as roxen)? Is there anyone who has similar problems?
> >
> > maybe its the same problem?
> > excerpt from my /etc/udev/udev.rules:
> >
> > # device mapper creates its own device nodes, so ignore these
> > #lge: see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=343671
> > #KERNEL=="dm-[0-9]*",           NAME=""
> > KERNEL=="dm-[0-9]*",            OPTIONS+="ignore_device"
> > KERNEL=="device-mapper",        NAME="mapper/control"
>
> It must be this problem. And it is fixed by the line:
>     KERNEL=="dm-[0-9]*",            OPTIONS+="ignore_device"
> but in FC4/FC5 it should be in /etc/udev/rules.d/50-udev.rules .
>
> Ehud.
>

Thanks for pointing to that bug ID. After adding that line to the udev
rules the problem was gone!

Regards,

Dennis
