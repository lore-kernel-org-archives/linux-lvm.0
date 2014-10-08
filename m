Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s98MipFH006047
	for <linux-lvm@redhat.com>; Wed, 8 Oct 2014 18:44:51 -0400
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s98MimRH020440
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 8 Oct 2014 18:44:50 -0400
Received: by mail-qa0-f53.google.com with SMTP id v10so47644qac.40
	for <linux-lvm@redhat.com>; Wed, 08 Oct 2014 15:44:48 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <20140930154918.GB9925@redhat.com>
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
	<542ABFC3.4000909@redhat.com>
	<CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
	<20140930154918.GB9925@redhat.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Thu, 9 Oct 2014 02:44:33 +0400
Message-ID: <CACaajQuvvGhXsAG9FUjJ3p_EbwZ6XovFuY_9eU-fhHppi_5_YQ@mail.gmail.com>
Subject: Re: [linux-lvm] thin pool and discards
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2014-09-30 19:49 GMT+04:00 Mike Snitzer <snitzer@redhat.com>:
> You likely need this upstream commit:
> http://git.kernel.org/linus/19fa1a6756ed9e92daa9537c03b47d6b55cc2316
>
> Though that commit was tagged for stable.  So not sure.
>
> In general, upstream dm-thinp saw quite a few improvements that in
> combination results in a much more stable dm-thinp (particularly error
> handling from faults and out of space conditions).
>
> RHEL7 does include these changes.


Thanks! Rhel kernel works fine for me. Does it possible to send needed
patches to stable for all other users ?=) As i see this commit does
not in 3.10 stable now.

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
