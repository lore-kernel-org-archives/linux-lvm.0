Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n4C9aNa5018725
	for <linux-lvm@redhat.com>; Tue, 12 May 2009 05:36:23 -0400
Subject: Re: [linux-lvm] RAID 5 -- Data/Parity Allocation
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <37d33d830905112338n12ec1d13k509739cf0381e0fd@mail.gmail.com>
References: <37d33d830905112338n12ec1d13k509739cf0381e0fd@mail.gmail.com>
Date: Tue, 12 May 2009 10:39:43 +0100
Message-Id: <1242121183.13505.427.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
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

On Tue, 2009-05-12 at 12:08 +0530, Sandeep K Sinha wrote:
> Hi,
> 
> Is there any performance issues related with the different type of
> algorithm used in case of RAID 5?
> 
> i.e. Left asymmetric algo, Right asymmetric algo , Left symmetric algo
> etc.

These are options supported by the Linux MD softare RAID components
rather than lvm2/device-mapper. You might want to try asking your
question on the linux-raid mailing list:

http://linux-raid.osdl.org/index.php/Linux_Raid

Regards,
Bryn.
