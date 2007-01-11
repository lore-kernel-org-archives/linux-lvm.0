Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0B8pwcD026565
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 03:51:58 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.227])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0B8pv4O006566
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 03:51:58 -0500
Received: by wx-out-0506.google.com with SMTP id s11so430570wxc
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 00:51:57 -0800 (PST)
Message-ID: <be7468bb0701110051p507e1736q2eccdd490d7ac21@mail.gmail.com>
Date: Thu, 11 Jan 2007 16:51:57 +0800
From: "roderick tapang" <retapang@gmail.com>
Subject: Re: [linux-lvm] lvextend Insufficient free space
In-Reply-To: <5adb39f00701102307tebf5624sd2656d17b87978a3@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
	<be7468bb0701101741h6ef6adacs38bb89d134fcf890@mail.gmail.com>
	<5adb39f00701102307tebf5624sd2656d17b87978a3@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 1/11/07, David Tran <davidtt3@gmail.com> wrote:
> Thank for your help.
> My pvs:
> linux-server:/ # pvscan
>   PV /dev/hdb1   VG gdata   lvm2 [111.79 GB / 0    free]
>   PV /dev/hde1   VG gdata   lvm2 [279.46 GB / 40.00 MB free]
>   PV /dev/hdf1   VG gdata   lvm2 [153.38 GB / 153.38 GB free] (this is the
> new hd)
>   Total: 3 [544.62 GB] / in use: 3 [544.62 GB] / in no VG: 0 [0   ]
> I think that it is enogh free space, because I add one more HD already.
> More over, vgdisplay show it has: Free  PE / Size       39276 / 153.42 GB

so  /dev/gdata/priv is striped? you can check by running:

lvdisplay /dev/gdata/priv

and look for the value of Segments.

if its more than 1, it is sriped. and to resize it:

lvextend -L +100G -t -i1 /dev/gdata/priv   /dev/hdf1

which will only use the free PEs from /dev/hdf1. the -t will only test
the process. if says it is ok, re-run the command w/o the "-t".

> Thank you.
>

-- 
roderick e. tapang, nclp
retapang at gmail dot com

(o_.'       http://counter.li.org/
//\         ----------------------
V_/_        Linux User   #  253842
