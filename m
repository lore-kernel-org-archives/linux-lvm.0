Message-ID: <20021218010957.13924.qmail@web14409.mail.yahoo.com>
From: grenoml <grenoml@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] RH8 install - LVM sizing problem
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
Date: Tue Dec 17 19:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  I am new to LVM and I wanted to use it when I installed a new machine
with RH8.  So going through the install I set everything up with Disk
Druid selecting PV, LV, LVM and gathering all my LV into groups.  I
kept /boot out of the LVM config but everything else is in LVM.  The
layout is shown below.  I have two drives and on the first drive I have
four partitions: dos, /boot, swap and one for /tmp and /var/tmp.  On my
second disk I have one partition (Volume00) and the following
filesystems: /, /usr, /usr/local, /usr/src, /var, /home.
  With plenty of disk space > 100GB I selected an 'Everything' install
and sat back just waiting for everything to complete.  Well, part way
through the install an error displayed saying that I didn't have enough
space on /usr and I needed 1991M more space.  Well /usr was provisioned
for 2GB so I went back and just selected specific packages and tried
again. This time an error displayed saying I needed 1500M more space on
/.  That seemed odd as I had set / to 500M which I thought would be
plenty with a separate /home, /usr, /tmp, /var.  So I went back and did
just a very minimal package selection and tried again.  This time the
installation succeeded.  Finally finished all the additional screens
and it said to have a nice computing experience and then went to a
blank screen and just sat there - dead.  So I pushed the big button and
waited for reboot.  It booted fine and seems to be operating ok but now
I have concerns.

Why was the RH8 installation with LVM needing so much space in / and
/usr?  Was this correct or a bug?

Do I need to expand any of the filesystems to install all the
additional
packages that I was not able to install during installation.

How can I expand the filesystems when LVM commands aren't working?


------------------------------------------------------------------
Here are the results from running some commands:

+ /sbin/pvdisplay
pvdisplay -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

+ /sbin/vgscan
vgscan -- LVM driver/module not loaded?

+ cat /etc/fstab
/dev/Volume02/LogVol00  /                       ext3    defaults       
1 1
LABEL=/boot12           /boot                   ext3    defaults       
1 2
none                    /dev/pts                devpts  gid=5,mode=620 
0 0
/dev/Volume02/LogVol05  /home                   ext3    defaults       
1 2
none                    /proc                   proc    defaults       
0 0
none                    /dev/shm                tmpfs   defaults       
0 0
/dev/Volume01/LogVol00  /tmp                    ext3    defaults       
1 2
/dev/Volume02/LogVol01  /usr                    ext3    defaults       
1 2
/dev/Volume02/LogVol02  /usr/local              ext3    defaults       
1 2
/dev/Volume02/LogVol03  /usr/src                ext3    defaults       
1 2
/dev/Volume02/LogVol04  /var                    ext3    defaults       
1 2
/dev/Volume01/LogVol01  /var/tmp                ext3    defaults       
1 2
/dev/Volume00/LogVol00  swap                    swap    defaults       
0 0
/dev/cdrom              /mnt/cdrom              iso9660
noauto,owner,kudzu,ro 0 0
/dev/hda                /mnt/ls120.0            auto   
noauto,owner,kudzu 0 0
+ df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/Volume02/LogVol00
                        495844     77895    392349  17% /
/dev/hdc2               147778      9594    130554   7% /boot
/dev/Volume02/LogVol05
                       5039616     35736   4747880   1% /home
none                    256976         0    256976   0% /dev/shm
/dev/Volume01/LogVol00
                       5039616     32968   4750648   1% /tmp
/dev/Volume02/LogVol01
                       2015824    844632   1068792  45% /usr
/dev/Volume02/LogVol02
                      10079084     32916   9534168   1% /usr/local
/dev/Volume02/LogVol03
                      10079084     32828   9534256   1% /usr/src
/dev/Volume02/LogVol04
                      15118728     67072  14283656   1% /var
/dev/Volume01/LogVol01
                      51395204     32828  48751588   1% /var/tmp
+ ps -e
  PID TTY          TIME CMD
    1 ?        00:00:05 init
    2 ?        00:00:00 keventd
    3 ?        00:00:01 kapmd
    4 ?        00:00:00 ksoftirqd_CPU0
    5 ?        00:00:00 kswapd
    6 ?        00:00:00 bdflush
    7 ?        00:00:00 kupdated
    8 ?        00:00:00 mdrecoveryd
   15 ?        00:00:00 kjournald
   71 ?        00:00:00 khubd
  208 ?        00:00:00 kjournald
  209 ?        00:00:00 kjournald
  210 ?        00:00:00 kjournald
  211 ?        00:00:00 kjournald
  212 ?        00:00:00 kjournald
  213 ?        00:00:00 kjournald
  214 ?        00:00:00 kjournald
  215 ?        00:00:00 kjournald
  514 ?        00:00:00 dhclient
  553 ?        00:00:00 syslogd
  557 ?        00:00:00 klogd
  574 ?        00:00:00 portmap
  593 ?        00:00:00 rpc.statd
  674 ?        00:00:00 apmd
  712 ?        00:00:00 sshd
  726 ?        00:00:00 xinetd
  740 ?        00:00:00 ntpd
  764 ?        00:00:00 sendmail
  774 ?        00:00:00 sendmail
  784 ?        00:00:00 gpm
  793 ?        00:00:00 crond
  822 ?        00:00:00 xfs
  840 ?        00:00:00 atd
  849 tty1     00:00:00 mingetty
  850 tty2     00:00:00 mingetty
  851 tty3     00:00:00 mingetty
  852 tty4     00:00:00 mingetty
  853 tty5     00:00:00 mingetty
  854 tty6     00:00:00 mingetty
  855 ?        00:00:00 gdm-binary
  900 ?        00:00:00 gdm-binary
  901 ?        03:14:45 X
  910 ?        00:00:01 gnome-session
  952 ?        00:00:00 ssh-agent
  957 ?        00:00:00 gconfd-2
  959 ?        00:00:00 bonobo-activati
  961 ?        00:00:09 metacity
  964 ?        00:00:00 gnome-settings-
  977 ?        00:00:00 xscreensaver
  980 ?        00:00:08 gnome-panel
  982 ?        00:00:03 nautilus
  984 ?        00:00:41 magicdev
  987 ?        00:00:00 pam-panel-icon
  989 ?        00:01:23 rhn-applet-gui
  990 ?        00:00:00 pam_timestamp_c
 1033 ?        00:00:00 nautilus-throbb
 8880 ?        00:00:22 gnome-terminal
 8881 pts/0    00:00:00 bash
 9053 ?        00:00:00 gconfd-2
 9055 ?        00:00:00 gnome-help
 9057 ?        00:00:00 bonobo-activati
 9066 ?        03:32:00 gnome2-info2htm
 9070 ?        00:00:02 yelp
 9085 ?        00:00:33 mozilla-bin
 9691 ?        00:00:00 lpd
 9758 ?        00:00:05 gnome-search-to
 9965 pts/0    00:00:00 bash
 9970 pts/0    00:00:00 ps

------------------------------------------------------------------

Wouldn't LVM be running by default when the system boots?

Additional questions:
Is it better to have / outside of LVM maybe in case of LVM problems?

If it is then should any other filesystems be outside with /.


Regards,
Gerry Reno




__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
