Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i37Nkrj09791
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 19:46:53 -0400
Received: from magic.alttech.com ([207.13.196.227])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i37NkpWB029012
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 19:46:51 -0400
Received: from dogberry.ossmann.com (magic.alttech.com [64.140.60.35])
	by magic.alttech.com (Postfix) with ESMTP id BCD862FE96
	for <linux-lvm@redhat.com>; Wed,  7 Apr 2004 17:48:13 -0600 (MDT)
Date: Wed, 7 Apr 2004 17:46:49 -0600
From: Michael Ossmann <mike@ossmann.com>
Subject: Re: [linux-lvm] lvm2 weirdness on software RAID5
Message-ID: <20040407234649.GA27033@ossmann.com>
References: <1081378532.25836.264.camel@arthur.cbd.careercast.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1081378532.25836.264.camel@arthur.cbd.careercast.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 07, 2004 at 03:55:33PM -0700, Clint Byrum wrote:
> 
> mdadm --create /dev/md2 --chunk 256 --level 5 -n 4 /dev/hdc1 /dev/hdd1
> /dev/hdg1 /dev/hdh1
<snip>
> [root@backup root]# lvm pvcreate /dev/md2
<snip>
> [root@backup root]# lvm pvs
> PV         VG      Fmt  Attr PSize   PFree
> /dev/hdc1          lvm2 --   335.37G 335.37G
> /dev/md0   backups lvm2 a-   349.33G      0
> /dev/md1   backups lvm2 a-   349.31G   8.64G

Looks like lvm is configured to allow both /dev/md* and
/dev/hd* as physical devices.  You probably want to limit it
to /dev/md* so that it doesn't get confused by things it
finds on the raw disk partition devices.  You can do this
with:

  filter = [ "r|^/dev/hd*|" ]

in the devices block of your /etc/lvm/lvm.conf.  If you do
not have an /etc/lvm/lvm.conf, you can copy the sample
config in the lvm2 distribution or create a fresh one with:

  # lvm dumpconfig > /etc/lvm/lvm.conf

You could also make the filter more specific if you want:

  filter = [ "r|^/dev/hdc*|" ]

mossmann
