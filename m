Date: Fri, 27 Aug 1999 23:40:20 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: Re: [linux-lvm] LVM and devices
Message-ID: <19990827234020.A11073@cyberhqz.com>
References: <37C6AE9E.A93F0D8A@geotec.net> <199908271940.AA21078@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199908271940.AA21078@mailgate1b.telekom.de>; from Heinz Mauelshagen on Fri, Aug 27, 1999 at 09:37:13PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Fri, Aug 27, 1999 at 09:37:13PM +0000, Heinz Mauelshagen wrote:
> Run vgscan and VGs should be o.k. again.

If your /dev is 16-aligned...Please make sure that device skipping
"optimization" is removed before being submitted to Linus!

(although that is a user-space thing that wouldn't actually go to
Linus...)

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
