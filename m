From: paul@clubi.ie
Message-Id: <200001212321.XAA01797@tribble.medianet.ie>
Subject: [linux-lvm] 0.8i pvcreate doesn't recognise Mylex RAID
Date: Fri, 21 Jan 2000 23:21:46 GMT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

OK, I've compiled and installed 2.2.14+0.8i+devfs 99.10, but still
pvcreate returns an error in pv_get_size when trying to init a
Mylex /dev/rd/.../partX device:

pvcreate  /dev/rd/disc0/part3
pvcreate -- ERROR -241 getting size of physical volume "/dev/rd/disc0/part3"

ls -l /dev/rd/disc0/part3
brw-------   1 root     root      48,   3 Jan  1  1970 /dev/rd/disc0/part3

Any solution to this problem? Where can i teach pv_get_size about
Mylex /dev/rd? Also does it matter that I'm using devfs and hence
have long nested /dev/ path names?

thanks,

Paul Jakma
paul@clubi.ie

---------------------------------------------
