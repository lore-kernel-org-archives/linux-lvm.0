Message-ID: <000401c3aaae$1d689350$e9000a0a@misato>
From: "Henric Andersson" <ha@thedudes.nu>
References: <20031114132620.5e261cc3.neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Nov 14 06:54:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> If I through smb listen to music, and then on the server rm a file about
500mb in size, the music will stop.  Now this is just an example, it's like
the entire filesystem stops while removing the file.  Running reiserfs ontop
of lvm.  Also, when copying through ftp/smb from the server, I max on about
6mb/sec, which is far from the 12.1mb/sec avrange I've gotten out of that
network card before (on a slower computer).
>
> Any suggestions on how to improve performance?

I have the same problem and have not been able to improve the performance.
Even talked to someone on the list that had a raidsystem and he saw a 50%
loss of performance with LVM1 ... I'm going to try out LVM2 later when I get
the time to do some comparison, if you want, I could email you the results
when I've done it.

/Henric
