Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5M1vQu28697
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 21:57:26 -0400
Received: from web32002.mail.mud.yahoo.com (web32002.mail.mud.yahoo.com
	[68.142.207.99])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j5M1vMdP002158
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 21:57:23 -0400
Message-ID: <20050622015717.89578.qmail@web32002.mail.mud.yahoo.com>
Date: Tue, 21 Jun 2005 18:57:17 -0700 (PDT)
From: Olivier Eymere <olivier_eymere@yahoo.com>
Subject: Re: [linux-lvm] LVM2 Volume and Volume group naming nomenclature
In-Reply-To: <42B6F00D.3060801@redshift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Not sure what problems you were having with creating
your volume group but I freed up some disk space and
created VG00 just to be sure:

le:~# vgcreate VG00 /dev/hda4
  Volume group "VG00" successfully created
le:~# vgdisplay VG00
  --- Volume group ---
  VG Name               VG00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               9.44 GB
  PE Size               4.00 MB
  Total PE              2417
  Alloc PE / Size       0 / 0
  Free  PE / Size       2417 / 9.44 GB
  VG UUID              
DFHRBm-Jxsv-ZYXG-PYPx-3pv0-vYj3-pRIe7O


--- Sam Rogers <srogers@redshift.com> wrote:
> But there is a major problem. LVM2 will not (from
> what I can see) 
> recognize volume group names like VG00. I do not
> understand? Why type 
> Volgroup00 when VG00 is quicker. In the HPUX version
> you can name the 
> volume group and logical volume anything you want. I
> don't see why we 
> can't do the same. It took me over a year to figure
> why LVM2 was not 
> working in an install until I gave up naming the
> volume group and let it 
> default to Volgroup00.



		
__________________________________ 
Yahoo! Mail Mobile 
Take Yahoo! Mail with you! Check email on your mobile phone. 
http://mobile.yahoo.com/learn/mail 
