Received: from alatyr.brq.redhat.com (vpn1-5-113.ams2.redhat.com [10.36.5.113])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rBAEJhx3026953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2013 09:19:45 -0500
Message-ID: <52A722FF.5090903@redhat.com>
Date: Tue, 10 Dec 2013 15:19:43 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAAKRE70EMS2i43Em_LiX3P7zJ7hR1KW5pL4Jxvjk9VSdLvnr=A@mail.gmail.com>
In-Reply-To: <CAAKRE70EMS2i43Em_LiX3P7zJ7hR1KW5pL4Jxvjk9VSdLvnr=A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dev node change
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
To: linux-lvm@redhat.com

On 12/09/2013 04:13 PM, Umar Draz wrote:
> Hi All
> 
> I have a SCSI share which i am  using linux initiator on my ubuntu. Its
> available for me in /dev/sdb
> 
> No I have created lvm group using the /dev/sdb. Today I just logut and
> login my scsi share but this time ubutnu gave me this as /dev/sdc
> instead of /dev/sdb.
> 
> due to this my lvm group is stuck, and its giving me the error
> 
> Input/output error
> 
> on pvdisplay or vgdisplay,
> 
> Any body help me how I can reslove this issue.?
> 

You should always deactivate your LVM volumes before
disconnecting the underlying iSCSI volumes and then when
you reconnect the iSCSI back, activate the LVM volumes
(or if autoactivation is used - meaning use_lvmetad=1
is set in lvm.conf, this activation happens automatically).

Alternatively, you can call vgchange --refresh when the
iSCSI is connected back.

-- 
Peter
