Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7NEAeoD001197
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 10:10:40 -0400
Received: from hobgoblin.beer.org.uk (beer.org.uk [91.84.48.107])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7NEAdbG012007
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 10:10:40 -0400
Received: from hobgoblin.beer.org.uk (hobgoblin [127.0.0.1] (may be forged))
	by hobgoblin.beer.org.uk (8.13.1/8.13.1) with ESMTP id q7NEAcCk012189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 15:10:38 +0100
Message-ID: <39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
In-Reply-To: <CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
Date: Thu, 23 Aug 2012 15:10:38 +0100 (BST)
From: "Vic" <lvm@beer.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
Reply-To: lvm@beer.org.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com


> I wanted to use the free 42.7 G and allocate it to /bin-logs so this is
> what I ran in order to extended
>
> # lvextend -L +42.7G -n /dev/vg0/logs

Well, I usually use lvresize to do this job, but lvextend should be fine.

I wouldn't put that "-n" in, though; mucking around with a filesystem that
needs fscking and not doing so would seem to be asking for trouble...

HTH

Vic.
