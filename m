Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4CLnKlM029371
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 17:49:20 -0400
Received: from mail.lauwerscollege.nl (a80-127-173-76.adsl.xs4all.nl
	[80.127.173.76])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4CLnIEe031849
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 17:49:19 -0400
Received: from [192.168.1.100] (f14030.upc-f.chello.nl [80.56.14.30])
	(authenticated bits=0)
	by mail.lauwerscollege.nl (8.13.8/8.13.8) with ESMTP id l4CLnCdo016155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 23:49:12 +0200
Message-ID: <464635EE.4020001@lauwerscollege.nl>
Date: Sat, 12 May 2007 23:47:26 +0200
From: Jan Kuipers <jrkuipers@lauwerscollege.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090606020207000105030707"
Subject: [linux-lvm] Fixing up missing format1 size
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
--------------090606020207000105030707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

When I execute vgscan  -v, the output contains this message:

Fixing up missing format1 size (19,53 GB) for PV /dev/cciss/c0d0p2

I something wrong with the PV? Can it be fixed?

FYI: the PV contains the root filesystem of Dom0 of a xen server. The 
server works fine.

Found nothing sofar on this issue.

-- 
Jan Kuipers
Systeembeheer Lauwers College


--------------090606020207000105030707
Content-Type: text/x-vcard; charset=utf-8;
 name="jrkuipers.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="jrkuipers.vcf"

begin:vcard
fn:Jan Kuipers
n:Kuipers;Jan
org:Lauwers College;Systeembeheer
adr:;;De Hoefslag 40;Buitenpost;Friesland;9285 RV;Netherlands
email;internet:jrkuipers@lauwerscollege.nl
tel;work:0511-542415
tel;fax:0511-543915
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------090606020207000105030707--
