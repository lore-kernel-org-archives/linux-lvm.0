Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2IEuq80016721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 10:56:53 -0400
Date: Thu, 18 Mar 2010 10:56:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100318145652.GB32200@redhat.com>
References: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
Subject: Re: [linux-lvm] how to change the volume group name of the attached
	backup
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Mar 18 2010 at 10:43am -0400,
Sarkar, Kaushik <Kaushik.Sarkar@netapp.com> wrote:

> Hi,
> 
>  
> 
> I have a 2 Linux(RHL) machines (L1 and L2).  One is clone of other. I
> have taken the backup of a L1. Now I have attached that backup to L2.
> 
>  
> 
> Before attaching L2 has /dev/sda and after attatchement it has /dev/sdb
> 
> But I cant mount /dev/sdb as it is on LVM. As both are having same VG
> NAME I can't even mount logical volume.
> 
> So I thought to change the volume group name of the second but not able
> to do that.
> 
>  
> 
> My intention is to mount the backup of L1 in L2 to check all data are
> correct.
> 
>  
> 
> Need your help to solve it.

Please see: man vgimportclone

Though vgimportclone is only provided in newer versions of lvm2 (>=
2.02.46).

Mike
