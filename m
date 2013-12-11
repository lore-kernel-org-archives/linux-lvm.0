Received: from alatyr.brq.redhat.com (alatyr.brq.redhat.com [10.34.131.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBB8kSdo032530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 11 Dec 2013 03:46:29 -0500
Message-ID: <52A82663.1070605@redhat.com>
Date: Wed, 11 Dec 2013 09:46:27 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAAKRE70EMS2i43Em_LiX3P7zJ7hR1KW5pL4Jxvjk9VSdLvnr=A@mail.gmail.com>	<52A722FF.5090903@redhat.com>
	<CAFrGbuWboS=2RoheSc7w0zLTnhvOQwq7N8UTfOe8TruLOFWecg@mail.gmail.com>
In-Reply-To: <CAFrGbuWboS=2RoheSc7w0zLTnhvOQwq7N8UTfOe8TruLOFWecg@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 12/10/2013 03:33 PM, Alessandro MACUZ wrote:
> 2013/12/10 Peter Rajnoha <prajnoha@redhat.com <mailto:prajnoha@redhat.com>>
> 
>     On 12/09/2013 04:13 PM, Umar Draz wrote:
>     > Hi All
>     >
>     > I have a SCSI share which i am  using linux initiator on my
>     ubuntu. Its
>     > available for me in /dev/sdb
>     >
>     > No I have created lvm group using the /dev/sdb. Today I just logut and
>     > login my scsi share but this time ubutnu gave me this as /dev/sdc
>     > instead of /dev/sdb.
>     >
>     > due to this my lvm group is stuck, and its giving me the error
>     >
>     > Input/output error
>     >
>     > on pvdisplay or vgdisplay,
>     >
>     > Any body help me how I can reslove this issue.?
>     >
> 
>     You should always deactivate your LVM volumes before
>     disconnecting the underlying iSCSI volumes and then when
>     you reconnect the iSCSI back, activate the LVM volumes
>     (or if autoactivation is used - meaning use_lvmetad=1
>     is set in lvm.conf, this activation happens automatically).
> 
>     Alternatively, you can call vgchange --refresh when the
>     iSCSI is connected back.
> 
> 
> 
> Couldn't be used the identification of PV by UUID here? It should be
> better imo.
> 

Well, this is about dm tables that represent the logical volumes
(you can check dmsetup table output). The PV UUID doesn't play a role
at this level - the PV UUID is just LVM abstraction that is using
device-mapper kernel capabilities.

And if the iSCSI is disconnected while there's anything on top of it
(in this case the LV), the major:minor pair (as well as the kernel name)
is reserved until all the stack above it is freed.

Then when the iSCSI is connected back (while the old major:minor is
still held by old mapping), kernel has no other choice just to assign
new major:minor pair. Therefore we need a refresh (or deactivation/activation)
which will generate a new mapping with the new major:minor pair of the
underlying PV (the iSCSI volume).
-- 
Peter
