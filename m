From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14103.53832.827914.231586@dukat.scot.redhat.com>
Date: Sat, 17 Apr 1999 01:14:00 +0100 (BST)
Subject: Re: [linux-lvm] Swap/DB devices
In-Reply-To: <199904162148.AA09281@mailgate1b.telekom.de>
References: <14103.41220.857159.602916@dukat.scot.redhat.com>
	<199904162148.AA09281@mailgate1b.telekom.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: sct@redhat.com, mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

Hi,

On Fri, 16 Apr 1999 23:47:06 METDST, Heinz Mauelshagen
<mauelsha@ez-darmstadt.telekom.de> said:

>> I'm curious: why?  I would have thought that LVM should support any
>> requests coming in through ll_rw_block already.

> It's simply a matter of userland (lv_create_node() and friends in lvmlib)
> to create the LVM 'raw' device specials.
> Only regular buffer cached device specials are created up to 0.6.

You won't need to.  The raw device patches create one single new major
number, and let you bind the minor numbers to any block devices you
want.  You can access _any_ block device driver without modification.

--Stephen
