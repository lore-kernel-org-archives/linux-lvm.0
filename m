From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14103.41220.857159.602916@dukat.scot.redhat.com>
Date: Fri, 16 Apr 1999 21:43:48 +0100 (BST)
Subject: Re: [linux-lvm] Swap/DB devices
In-Reply-To: <199904151425.AA22497@mailgate1b.telekom.de>
References: <199904150815.AA02380@future-is.orange.co.uk>
	<199904151425.AA22497@mailgate1b.telekom.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: Martyn.AYSHFORD@orange.co.uk, linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de

Hi,

On Thu, 15 Apr 1999 16:24:10 METDST, Heinz Mauelshagen
<mauelsha@ez-darmstadt.telekom.de> said:

> There is a raw device patch available by Stephen Tweedie.
> IIRC it will make it into the 2.3 kernel (what do you say Stephen?).

That's the plan; Linus has approved it in principle.

> LVM has to be enhanced a little bit to support that patch.

I'm curious: why?  I would have thought that LVM should support any
requests coming in through ll_rw_block already.

--Stephen
