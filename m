From: Patrick Swartz <pswartz@digitalrom.com>
Subject: [linux-lvm] Size limits and kernel versions
Date: Thu, 26 Oct 2000 14:04:39 -0500
Message-ID: <OLEAJMNOEMOMMNEIMMINEEEBCBAA.pswartz@digitalrom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I am just getting start with LVM and have a few questions.  First let me
describe my situation. I have 2 RH7.0 servers each with an ICP-Vortex RAID
controller that is attached to a chassis with 11 50GB drives in a raid5 +
hot spare.  This gives me about 450GB of usable data space.  I would like to
combine these controllers in a single server and use LVM to create one large
logical volume.

Is this possible?

Will I loose the data that is on both? just one?

If so, what kernel patch do I use for RedHat 7.0?

Or, should I install the latest kernel (2.4.0-test9)?

If that is the case what do I need to do to get the user tools to compile?

I have spent most of the day reading the archives and how-to's, but have not
been able to answer these questions.  If I have missed something I
apologize.

Thank you for your help,

Patrick Swartz
pswartz@digitalrom.com
