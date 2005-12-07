Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB71m7V03795
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 20:48:07 -0500
Received: from mta08-winn.ispmail.ntl.com (mta08-winn.ispmail.ntl.com
	[81.103.221.48])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB71lu56016075
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 20:47:57 -0500
Received: from aamta11-winn.ispmail.ntl.com ([81.103.221.35])
	by mta08-winn.ispmail.ntl.com with ESMTP id
	<20051207014751.NCHZ17804.mta08-winn.ispmail.ntl.com@aamta11-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 01:47:51 +0000
Received: from [192.168.0.9] (really [80.4.95.190])
	by aamta11-winn.ispmail.ntl.com with ESMTP id
	<20051207014751.QPGF16192.aamta11-winn.ispmail.ntl.com@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 01:47:51 +0000
Message-ID: <43963F45.5060104@ntlworld.com>
Date: Wed, 07 Dec 2005 01:47:49 +0000
From: Kelly Harding <kelly.harding@ntlworld.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050009040304090803040304"
Subject: [linux-lvm] LVM problems
Reply-To: kelly.harding@ntlworld.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------050009040304090803040304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've just brought my Debian Linux box back up after a power failure and 
now my LVM set up seems to be non-functional.

I'm not very clued up on LVM tbh, but it has worked so far fine for ages.

I get the following error if I try  to run 'vgchange -a y 3diskvolume:

device-mapper ioctl cmd 11 failed: Invalid argument
   _deps: task run failed for (254:0)
   Failed to add device (254:0) to dtree
   1 logical volume(s) in volume group "3diskvolume" now active

It obviously won't mount after that as mount tells me it can't find the 
superblock etc.

any ideas? is one of the discs dead?

Thanks,

Kelly

--------------050009040304090803040304
Content-Type: text/x-vcard; charset=utf-8;
 name="kelly.harding.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="kelly.harding.vcf"

begin:vcard
fn:Miss Kelly Harding
n:Harding;Kelly
adr:;;;;;;UK
email;internet:kelly.harding@ntlworld.com
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------050009040304090803040304--
