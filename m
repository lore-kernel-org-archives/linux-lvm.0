Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1P4IlK14286
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 23:18:47 -0500
Received: from mail17.ca.com (mail17.ca.com [155.35.248.106])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1P4IepS017250
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 23:18:40 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvm liveCD help needed
Date: Fri, 25 Feb 2005 15:18:28 +1100
Message-ID: <7C5D17C4190B2A4BBD47C71727973DA701741577@ausyms22.ca.com>
From: "Bao, Liping" <Liping.Bao@ca.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com, pantz@lqt.ca

 
Hi Paul

Several things:
1.several method to mount your root
	a)using "raidautorun" to detect the MDs.
	b)using "raidstart -a -c $RAIDTAB",
	 here you may can not get the raidtab file, you need to compile
one manually. 
	Alternatilvey, "mount /dev/hda3 /mnt/disks", (because the / is
md1, and I assume that /dev/hda3 is one of the partition in the md1).

2./boot can be installed on md0?


Message: 4
Date: Wed, 23 Feb 2005 16:43:41 -0500
From: Paul Pianta <pantz@lqt.ca>
Subject: [linux-lvm] lvm liveCD help needed
To: linux-lvm@redhat.com
Message-ID: <1109195021.4695.65.camel@aragorn.intranet>
Content-Type: text/plain

Hi people

I have a little problem that I was hoping someone might be able to help
me with.

I 'text mode' installed a FC1 installation and was unable to configure
the volume groups or logical volumes (limitation of text mode :( ...). I
thought "that's ok - I will just create them later!" - and this is where
my problem began :)

I configured the 2 x 200G ide drives with software raid as follows:
/dev/md0 - /boot - 100M
/dev/md1 - /     - 10G
/dev/md2 - swap
/dev/md3 - one big physical volume (lvm) ~185G

The system is installed and I assume that it all went onto /dev/md1.
What I wanted to do was to put /usr, /var, and /home in logical volumes
in one large volume group as such:

/vgRoot/lvUsr - 10G
/vgRoot/lvHome - 20G
/vgRoot/lvVar - 120G
with 30G free for playing around with later

Now ...

I have a gentoo live cd (with lvm support) and I assume this is what I
need to use to 
1. create the volume group vgRoot
2. create the three logical volumes lvUsr, lvHome, lvVar
3. copy /usr, /home, /var from /dev/md1 over to these newly created
logical volumes
4. edit /etc/fstab to reflect the new partition layout
5. reboot and dance around the room with my pants down singing 'oh what
a beautiful morning'


My problem is I don't know how to access the lvm support on the gentoo
live cd and even worse than that - I don't know how to get at my /
partition with the live cd because it is a software raid partition and I
don't know how to go about mounting it.

Any ideas would be much appreciated - and I will promise not to drop my
pants whilst singing if we can get this figured out :)

thanks

pantz
