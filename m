Received: from [10.32.10.80] (vpn-10-80.str.redhat.com [10.32.10.80])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1R9DQ3s030176
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 04:13:27 -0500
Message-ID: <49A7AEBB.3010109@redhat.com>
Date: Fri, 27 Feb 2009 10:13:31 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] ext3 on lvm2 on raid10
References: <20090227031359.63e57341@dhcp-143.ilievnet.com>
In-Reply-To: <20090227031359.63e57341@dhcp-143.ilievnet.com>
Content-Transfer-Encoding: 7bit
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

Daniel Iliev wrote:
> How is the raid10 chunk size related to LVM2 layout and how do ext3's
> "stride" and "stripe-width" parameters depend on LVM2?
> 
> In more detail:
> I've 4 equal HDDs. My intention is to make a raid10, put LVM2 on top
> of it and format the LVM volumes with ext3.
> 
> stride and stripe-width values are described in MKE2FS(8), but the
> case with LVM is not covered there.
> 
> Please, point me to some documentation on the subject or advise me how
> to proceed.

Hi,

lvm2 since version 2.02.41 allows automatically align LV start according
to underlying md device "chunk" size.

See this paramater in lvm.conf:
    # By default, if a PV is placed directly upon an md device, LVM2
    # will align its data blocks with the the chunk_size exposed in sysfs.
    # 1 enables; 0 disables.
    md_chunk_alignment = 1

You should also set extent size as multiple of chunk size.

(The development code in CVS also allows set the alignment manually
using parameter, so administrator can set the align value according
to other types of underlaying devices - useful for hw raid, SSD, etc.)

Milan
--
mbroz@redhat.com
