Received: from [10.36.4.54] (vpn1-4-54.ams2.redhat.com [10.36.4.54])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7IBXFNe003648
	for <linux-lvm@redhat.com>; Mon, 18 Aug 2014 07:33:16 -0400
Message-ID: <53F1E47B.5010909@redhat.com>
Date: Mon, 18 Aug 2014 13:33:15 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAA8m+Y1Y_rQC4BX9eaoOj9Xc_8QDsLjZwuV8e+SC4gwYYhVsyQ@mail.gmail.com>
In-Reply-To: <CAA8m+Y1Y_rQC4BX9eaoOj9Xc_8QDsLjZwuV8e+SC4gwYYhVsyQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmetad hang...
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.8.2014 v 19:33 Pirate Fibonacci napsal(a):
> *
> *
> Greeting All...
>
> I've been using the lvm2py lib. after a predictable number usages of my
> application, it appears that lvmetad halts. below is the relevant line from
> top. upon kill the hung instance, my application will continue.
>
>
> 20807 root      20   0 23.934g  29356   3952 R  98.8  0.0  57:13.67 lvmetad
>
> ^^^^r^       ^^^^^^^^^^
>                                                                      % cpu usage
>
> any useful comments on what this maybe?
>
> where may I find the source code for lvmetad ?
>

Hi

lvmetad is part of lvm2 source base spread in couple places:

lvm2/daemons/lvmetad
lmv2/libdaemon
lmv2/libdm


Usually it's best to attach to running lvmetad and explore it in gdb
(getting backtrace)

Also be sure you run with latest version - fixing bug in a year old code is 
not usually helpful.

It's also good if you could prepare a reproducer case (so it could be placed
in test suite)

Zdenek
