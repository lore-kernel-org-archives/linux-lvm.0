Message-ID: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCE1@mail.store-age.com>
From: Sergey Vichik <SVichik@store-age.com>
Subject: [linux-lvm] Protection of used scsi disks by LVM
Date: Thu, 27 Apr 2000 15:52:47 +0200
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>


Hello,

I have a question : 
Why does LVM not protect the scsi devices which are used for volumes ?

I can easily go to /dev/sda1 for example, and erase everything on it.

Of course it is a stupid thing to do, but there is a minimal requirement on
protection, isn't it ?

I cannot think about the way to protect it, because LVM uses those disks as
every other programs.

Any ideas ?

Regards.

Sergey .
