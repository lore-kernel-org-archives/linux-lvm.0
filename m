From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] File size limit exceeded
Message-ID: <20011217035851.B4880@tiger.bigcats.invalid>
References: <20011217014227.A453@golem.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011217014227.A453@golem.blacknet.de>; from bock@blacknet.de on Mon, Dec 17, 2001 at 01:42:28AM +0100
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
Date: Sun Dec 16 21:12:05 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

Hi, Goetz!

Goetz Bock (bock@blacknet.de) wrote 160 lines:

> I've a strange problem with my LVM:

> root # lvcreate -L 20G -n dragon filebase
> root # mke2fs /dev/filebase/dragon

> File size limit exceeded

Funny, that one popped up over here as well (though I get
it when lvcreate'ing).  I belive it started somewhere after
kernel 1.4.15 or 16 and/or LVM 1.0.1.

Also funny: It works OK from the console, but not under X -- if
I use screen on the console and reconnect to that screen under
X it still works, even creating new windows inside screen.
(Yes, yes, the ulimits are the same under the console and
under X for root.  X itself doesn't run under root, of course.)

-Wolfgang
