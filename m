Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u69KP7sq014686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Jul 2016 16:25:07 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4407A8553D
	for <linux-lvm@redhat.com>; Sat,  9 Jul 2016 20:25:06 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1bLyoD-0001Jo-3c
	for linux-lvm@redhat.com; Sat, 09 Jul 2016 20:25:05 +0000
Date: Sat, 9 Jul 2016 16:25:03 -0400
From: Brian McCullough <bdmc@buadh-brath.com>
Message-ID: <20160709202503.GB5404@bdmcc-us.com>
References: <20160708155231.GA27423@bdmcc-us.com>
	<fc811677-56eb-ca28-d8a3-605ee72fe287@alteeve.ca>
	<CAEmTpZGkbJQ9-j8k2rMqTw0JKiuAiOz4JvioK4H6keUJkO-BTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEmTpZGkbJQ9-j8k2rMqTw0JKiuAiOz4JvioK4H6keUJkO-BTw@mail.gmail.com>
Subject: Re: [linux-lvm] Copying a raw disk image to LVM2
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

On Sat, Jul 09, 2016 at 10:33:51PM +0500, ???????? ?????????????????? wrote:
> One note: `sync` does not syncs written data, since it affects only
> data, written through filesystem. You should use `dd ....
> conv=fdatasync` instead.

Thank you both.

This is essentially the answer that I got from the Xen group, as well,
so I went ahead and tried it.  No problems.


Brian
