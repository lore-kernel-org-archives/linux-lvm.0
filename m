Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAOEgHV23226
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 09:42:17 -0500
Received: from mail1004.centrum.cz (mail1004.centrum.cz [213.29.7.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAOEgFJl014894
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 09:42:15 -0500
Received: by mail255.centrum.cz id S56099344AbVKXOln (ORCPT
	<rfc822;linux-lvm@redhat.com>); Thu, 24 Nov 2005 15:41:43 +0100
Date: Thu, 24 Nov 2005 15:41:43 +0100
From: <drtyc@centrum.cz>
MIME-Version: 1.0
Message-ID: <200511241541.20025@centrum.cz>
Content-Transfer-Encoding: 7BIT
Subject: [linux-lvm] lvm realrootdev group/volume
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

Hello.

If i am not busy this would be already in form of patch. So first I want to apologize for this not being one.

How about adding new command to the set. This one will set correct /proc/sys/kernel/real_root_dev. It's for use in initrd.
Scenario:
initrd
pivot or change root

BTW: And also way of updating /new_root/dev/{mapper,vg_names*}/ entries would be nice.

Or maybe somebody can point me to some mapperfs patches?
