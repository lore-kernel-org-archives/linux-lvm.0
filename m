Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8LJAA19030845
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 15:10:10 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8LJA3A1022933
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 15:10:04 -0400
Date: Thu, 21 Sep 2006 21:09:54 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] using LVM with SAN
Message-ID: <20060921190954.GB7301@percy.comedia.it>
References: <MNELLEMHKKBIPIBBIOKOOEHOFDAA.detoma.alessandro@sea-aeroportimilano.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MNELLEMHKKBIPIBBIOKOOEHOFDAA.detoma.alessandro@sea-aeroportimilano.it>
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

On Wed, Sep 20, 2006 at 05:08:53PM +0200, de Toma Alessandro wrote:
>Dear All,
>we have create a vg on a LINUX RH ES4 UP2.
>The storage is a CX500 and the multypath software is POWERPATH 4.5.
>
>During the creation of VG we are this worning:
># vgcreate VolGroupSUN01 /dev/emcpowerb1
>Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdc1 not
>/dev/emcpowera1
....
>Volume group "VolGroupSUN01" successfully created
>This is correct?

no, please edit /etc/lvm/lvm.conf and set up filters so lvm will only
use /dev/emcpower* devices.

note that if your root vg is on local scsi disks you will have to add
those to the filter as well.

eg:
   filter =[ "a|/dev/sda[1-9]*|", "a|/dev/sdb[1-9]*|", "a|/dev/emcpower.*|", "r|.*|" ]


>When we umount the volume:
>[root@mezzicluslin02 ~]# umount /dev/VolGroupSUN00/LogVolSUN00
>/home/SUNstorage
>umount: /dev/mapper/VolGroupSUN00-LogVolSUN00: not mounted
>umount: /dev/mapper/VolGroupSUN00-LogVolSUN00: not mounted
>
>This is correct?
no, umount takes only 1 parameter, either the device or the mount point.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
