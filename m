Message-ID: <C3BF2D4A3A74D3118CCF0090278CAAB701B9D956@xboi06.boi.hp.com>
From: "PATTERSON,ANDREW (HP-Loveland,ex2)" <andrew_patterson@hp.com>
Subject: [linux-lvm] How do I remove a physical volume
Date: Fri, 2 Jun 2000 12:58:26 -0600 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

I am doing some development with liblvm and need the capability to remove a
physical volume (so I can then recreate it later as part of testing).  There
doesn't seem be a "pvremove" command or equivalent library call, so I have
resorted to the following brute
force method:

  1. Remove the physical volume from a the volume group
  2. Deactivate the volume
  3. Write arbitrary data to the partition to trash the private volume
record
 
Is it safe to do this?  Is there a better way?  Should there be a pvremove
command?
 
Thanks,

Andrew Patterson
Hewlett-Packard 
