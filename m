Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1NLhrK01284
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 16:43:53 -0500
Received: from ns3.linuxquebec.com (ns3.linuxquebec.com [64.40.111.7])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1NLhp6S011932
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 16:43:52 -0500
Received: from ns2.linuxquebec.com (unknown [64.18.178.21])
	by ns3.linuxquebec.com (Postfix) with ESMTP id DF8D42B80CB
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 16:53:08 -0500 (EST)
Received: from aragorn.intranet (unknown [10.10.1.116])
	by ns2.linuxquebec.com (Postfix) with ESMTP id B083313ED8
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 16:39:47 -0500 (EST)
From: Paul Pianta <pantz@lqt.ca>
Date: Wed, 23 Feb 2005 16:43:41 -0500
Message-Id: <1109195021.4695.65.camel@aragorn.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm liveCD help needed
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
To: linux-lvm@redhat.com

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
