Date: Fri, 19 Nov 1999 16:35:25 -0500 (EST)
From: Rusty Wickell <twickell@clio.dlib.indiana.edu>
Subject: [linux-lvm] kernel oops.
Message-ID: <Pine.A32.3.94.991119162848.17956A-100000@clio.dlib.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello,

I am installing lvm on a netfinity 5000 using the IBM ServeRAID card. I
have set up a logical paritition with hardware RAID5 that is seen by linux
as /dev/sdb . I was able to pvcreate,vgcreate fine. But when I went to
lvcreate -L5000 -nreallv realvg. It gave the kernel ooops. 'Got lvm
request?' and just hung there. 

Is there something I should know about putting this on top of a hardware
raid5 device. I don't think it should matter since this is hidden from the
os, the os only sees the sdb1 device for use with lvm. 

If you need more info to diagnose my problem, let me know. 

Rusty


----------------------------------------------------------------------------
Rusty Wickell					200 S. Jordan Ave.
Digital Library Sytem Administrator		Simon 160
Indiana University				Bloomington IN 
812-856-5174					47405
----------------------------------------------------------------------------
