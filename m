Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p27I78Ai019538
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 13:07:08 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p27I6wve004261
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 13:06:59 -0500
Received: by eyx24 with SMTP id 24so1682472eyx.33
	for <linux-lvm@redhat.com>; Mon, 07 Mar 2011 10:06:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <y0msjuy2a1w.fsf@fche.csb>
References: <4D6EA3EF.1070401@bartk.us> <4D6EA4E6.9040201@abpni.co.uk>
	<4D6EC275.6070009@bartk.us> <4D6ECC25.8010502@redhat.com>
	<20110302174412.06eecd67@bettercgi.com> <4D6EDFE0.2040905@bartk.us>
	<y0msjuy2a1w.fsf@fche.csb>
Date: Mon, 7 Mar 2011 10:06:57 -0800
Message-ID: <AANLkTik4vKJ5ysnF6As3Gjsrzzc95S2pzz7p3VhaoaW=@mail.gmail.com>
From: Wendy Cheng <s.wendy.cheng@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Tracing IO requests?
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

My guess is that these reads come from parity disk(s).... And the more
fragmented your blocks, the more read(s) you'll see.

-- Wendy

On Mon, Mar 7, 2011 at 8:02 AM, Frank Ch. Eigler <fche@redhat.com> wrote:
> Bart Kus <me@bartk.us> writes:
>
>>>>> issue is why all the reads? �It should be 99% writes.
>>> cp has to read something before it can write it elsewhere.
>> Ray, my bad, I should have specified, the cp reads from a different
>> volume/set of drives. [...]
>
> One way to try answering such "why" questions is to plop a systemtap
> probe at an event that should not be happening much, and print a
> backtrace. �In your case you could run this for a little while during
> the copy:
>
> # stap -c 'sleep 2' -e '
> probe ioblock.request {
> �if (devname == "sdg2") � � � � � � � �# adjust to taste
> � �if ((rw & 1) == 0) � � � � � � � � �# ! REQ_WRITE
> � � �if (randint(100) < 2) � � � � � � # 2% of occurrences, if you like
> � � � � { println(devname, rw, size)
> � � � � � print_backtrace() }
> }
> '
>
>
> - FChE
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
