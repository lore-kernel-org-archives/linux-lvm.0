Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8UEvwn2009378
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 10:57:58 -0400
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8UEvtG5023738
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 10:57:56 -0400
Received: by mail-we0-f170.google.com with SMTP id q58so5712376wes.15
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 07:57:55 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <542ABFC3.4000909@redhat.com>
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
	<542ABFC3.4000909@redhat.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Tue, 30 Sep 2014 18:57:40 +0400
Message-ID: <CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2014-09-30 18:35 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Kernel 3.10 is too old,
> Please repeat the test with at least 3.16


Why? As i understand 3.10 lts... Can you say me what patches i need to
cherry pick? Or maybe redhat kernel have this feature...?

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
