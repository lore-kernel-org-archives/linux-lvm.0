Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0B1fKLL031591
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 20:41:20 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.231])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0B1fJSw019070
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 20:41:19 -0500
Received: by wx-out-0506.google.com with SMTP id s11so309474wxc
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 17:41:19 -0800 (PST)
Message-ID: <be7468bb0701101741h6ef6adacs38bb89d134fcf890@mail.gmail.com>
Date: Thu, 11 Jan 2007 09:41:19 +0800
From: "roderick tapang" <retapang@gmail.com>
Subject: Re: [linux-lvm] lvextend Insufficient free space
In-Reply-To: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
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

On 1/9/07, David Tran <davidtt3@gmail.com> wrote:
>   Cur PV                3
>   Act PV                3
>   VG Size               544.62 GB
>   PE Size               4.00 MB
>   Total PE              139424
>   Alloc PE / Size       100148 / 391.20 GB
>   Free  PE / Size       39276 / 153.42 GB
>   VG UUID
> gROPCK-xUmS-Tk99-nTmp-S63F-otHE-9QJukD
> -------------------------------------------------------------
> /////// So I have 153.42 GB free space NOW
> -------------------------------------------------------------
> linux-server:/ # lvextend -L +100G /dev/gdata/priv
>   Extending logical volume priv to 177.80 GB
>   Insufficient free space: 45517 extents needed, but only 39276 available

is /dev/gdata/priv striped? if it is, it looks like the PVs don't have
enough PEs each to accommodate equal stripe distribution.
wha'ts the output of "pvs"?

-- 
roderick e. tapang, nclp
retapang at gmail dot com

(o_.'       http://counter.li.org/
//\         ----------------------
V_/_        Linux User   #  253842
