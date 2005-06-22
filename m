Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5MAAuu28345
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 06:10:56 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5MAAlK2000720
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 06:10:48 -0400
Date: Wed, 22 Jun 2005 12:10:41 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM2 Volume and Volume group naming nomenclature
Message-ID: <20050622101041.GC8175@percy.comedia.it>
References: <42B6F00D.3060801@redshift.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42B6F00D.3060801@redshift.com>
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

On Mon, Jun 20, 2005 at 09:34:21AM -0700, Sam Rogers wrote:
>
>But there is a major problem. LVM2 will not (from what I can see) 
>recognize volume group names like VG00. I do not understand? Why type 
I too come from hpux, so

[root@percy ~]# lvs
  LV    VG   Attr   LSize  Origin Snap%  Move Copy%
  lvol1 vg00 -wi-ao 10.00G
  lvol2 vg00 -wi-ao  2.00G
  lvol3 vg00 -wi-ao  1.00G
  lvol4 vg00 -wi-ao  6.00G
  lvol5 vg00 -wi-ao 19.92G
  lvol6 vg00 -wi-ao 32.00G
  lvol7 vg00 -wi-ao  8.00G
  lvol8 vg00 -wi-ao 16.00G
  lvol9 vg00 -wi-ao  8.00G

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
