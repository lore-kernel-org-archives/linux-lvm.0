Date: Wed, 8 Nov 2000 14:44:24 +0100 (CET)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
In-Reply-To: <20001108015534.B15731@homer.sistina.com>
Message-ID: <Pine.LNX.4.05.10011081442460.3666-100000@humbolt.nl.linux.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelshagen@sistina.com>
Cc: linux-lvm@msede.com, sct@redhat.com

On Wed, 8 Nov 2000, Heinz Mauelshagen wrote:

> Chris Mason and I came up with a VFS extension which flushes the Journal,
> sets the FS to a clean state and locks it to enable LVM to activate the
> snapshot and to unlock the filesystem again.

Indeed, I know about this idea and like it a lot.

However, I intend to install a 2.2 kernel with
LVM 0.8 and ext3 for NL.linux.org this week, so
I'm mainly looking for fixes that make stuff
work _now_ :)

regards,

Rik
--
The Internet is not a network of computers. It is a network
of people. That is its real strength.

http://www.conectiva.com/		http://www.surriel.com/
