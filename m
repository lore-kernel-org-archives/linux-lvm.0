Subject: Re: [linux-lvm] LVM 1.0.4 pvmove is broken
Message-ID: <20020523071458.GB866@fib011235813.fsnet.co.uk>
References: <F888C30C3021D411B9DA00B0D0209BE8038F94F7@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F94F7@cvo-exchange.cvo.roguewave.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu May 23 02:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Poul,

It is well known that pvmove of live volumes in LVM1 is broken for a
couple of reasons, the most obvious being the deadlock under memory
pressure that you are experiencing.

I would encourage you to try Stephen Tweedies patch and post your
findings.

In the longer term the solution is to move to LVM2; we are currently
working on pvmove and will have it in the next beta (beginning of
June), pvmove is the last major feature from LVM1 that LVM2 doesn't
yet support.

- Joe
