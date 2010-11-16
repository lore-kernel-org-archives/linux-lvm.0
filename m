Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAG6PPhu012601
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2010 01:25:25 -0500
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAG6PFFM003064
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2010 01:25:15 -0500
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 02DD786FB9
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2010 07:25:14 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id JM4oxi7M7nzP for <linux-lvm@redhat.com>;
	Tue, 16 Nov 2010 07:25:09 +0100 (CET)
Date: Tue, 16 Nov 2010 07:25:08 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20101116062508.GA17499@maude.comedia.it>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with
	a	particular use-case for pvmove.
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Nov 15, 2010 at 02:53:29PM -0500, Stirling Westrup wrote:
>Okay, I've tried the dd_rescue method that was outlined for me, and it
>failed, although not for any reasons inherent in the method. It seems
>that what is wrong with my 'flakey' drive is not that it has bad
>sectors, but that it has a tendency to heat up when used, and then
>fail all operations until its cooled down.


you can try with http://www.gnu.org/software/ddrescue/ddrescue.html
instead of dd_rescue
make it use a logfile on a different device
when the source drive gets too hot let it rest awhile, then restart
using the log file.

L.

-- 
Luca Berra -- bluca@comedia.it
