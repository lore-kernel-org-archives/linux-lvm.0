Message-ID: <15AD5D7936F8D21198240000F831776E3E8135@dboexc1.dbo.cpqcorp.net>
From: "Jakma, Paul" <Paul.Jakma@compaq.com>
Subject: [linux-lvm] pvcreate doesn't work with /dev/rd (Mylex RAID)
Date: Wed, 19 Jan 2000 13:13:26 -0000
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Hi,

I can't get pvcreate to initialise partitions on a Mylex DAC960 device. I
don't have the error message to hand, but the debug output said that
pv_get_size was unsuccesful.

I tried with /dev/rd/part3, /dev/rd/part5 (ie both primary and logical
partitions)
i tried with partition id set to fe and to 83. no change.

That was with version 0.7. Why can't it grok /dev/rd/ devices?

I would try 0.8i, however when i tried compiling it with 2.2.14+devfs it
croaked at the very end when trying to link vmlinux with an undefined
reference to lvm_init.. :(

regards,

Paul Jakma.
