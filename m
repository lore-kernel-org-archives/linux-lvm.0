MIME-Version: 1.0 (Apple Message framework v480)
From: Ken Savich <ken@daydream.net>
Content-Transfer-Encoding: 7bit
Message-Id: <95C2703A-0816-11D6-A497-0003930003F0@daydream.net>
Subject: [linux-lvm] removing a pv from an lv formatted xfs
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Jan 13 05:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Knowing now that xfs cannot be shrunk, I'm stuck with a problem. I have 
one vg that consists of
three pv's

hde = 160gig
hdb = 40gig
hdg = 100gig

that all belong to one lv mount at /u1 with xfs as the filesys

I started this with the first 160 gig that had 103gig of data on it. I 
added hdb and hdg and have since
not written anything to the lv. My problem lies in the fact that hdb is 
now going bad with tons of errors
on umount from the kernel. I need to remove it but I cannot shrink the 
xfs partition that the lv it belongs
to is on. How can I remove this disk? If I remove hdb from the lv 
without shrinking the filesystem, will it whack
my data? Is there any way around this? I'm sure there is only data on 
hde, the original first disk of the vg.
Please, help me so I don't lose my stuff....

I'm using lvm 1.0.1 with kernel 2.4.16 and xfs 1.0.2

thanks a million for any suggestions...

Ken
