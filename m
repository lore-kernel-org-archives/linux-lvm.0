Date: Tue, 7 Nov 2000 11:55:42 +0100 (CET)
From: Rik van Riel <riel@conectiva.com.br>
Subject: [linux-lvm] LVM 2.2 snapshot bug
Message-ID: <Pine.LNX.4.05.10011071151180.21541-100000@humbolt.nl.linux.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: marcelo@conectiva.com.br, andrea@suse.de

Hi,

I think I found an {easy to fix, very annoying} bug in the
2.2.<ver>aa derived kernel LVM drivers (which, most likely,
is also in Heinz' drivers).

On snapshot creation, the snapshot block device (/dev/vg0/snap1)
is NOT made a read-only device, so ext3 tries to do journal
recovery when the snapshot device is mounted...

(leading to all kinds of nasty oopses)

It should be easy enough to do an set_device_ro() on the LVM
snapshot, shouldn't it?

That would fix the oopses I've been seeing and would make
the snapshot "more useful" ... I hope a fix will be available
soon since I want to use this feature for NL.linux.org :)

regards,

Rik
--
The Internet is not a network of computers. It is a network
of people. That is its real strength.

http://www.conectiva.com/		http://www.surriel.com/
