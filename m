Received: from [10.3.225.40] (vpn-225-40.phx2.redhat.com [10.3.225.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n5UIslHt013379
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 14:54:48 -0400
Message-ID: <4A4A5F77.10308@redhat.com>
Date: Tue, 30 Jun 2009 20:54:47 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mapping LVs to physical device
References: <4A4A48B8.9040401@stormagic.com>
In-Reply-To: <4A4A48B8.9040401@stormagic.com>
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

Chris Farey wrote:
> I have a requirement to be able to work out which areas of a physical 
> device assigned to LVM are being used by various logical volumes. I 
> haven't found any easy way to do this using an API, so I've resorted to 
> spawning off lvm commands and interpretting the output.

you can report all attributes using pvs/lvs/vgs, like this
 
pvs -o +devices

lvs --segments -o +seg_pe_ranges

... for list of available attributes just run "pvs -o help"

Milan
--
mbroz@redhat.com
