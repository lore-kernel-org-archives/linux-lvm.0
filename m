Date: Mon, 29 Nov 1999 12:19:59 -0500 (EST)
From: Rusty Wickell <twickell@clio.dlib.indiana.edu>
Subject: [linux-lvm] kernel oops.
Message-ID: <Pine.A41.4.20.9911291214440.66338-100000@clio.dlib.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello,

Well, I found that Redhat 6.1 has the updated 1.00 driver for ips
ServeRaid card. So it should work fine with the lvm code. I am still
getting the kernel oops when I do a lvcreate though. 

Is there anything I could be missing? pvcreate and vgcreate work fine,
just not the lvcreate. I am using the lvcreate on two partitions /dev/sdb1
and /dev/sdc1 on a hardware raid5 device. 

Feel free to ask for more info or ask questions.

Thanks,
Rusty


----------------------------------------------------------------------------
Rusty Wickell					200 S. Jordan Ave.
Digital Library Sytem Administrator		Simon 160
Indiana University				Bloomington IN 
812-856-5174					47405
----------------------------------------------------------------------------
