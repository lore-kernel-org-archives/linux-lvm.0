Date: Sun, 30 Jan 2000 21:28:56 -0500
From: Scott Walker <scott@zeroknowledge.com>
Subject: [linux-lvm] Couple of question/confusion
Message-ID: <20000130212856.A10006@paranoid.zks.net>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I started playing with LVM tonight and I am impressed... LVM + resierfs
is nice! But I have a couple problems.

Let me explain (Please offer advice if you want) I have the following
setup..
/dev/hdc1 = 1.2G
/dev/hdd2 = 7.9G
/dev/hda3 = 1.2G
/dev/sda1 = 9.11

I wanted to combine all of the above into 1 *partition* for /home. now
is LVM something I should be looking into or should I just go to linear
raid? or raid 0?

Now I create my physical volume, but when I want to create my logical I
keep recieving this error:

freedom /# lvcreate -L100G freedom
lvcreate -- only 499 free physical extents in volume group "freedom"

What am I doing wrong?

Please offer some advice, wether LVM is just overkill for me and I
should just use raid0 or linear.


-- 
Scott Walker			                Zero Knowledge Systems Inc.
scott@zeroknowledge.com			       http://www.zeroknowledge.com

There are three kinds of people: Those who can count & those who can't.
