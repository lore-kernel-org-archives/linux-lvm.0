Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A12026246F
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2018 17:21:36 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AFB958E27
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2018 17:21:34 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id v5so17060809lfe.7
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2018 09:21:34 -0800 (PST)
MIME-Version: 1.0
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
	<ede72436-8c3c-aca9-e865-5525f9d74f0a@gmail.com>
	<e322a4b89bfd07c84c6ff22ac7bdc8a3@cs.uni-dortmund.de>
In-Reply-To: <e322a4b89bfd07c84c6ff22ac7bdc8a3@cs.uni-dortmund.de>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Fri, 16 Nov 2018 11:21:21 -0600
Message-ID: <CAAMCDeevPqo61hvm9EzQ4_Ua81ZnGYxnsh_dQ8xhyG8fWhkdvw@mail.gmail.com>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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
Cc: zdenek.kabelac@gmail.com

Why aren't you just using sudo for this?
On Fri, Nov 16, 2018 at 11:14 AM Christoph Pleger
<christoph.pleger@cs.uni-dortmund.de> wrote:
>
> Hello,
>
> > How do you plan to 'authorize' passed command line options ??
>
> My program has no command line options. It just takes PAM_USER from PAM
> environment and creates a logical volume /dev/vg1/$PAM_USER, creates a
> filesystem and changes directory permissions of the top directory of the
> new filesystem.
>
> > lvm2 is designed to be always executed with root privileges - so it's
> > believed admin knows how he can destroy his own system.
> >
> > It is NOT designed/supposed to be used as suid binary - this would
> > give user a way to big power to very easily destroy your filesystem
> > and gain root privileges (i.e.by overwriting  /etc/passwd file)
>
> Either you misunderstood what I mean, or I am misunderstanding what you
> mean - I do not set lvcreate suid root, but a program that has only a
> small and well defined set of instructions (described above) and that
> restricts its execution to only one user (by checking the real uid
> before setuid(0)).
>
> Regards
>    Christoph
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
