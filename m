Message-Id: <4.2.2.20000130210903.00a6bc30@pop-server.austin.rr.com>
Date: Sun, 30 Jan 2000 21:14:32 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: Re: [linux-lvm] Couple of question/confusion
In-Reply-To: <20000130212856.A10006@paranoid.zks.net>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Scott Walker <scott@zeroknowledge.com>, linux-lvm@msede.com


>Let me explain (Please offer advice if you want) I have the following
>setup..
>/dev/hdc1 = 1.2G
>/dev/hdd2 = 7.9G
>/dev/hda3 = 1.2G
>/dev/sda1 = 9.11
>
>I wanted to combine all of the above into 1 *partition* for /home. now
>is LVM something I should be looking into or should I just go to linear
>raid? or raid 0?


LVM is perfect for this.

>Now I create my physical volume, but when I want to create my logical I
>keep recieving this error:
>
>freedom /# lvcreate -L100G freedom
>lvcreate -- only 499 free physical extents in volume group "freedom"

>What am I doing wrong?


First, you stated that created the physical volumes... did you also create 
the volume groups?
If you didn't, you'll need to add your physical volumes to a volume group.

i.e:

# vgcreate /dev/hdc1 /dev/hdd2... etc.

At that point, type:

# vgdisplay /dev/vg00

This will tell you how many physical extents that you have available to 
create an LV.  (free PE)
To use all of them in a LV, type
# lvcreate -l <number of PEs> vg00

When you tried a lvcreate -L 100G, btw... you told it to create a 100GB 
file system.


>Please offer some advice, wether LVM is just overkill for me and I
>should just use raid0 or linear.

I'm of the opinion that LVM is *NEVER* overkill.  If you look at AIX or 
HP-UX, they use an LVM for everything.
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
