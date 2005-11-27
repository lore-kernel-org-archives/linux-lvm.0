Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jARMkLV03695
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 17:46:21 -0500
Received: from mail2.cray.com (mail2.cray.com [136.162.64.100])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jARMkKmo014845
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 17:46:20 -0500
Received: from pagliacci.wc.cray.com (pagliacci.us.cray.com [172.28.74.104])
	by mail2.cray.com (8.13.3/8.13.3/gw-5323) with ESMTP id jARMk5bZ028271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 14:46:05 -0800 (PST)
Received: from skoda.octigabay.com (skoda.octigabay.com [172.26.16.36])
	by pagliacci.wc.cray.com (8.13.4/8.13.3/hub-5273) with ESMTP id
	jARMk3sa008044
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 14:46:03 -0800
Received: from fiat.octigabay.com (fiat.octigabay.com [172.26.16.29])
	by skoda.octigabay.com (8.12.10/8.12.10) with ESMTP id jARMk3J1006334
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 14:46:03 -0800
Received: from localhost (localhost [127.0.0.1])
	by fiat.octigabay.com (Postfix) with ESMTP id 926CAEDA84
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 14:53:41 -0800 (PST)
Received: from fiat.octigabay.com ([127.0.0.1])
	by localhost (fiat [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 24522-03 for <linux-lvm@redhat.com>;
	Sun, 27 Nov 2005 14:53:41 -0800 (PST)
Received: from [172.26.17.175] (gurquhart-lin.dhcp.octigabay.com
	[172.26.17.175])
	by fiat.octigabay.com (Postfix) with ESMTP id 3ADB9EDA83
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 14:53:41 -0800 (PST)
Message-ID: <438A372A.3080909@cray.com>
Date: Sun, 27 Nov 2005 14:46:02 -0800
From: Gord Urquhart <gordu@cray.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060001010101070804090309"
Subject: [linux-lvm] No space on device message, Not true
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060001010101070804090309
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all
    I've just install LVM2 on a SLES 9 box, that all went fine. I have
 --- Logical volume ---
  LV Name                /dev/vg01/lvol1
  VG Name                vg01
  LV UUID                4CyIWf-D3iO-mFZG-XiT1-xSXz-j7K2-WSZbEp
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                10.90 TB
  Current LE             2857374
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
  
I have it mounted as /users and am exporting it. On another SLES9 
machine I am mounting it. This all works fine. However when I try to 
create multiple files on it I get  messages like
/users1 # cp -r /usr/local/ .
cp: writing `./local/bin/hssdb': No space left on device
cp: closing `./local/bin/hssdb': No space left on device
cp: closing `./local/lib64/libufp.a': No space left on device

There is scads of space
/users1 # df .
Filesystem           1K-blocks      Used Available Use% Mounted on
s712-5:/users1       11703708896     36960 11703671936   1% /users1

And this only happens on the nodes that NFS mount the file system. On 
the local node everything works fine.

any help would be appreciated
thanks
 gord u





--------------060001010101070804090309
Content-Type: text/x-vcard; charset=utf-8;
 name="gordu.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="gordu.vcf"

begin:vcard
fn:Gord  Urquhart
n:Urquhart;Gord 
org:Cray Canada
adr;dom:Cell 778 229 2220 ;;Desk 604-484-3187
email;internet:gordu@cray.com
title:3rd level support XD1
tel;work:604 484 3187
tel;cell:778 229 2220
x-mozilla-html:TRUE
version:2.1
end:vcard


--------------060001010101070804090309--
