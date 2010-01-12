Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0C3subf032259
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 22:54:59 -0500
Received: from nerv.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0C3sbIX021707
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 22:54:41 -0500
Received: from [IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]
	([IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]) (authenticated bits=0)
	by nerv.dolda2000.com (8.14.3/8.14.3/Debian-5) with ESMTP id
	o0C3sZmS013785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 04:54:36 +0100
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <b74494e61001111026g29f01b4ei2fc339ff980edba7@mail.gmail.com>
References: <1263228858.2845.12.camel@pc7.dolda2000.com>
	<b74494e61001111026g29f01b4ei2fc339ff980edba7@mail.gmail.com>
Date: Tue, 12 Jan 2010 04:54:35 +0100
Message-ID: <1263268475.3246.1.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing a PV from a mirror
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2010-01-11 at 13:26 -0500, Misc Things wrote:
> oh... sorry to hear.
[...]
> i hope you did take a backup ?
> Andrew

Oh, sorry; when I go back and read it, I realize that I was a bit
unclear. :) The LV started working again once I reconnected the PV and
rebooted again, so there's no damage done.

I'm still just wondering how to actually remove the PV from the mirror.

Fredrik Tolf
