From: Patrick Swartz <pswartz@digitalrom.com>
Subject: [linux-lvm] Disk striping option
Date: Wed, 8 Nov 2000 13:22:00 -0600
Message-ID: <OLEAJMNOEMOMMNEIMMINMEIECBAA.pswartz@digitalrom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hello all,

I have a question about the use of the LVM native striping option.  Here is
my scenario: I have RH7.0 with an ICP-Vortex Raid controller and 11 Seagate
50G hard-drives in a JBOD chassis that is set up as a single VG.  An older
system has the same configuration without LVM and using RH6.2.
What I want to do is move all of the data from the older system to the LVM
system and then add the old 11 drives to the LVM system to in affect double
my space available.

When I set up the LVM system I used the "-i 11" option to specify all 11
disks, how can I add the next 11 drives so that lvm also stripes those as
well?

Also, do you have any recommendation for a File System to use? This is a
production system so I am a little leery of 0.0.x software, but I am not
crazy about ext2 fcsk on 1TB of data either.

Thanks for any help,
Patrick Swartz
