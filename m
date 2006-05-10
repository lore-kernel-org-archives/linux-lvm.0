Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4AKGBrm005484
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 16:16:11 -0400
Received: from smtp-01.arnet.com.ar (smtp-01.arnet.com.ar [200.45.191.24])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k4AKG40M008175
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 16:16:05 -0400
Message-ID: <44623B1C.2040108@arnet.net.ar>
Date: Wed, 10 May 2006 16:12:28 -0300
From: German Staltari <gstaltari@arnet.net.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lot of scsi devices bug
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux clustering <linux-cluster@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi, this is maybe a udev bug, but it affected me when I was creating a 
lv in a cluster, so it could help some with this configuration.
When I added some scsi disk (SAN) to the cluster nodes (more than 64 
SCSI devices),  udev created the device node for capi20 instead of sdbm. 
This produced  a bad behavior in lvm when I was trying to create the 
vg's and lv's, it started to give errors like:

Error locking on node node-06: Internal lvm error, check syslog
Error locking on node node-05: Internal lvm error, check syslog
Error locking on node node-04: Internal lvm error, check syslog
Error locking on node node-01: Internal lvm error, check syslog
Error locking on node node-02: Internal lvm error, check syslog
Error locking on node node-03: Internal lvm error, check syslog
Failed to activate new LV.

When I commented out this lines

SYSFS{dev}="68:0",              NAME="capi20"
SYSFS{dev}="191:[0-9]*",        NAME="capi/%n"
KERNEL=="capi*",                MODE="0660"

in /etc/udev/rules.d/50-udev.rules, everything worked again.

I hope this could help,
German Staltari
