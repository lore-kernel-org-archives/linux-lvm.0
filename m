Message-ID: <38C4886B.B98FDDE6@netconnect.com.au>
Date: Tue, 07 Mar 2000 04:41:15 +0000
From: bug1 <bug1@netconnect.com.au>
MIME-Version: 1.0
Subject: [linux-lvm] strip lvmcreate_initrd fails
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

I think ive got everything installed now, one problem i ran into was
when i did make install the installer tried to strip lvmcreate_initrd.

lvmcreate_initrd does not appear to be elf or a.out.

Its easy to work around this by compying by hand and changing file
permissions, but i thought it was worthy of a mention anyway.

Thanks

Glenn McGrath
