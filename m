Message-ID: <B14BF8753E65D211ABCA00104B301EF5015BAF65@cairn-gorm.cragtech.com>
From: Rochelle Lakey <RLakey@Connex.com>
Subject: [linux-lvm] LVM and HW Raid
Date: Thu, 12 Oct 2000 13:20:54 -0700
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "LVM Mailing List (E-mail)" <linux-lvm@msede.com>

Hello All,
My original message still has not been posted.
I'm resending just in case.
Thank you,
Rochelle

-----Original Message-----
From: Rochelle Lakey 
Sent: Wednesday, October 11, 2000 12:06 PM
To: LVM Mailing List (E-mail)
Subject: Help: LVM and HW Raid


Hello,

I am having trouble using HW RAID implementation with LVM.
Using steps in the INSTALL file, I have added the necessary
commands to the startup and halt scripts.  The problem is
upon system startup (after issuing shutdown or reboot) the 
volume groups and logical volumes are in a "bad" state.  I have
to use vgcfgrestore in order to get them recognized and activated
again.  Note: My volume groups, logical volumes and data are 
successfully deactivated and reactived when running a system 
without HW RAID implementation.

My question is there another command or anything I should be aware
of so that this does not happen during system shutdown or reboot?

Thanks,
Rochelle Lakey
