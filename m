Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6JDtga28113
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 09:55:43 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6JDtaXn007616
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 09:55:37 -0400
Date: Mon, 19 Jul 2004 15:55:34 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm2 problems adding a new physical volume
Message-ID: <20040719135534.GC7092@percy.comedia.it>
References: <1090076983.4381.15.camel@darrel.wageswebworks.hom>
	<20040719034222.GB23079@agk.surrey.redhat.com>
	<1090238457.3967.3.camel@darrel.wageswebworks.hom>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1090238457.3967.3.camel@darrel.wageswebworks.hom>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 19, 2004 at 07:00:57AM -0500, Darrel Wages Jr. wrote:
>On Mon, 2004-07-19 at 04:42 +0100, Alasdair G Kergon wrote:
>
>> On Sun, Jul 18, 2004 at 09:44:03AM -0500, Darrel Wages Jr. wrote:
>> > I try to extend vg darrel with vgextend but it failed. So I ran
>> 
>> How does it fail?  What error?
>> 
>> Alasdair
>
>
>It doesn't really give me an error It just won't let me add the new
>drive to any volume groups and pvdisplay 
>always say that the new drive is not allocatable even after a pvchange -
>x y /dev/hdd.
you should do vgextend /dev/your_vg_name /dev/hdd

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
