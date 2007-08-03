Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP
	id l73FjmnA026206
	for <linux-lvm@redhat.com>; Fri, 3 Aug 2007 17:45:48 +0200
Message-ID: <46B34DDC.6020609@redhat.com>
Date: Fri, 03 Aug 2007 17:46:36 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Listing physical volumes in a volume group
References: <46B3395A.5020701@terrascale.net>
In-Reply-To: <46B3395A.5020701@terrascale.net>
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

Hi,

this will not help for using in script ?
(comma separated list of PVS & PV UUID  in VG)

vgs --separator , --noheadings -o pv_name,pv_uuid <vgname>

Milan
--
mbroz@redhat.com

Steeve McCauley wrote:
> I would like to know if there is a canonical way to list the
> physical volumes in a volume group, specifically to extract
> the uuid for those PVs in a bash script.  I am able to do
> something along the lines of,
> 
> PVS=$(vgdisplay -vv 2>&1 | grep "PV UUID" | awk '{print $3}')
> PVUUID=$(pvs -o pv_uuid --noheadings /dev/sdx | awk '{print $1}')
> 
> and then look for PVUUID in the list of PVS.
> 
> for uuid in $PVS; do
>    [ "$uuid" != "$PVUUID" ] && continue
>    ...
> done
> 
> but this relies on the output format of 'vgdisplay -vv' and
> I want to be sure that I will always get the expected result.
> 
> Thanks,
> 
> steeve
> 
