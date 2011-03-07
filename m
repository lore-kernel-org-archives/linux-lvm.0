Received: from fche.csb (vpn-8-169.rdu.redhat.com [10.11.8.169])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p27G2ajf000906
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 11:02:36 -0500
References: <4D6EA3EF.1070401@bartk.us> <4D6EA4E6.9040201@abpni.co.uk>
	<4D6EC275.6070009@bartk.us> <4D6ECC25.8010502@redhat.com>
	<20110302174412.06eecd67@bettercgi.com> <4D6EDFE0.2040905@bartk.us>
From: Frank Ch. Eigler <fche@redhat.com>
Date: Mon, 07 Mar 2011 11:02:35 -0500
In-Reply-To: <4D6EDFE0.2040905@bartk.us> (Bart Kus's message of "Wed,
	02 Mar 2011 16:25:04 -0800")
Message-ID: <y0msjuy2a1w.fsf@fche.csb>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Bart Kus <me@bartk.us> writes:

>>>> issue is why all the reads?  It should be 99% writes.
>> cp has to read something before it can write it elsewhere.
> Ray, my bad, I should have specified, the cp reads from a different
> volume/set of drives. [...]

One way to try answering such "why" questions is to plop a systemtap
probe at an event that should not be happening much, and print a
backtrace.  In your case you could run this for a little while during
the copy:

# stap -c 'sleep 2' -e '
probe ioblock.request {
  if (devname == "sdg2")                # adjust to taste
    if ((rw & 1) == 0)                  # ! REQ_WRITE
      if (randint(100) < 2)             # 2% of occurrences, if you like
         { println(devname, rw, size)
           print_backtrace() }
}
'


- FChE
