Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3A1FF052.F2B546DB@ednet.ns.ca>
Date: Sat, 25 Nov 2000 13:01:06 -0400
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Change in startup script
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM Mailing List <linux-lvm@mlists.sistina.com>
Cc: James MacLean <macleajb@ednet.ns.ca>

Hi,

If anybody is upgrading from LVM 0.8i (and probably other 0.8 versions)
to 0.9 you will need to modifying the following startup script which I
got from somebody on this list. The -f needs to be changed to -d to
reflect the new /proc/lvm which is now a directory instead of a file.

Old script:

## LVM
#scan for VGs and create /dev entries.
if [ -x /sbin/vgscan -a -f /proc/lvm ]; then
       action "LVM: Scanning for Volume Groups" /sbin/vgscan
fi
#activate all VGs
if [ -x /sbin/vgchange -a -f /proc/lvm ]; then
       action "LVM: Activating Volume Groups" /sbin/vgchange -ay
fi
## End LVM

________________________________

New script:

## LVM
#scan for VGs and create /dev entries.
if [ -x /sbin/vgscan -a -d /proc/lvm ]; then
       action "LVM: Scanning for Volume Groups" /sbin/vgscan
fi
#activate all VGs
if [ -x /sbin/vgchange -a -d /proc/lvm ]; then
       action "LVM: Activating Volume Groups" /sbin/vgchange -ay
fi
## End LVM
