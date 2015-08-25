Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7PA993n000620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 25 Aug 2015 06:09:09 -0400
Received: from mail.shockmedia.nl (mail.shockmedia.nl [31.7.4.4])
	by mx1.redhat.com (Postfix) with ESMTPS id 4E8528E22A
	for <linux-lvm@redhat.com>; Tue, 25 Aug 2015 10:09:07 +0000 (UTC)
Received: from office.shockmedia.nl ([31.7.3.253] helo=[192.168.8.179])
	by mail.shockmedia.nl with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.82)
	(envelope-from <bram@shockmedia.nl>) id 1ZUBA9-0004Kq-AW
	for linux-lvm@redhat.com; Tue, 25 Aug 2015 12:09:05 +0200
Message-ID: <55DC3EBF.4030703@shockmedia.nl>
Date: Tue, 25 Aug 2015 12:09:03 +0200
From: Bram Klein Gunnewiek <bram@shockmedia.nl>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------080207050508040204000901"
Subject: [linux-lvm] Snapshots on clustered LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------080207050508040204000901
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Currently we are using LVM as backing storage for our DRBD disks in HA 
set-ups. We use QEMU instances on our node's using (local) DRBD targets 
for storage. This enables us to do live migrations between the DRBD 
primary/secondary nodes.

We want to support iSCSI targergets in our HA enviroment. We are trying 
to see if we can use (c)lvm for that by creating a volume group of our 
iSCSI block devices and use that volume group on all nodes to create 
logical volumes. This seems to work fine if we handle locking etc 
properly and make sure we only activate the logical volumes on one node 
at a time. As long as we only have a volume active on one node snapshots 
seem to work fine also.

However, we run into problems when we want to perform a live migration 
of a running QEMU instance. In order to do a live migration we have to 
start a second similar QEMU on the node we want to migrate to and start 
a QEMU live migration. In order for us to do that we have to make the 
logical volume active on the target node otherwise we can't start the 
QEMU instance. During the live migration QEMU ensures that data is only 
written on one node (e.g. during the live migration data will be written 
on the source node, QEMU wil then pause the instance for a short while 
when copying the last data and will then continue the instance on the 
target node).

This use case works fine with a clustered LVM set-up except for 
snapshots. Changes are not saved in the snapshot when the logical volume 
is active on both nodes (as expected if the manual is correct: 
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html-single/Logical_Volume_Manager_Administration/#snapshot_volumes). 


If we are correct it means we can use lvm for as clustered "file system" 
but can't trust our snapshots to be 100% reliable if a volume group has 
been made active on more then one node. E.G. when doing a live migration 
between two nodes of a QEMU instance our snapshots become unreliable.

Are these conclusions correct? Is there a solution for this problem or 
is this simply a known limitation of clustered lvm without a work-around?

-- 
Met vriendelijke groet / Kind regards,
Bram Klein Gunnewiek | Shock Media B.V.

Tel: +31 (0)546 - 714360
Fax: +31 (0)546 - 714361
Web: https://www.shockmedia.nl/


--------------080207050508040204000901
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <p style="margin-bottom: 0in; line-height: 100%">Currently we are
      using LVM as backing storage for our DRBD disks in HA set-ups. We
      use
      QEMU instances on our node's using (local) DRBD
      targets for storage. This enables us to do live migrations between
      the DRBD primary/secondary nodes.
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">We want to support
      iSCSI targergets in our HA enviroment. We are trying to see if we
      can
      use (c)lvm for that by creating a volume group of our iSCSI block
      devices and use that volume group on all nodes to create logical
      volumes. This seems to work fine if we handle locking etc properly
      and make sure we only activate the logical volumes on one node at
      a
      time. As long as we only have a volume active on one node
      snapshots
      seem to work fine also.
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">However, we run
      into
      problems when we want to perform a live migration of a running
      QEMU
      instance. In order to do a live migration we have to start a
      second
      similar QEMU on the node we want to migrate to and start a QEMU
      live
      migration. In order for us to do that we have to make the logical
      volume active on the target node otherwise we can't start the QEMU
      instance. During the live migration QEMU ensures that data is only
      written on one node (e.g. during the live migration data will be
      written on the source node, QEMU wil then pause the instance for a
      short while when copying the last data and will then continue the
      instance on the target node).
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">This use case works
      fine with a clustered LVM set-up except for snapshots. Changes are
      not saved in the snapshot when the logical volume is active on
      both
      nodes (as expected if the manual is correct:
<a class="moz-txt-link-freetext" href="https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html-single/Logical_Volume_Manager_Administration/#snapshot_volumes">https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html-single/Logical_Volume_Manager_Administration/#snapshot_volumes</a>).
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">If we are correct
      it
      means we can use lvm for as clustered "file system" but
      can't trust our snapshots to be 100% reliable if a volume group
      has
      been made active on more then one node. E.G. when doing a live
      migration between two nodes of a QEMU instance our snapshots
      become
      unreliable.
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">
    </p>
    <p style="margin-bottom: 0in; line-height: 100%">Are these
      conclusions correct? Is there a solution for this problem or is
      this
      simply a known limitation of clustered lvm without a work-around?</p>
    <title></title>
    <meta name="generator" content="LibreOffice 4.2.8.2 (Linux)">
    <style type="text/css">
	<!--
		@page { margin: 0.79in }
		p { margin-bottom: 0.1in; line-height: 120% }
	-->
	</style>
    <pre class="moz-signature" cols="72">-- 
Met vriendelijke groet / Kind regards,
Bram Klein Gunnewiek | Shock Media B.V.

Tel: +31 (0)546 - 714360
Fax: +31 (0)546 - 714361
Web: <a class="moz-txt-link-freetext" href="https://www.shockmedia.nl/">https://www.shockmedia.nl/</a></pre>
  </body>
</html>

--------------080207050508040204000901--
