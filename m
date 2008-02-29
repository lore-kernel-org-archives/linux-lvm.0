Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1TJrgbo005552
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:53:42 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1TJrCjP030228
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:53:12 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m1TJr70g019968
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:53:07 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m1TJr6IX018967
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:53:07 -0500
Date: Fri, 29 Feb 2008 14:53:06 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
In-Reply-To: <200802291732.m1THWfD7013248@outgoing.mit.edu>
Message-ID: <Pine.LNX.4.44.0802291354300.17897-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 29 Feb 2008 ghudson@MIT.EDU wrote:

>   rm -rf /tmp/test
>   mkdir /tmp/test
>   # Put around 60MB of files into /tmp/test
>   find /tmp/test -type f | xargs md5sum > /tmp/sum.pre

Ran the last four lines several times on my Centos-5 system with
/tmp and the snapshot VG on different volume groups.  (/tmp on rootvg)
# du /tmp/test
84688   /tmp/test
# lvs backvg2/DFL
  LV   VG      Attr   LSize  Origin Snap%  Move Log Copy% 
  DFL  backvg2 -wi-a- 10.00G 

>   lvcreate --size 2G --snapshot /dev/backvg2/DFL --name DFL_snap
>   find /tmp/test -type f | xargs md5sum > /tmp/sum.post
>   lvremove -f /dev/backvg2/DFL_snap
>   diff -u /tmp/sum.pre /tmp/sum.

Doesn't seem to fail for us.  (Sighs with relief.)  

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
