Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n16FB4HW032357
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:11:04 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n16FAmkZ005319
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:10:48 -0500
Received: from [72.209.196.211] (ip72-209-196-211.dc.dc.cox.net
	[72.209.196.211]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n16FAggv009929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:10:47 -0500
Message-ID: <498C52F2.7050809@bmsi.com>
Date: Fri, 06 Feb 2009 10:10:42 -0500
From: "Stuart D. Gathman" <stuart@bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 specificiation
References: <20090205224659.GU20668@agk.fab.redhat.com>
	<498B6FF5.9010307@gmail.com>
In-Reply-To: <498B6FF5.9010307@gmail.com>
Content-Type: multipart/mixed; boundary="------------050209000507040704090005"
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
--------------050209000507040704090005
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Les Mikesell wrote:
>>
>> It was an early design decision that every VG on a system should have a
>> different name.  Departures from that won't get supported - because
>> it's so
>> simple to choose different names!
> How do you move drives around among machines then, if they have been
> created with the default names that will conflict?

SAN based snapshots are the legitimate reason to wish for multiple VGs
with the same name.  However, it is simpler all around if there was an
easy way to relabel SAN snapshots before the duplicate names (and VGIDs)
cause trouble.

Apart from SAN snapshots, my rule of thumb is that local fixed drives
are always called "rootvg".  All removeable, SAN, or other drives that
are likely to logically or physically move between machines get unique
VG names.  In the rare event I need to mount a rootvg from a failed
machine on a working machine (has happened only once), I boot from CD to
rename it (and the unique VGIDs make this doable).

--------------050209000507040704090005
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


--------------050209000507040704090005--
