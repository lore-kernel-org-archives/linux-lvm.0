Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAU5etkT006521
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 00:40:55 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAU5ehWC020892
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 00:40:43 -0500
Received: from [72.209.196.211] (ip72-209-196-211.dc.dc.cox.net
	[72.209.196.211]) (authenticated bits=0)
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id mAU5eh74008958
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 00:40:43 -0500
Message-ID: <4932275A.6000905@bmsi.com>
Date: Sun, 30 Nov 2008 00:40:42 -0500
From: "Stuart D. Gathman" <stuart@bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvresize complains about too many metadata
References: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
In-Reply-To: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------080604020306070101040905"
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
--------------080604020306070101040905
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Fabio Coatti wrote:
> Hi all, I'm playing a bit with lvm/raid on linux, (on a pretty
> experimental box) and now I'm facing a problem that leaves me a bit
> stuck
>
> Basically, I've a volume group based on several mdraid partition
> (vg1  with md0/md1/md4 as pvs)
>
> recently I've increased the size of md1/md4 arrays by adding more
> disks and /proc/mdstats shows that the operation was successful.
>   
Why not just add another md device?

--------------080604020306070101040905
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


--------------080604020306070101040905--
