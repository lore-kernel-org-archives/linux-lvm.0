Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2A8LsDl015580
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 04:21:55 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2A8LN9K030137
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 04:21:24 -0400
Date: Mon, 10 Mar 2008 09:21:21 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Can I create a PV that only uses a portion of a
	partition?
Message-ID: <20080310082120.GA3096@percy.comedia.it>
References: <dd20e5b50803071034j29ca410dm304acf3e7b174f80@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd20e5b50803071034j29ca410dm304acf3e7b174f80@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 07, 2008 at 01:34:16PM -0500, Lionel Kernux wrote:
>I was short-sighted when I created the PV and VG on this machine and
>basically made one giant PV and one giant VG allocating it. Now I'd
>like to be more granular.
creating multiple PV on the same disk makes no sense.
if you were to do this you could well do without LVM and avoid the
hassle.

PV = Physical Volume = LVM idea of a single DISK
VG = Volume Group = a set of PV
LV = Logical Volume = where you put your data

i believe your problem is you created a giant LV, not a giant PV.

in this case you could resize the filesystem that is inside that LV
then lvresize the LV and create more LVs in the remaining space.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
