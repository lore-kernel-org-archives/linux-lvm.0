Message-ID: <20000306222239.14845.qmail@web106.yahoomail.com>
Date: Mon, 6 Mar 2000 14:22:39 -0800 (PST)
From: Chris Campbell <dash_ampersand@yahoo.com>
Subject: [linux-lvm] building the binary utilities
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I got a patched kernel to compile ok, but now I have
problems building the binary lvm utilities.  There are
errors about not being about to find lvm.h and
liblvm.h.  I copied them to /usr/include, and then it
got farther but complained about gnu/types.h.  After
symlinking that, I got an error about lots of
redeclarations.  What's going on?  Thanks.



Chris

__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
