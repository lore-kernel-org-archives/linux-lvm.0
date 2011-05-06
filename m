Message-ID: <4DC410DB.1070404@redhat.com>
Date: Fri, 06 May 2011 17:16:43 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4DC40BFD.3080408@cfl.rr.com>
In-Reply-To: <4DC40BFD.3080408@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] getting pe_start right
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
Cc: Phillip Susi <psusi@cfl.rr.com>


On 05/06/2011 04:55 PM, Phillip Susi wrote:
> While trying to convert my mdadm raid5 array from metadata format 0.9 to 
> 1.0, I forgot to specify the version and it defaulted to 1.2, which 
> damaged the lvm metadata.  After correcting mdadm to 1.0, I decided to 
> try to recreate the LVM after managing to locate the volume descriptions 
> in the metadata after manually dumping it.
> 
> The problem I now have is that pvcreate will not use the same pe_start 
> as before.  It was 384 and it is now 3072.  I tried using --metadatasize 
> 192k --dataalignmentsize 0 and it did not help.  What gives?

Try to set
default_data_alignment = 0

from lvm.conf:
# Default alignment of the start of a data area in MB.  If set to 0,
# a value of 64KB will be used.  Set to 1 for 1MiB, 2 for 2MiB, etc.

Also, if you use

	pvcreate --uuid <pv uuid from metadata> --restorefile <old VG backup>

it should create PV exacltly as needed for olf VG (with --restorefile it uses
offset from metadata backup, overriding default)

Then vgcfgrestore and you should have exactly the same cfg.

Milan
