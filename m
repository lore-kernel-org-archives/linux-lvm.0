Message-ID: <39108F9B.16FC50E0@msede.com>
Date: Wed, 03 May 2000 22:44:11 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] reproducible segfault in vgscan
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message form Paul Jakma <paulj@itg.ie>

-------- Original Message --------
Date: Wed, 3 May 2000 20:03:41 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Subject: reproducible segfault in vgscan
Message-ID: <Pine.LNX.4.21.0005031928440.907-100000@rossi.itg.ie>
MIME-Version: 1.0

i have a reproducible segfault with vgscan.

i had pvmove'd several lv's. Then i rebooted. since then, vgscan
segfaults
the first 3 times  out of every 4 times i run it.

eg:

[root@rossi linux]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Main_VG"
Segmentation fault
[root@rossi linux]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "Main_VG"
Segmentation fault
[root@rossi linux]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "Main_VG"
Segmentation fault
[root@rossi linux]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "Main_VG"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual VGDA backup of your
volume
group

this means i have to call vgscan 4 times in a row from my initscripts
before i can run vgchange.. :(

vgcfgrestore also has the same behaviour. :( segfault, segfault,
segfault, ok, segfault, segfault segfault ok.. etc..

System is 2.3.99-pre6-pre7.

I've looked at the BUGS page but i don't see this problem listed.

Further info available on request..

regards,

Paul Jakma.
