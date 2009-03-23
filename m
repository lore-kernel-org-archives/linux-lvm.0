Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2NLkhVC008815
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 17:46:43 -0400
Received: from idcmail-mo1so.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2NLkObh006618
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 17:46:25 -0400
Date: Mon, 23 Mar 2009 15:46:21 -0600 (MDT)
From: lvm@xresource.ca
Message-ID: <alpine.DEB.2.00.0903231540370.4974@mithril.pollux.laing>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and mirror read balancing
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi everyone.  I have attempted to find out the answer to this myself, 
however I have not found information that satisfactorily answers the
question of whether LVM supports mirror read balancing, i.e., reads from
both mirrors when the volumes are in sync.

The output below would seem to indicate that reads are not balanced, so
I was hoping someone could let me know if there is a configuration
change I can make to enable this feature.

Thanks --
Shaun.


   LV                  VG      Attr   LSize   Origin Snap%  Move Log Copy%  Convert Devices
   root                Mithril mwi-ao  15.00G                        100.00         root_mimage_0(0),root_mimage_1(0)
   [root_mimage_0]     Mithril iwi-ao  15.00G                                       /dev/sda2(106752)
   [root_mimage_1]     Mithril iwi-ao  15.00G                                       /dev/sdb2(55040)

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda              19.26      2031.11       436.86 1554252509  334292784
sdb              13.27         0.01      1682.64       7314 1287595830
