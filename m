Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8QDbI2G022057
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 09:37:19 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8QDaHWU016937
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 09:36:17 -0400
Received: from [72.209.196.211] (ip72-209-196-211.dc.dc.cox.net
	[72.209.196.211]) (authenticated bits=0)
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m8QDaFZ5000557
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 09:36:16 -0400
Message-ID: <48DCE54F.6060707@bmsi.com>
Date: Fri, 26 Sep 2008 09:36:15 -0400
From: "Stuart D. Gathman" <stuart@bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm over loop device
References: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
In-Reply-To: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------030606050406030705040102"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------030606050406030705040102
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

geert Geurts wrote:
> ps. for people interested, I'm trying to create a disk of allot of
> small virtual disks so I can create a encrypted partition on for
> instance gmailfs and minimalize up/download time on changes.
> Pretty cool if it's possible no? 
I think a better solution might be to keep the encrypted fs on a single
normal LV.  Take a snapshot and send to remote.  Keep the snapshot
around.  On next upload, take a 2nd snapshot, and send the diff between
the two snapshots.  The diff can be efficiently computed from the COW
tables - accessible as dw-nn devices.  After sending the diff, delete
the 1st snapshot and go back to "keep snapshot around".



--------------030606050406030705040102
Content-Type: text/x-vcard; charset=utf-8;
 name="stuart.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="stuart.vcf"

begin:vcard
fn:Stuart Gathman
n:Gathman;Stuart
org:Business Management Systems, Inc
adr;dom:;;4001 Williamsburg Court;Fairfax;VA;22032
email;internet:stuart@bmsi.com
tel;work:703 591-0911
tel;fax:703 591-6154
tel;home:703 378-9641
note:AIM: SDGathman
x-mozilla-html:FALSE
url:http://bmsi.com
version:2.1
end:vcard


--------------030606050406030705040102--
