Message-Id: <3.0.6.32.20001007110904.00a70b30@203.16.214.248>
Date: Sat, 07 Oct 2000 11:09:04 +0900
From: Richard Sharpe <sharpe@ns.aus.com>
Subject: [linux-lvm] Creating a snapshot hangs the file system
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

I have 2.4.0test9 on my system, and I downloaded the lvm utils, made them,
and then created a pv group (test_pv) and a LV.

I then created a file system on it, and started writing about 1GB to the
file system in a loop ...

I then created a snapshot, and my writing process hung! Lots of error
messages came up as well.

Finally, I could not shutdown, as it said device in use for a lot of file
systems.

I had one problem when making. Could not fine gnu/types.h so I linked
sys/types.h to it. Was that wrong?

Regards
-------
Richard Sharpe, sharpe@ns.aus.com
Samba (Team member, www.samba.org), Ethereal (Team member, www.zing.org)
Contributing author, SAMS Teach Yourself Samba in 24 Hours
Author, Special Edition, Using Samba
