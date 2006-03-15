Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2F09m118542
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 19:09:48 -0500
Received: from omx2.sgi.com (omx2-ext.sgi.com [192.48.171.19])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2F09lBm008728
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 19:09:48 -0500
Received: from internal-mail-relay1.corp.sgi.com
	(internal-mail-relay1.corp.sgi.com [198.149.32.52])
	by omx2.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with ESMTP
	id k2F2I4Ql009437
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 18:18:04 -0800
Received: from mtv-amer002e--3.americas.sgi.com ([192.26.64.114])
	by internal-mail-relay1.corp.sgi.com
	(8.12.9/8.12.10/SGI_generic_relay-1.2) with ESMTP id k2F0F4pS448288
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 16:15:05 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 14 Mar 2006 16:09:45 -0800
Message-ID: <C696CDE385FD4D48A479B5F68E6462AE0129C7A2@mtv-amer002e--3.americas.sgi.com>
From: "Porus Lakdawala" <porus@sgi.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvcreate: invalid stripe size
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

Hi,

I am trying to create an LV with the following command:

lvcreate -i 4 -I <n> -l 69712 vg-name -n lv-name

For all values of <n> <= 8 it gives me an "invalid stripe size" error.

Could someone please explian what the exact constraints are on the value
of <n>?

Thank you very much.
-----
Porus Lakdawala
Phone: (650) 9334576
Email: porus@sgi.com 
