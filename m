Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4I9cfp0000309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 May 2010 05:38:42 -0400
Message-ID: <4BF26016.5030100@redhat.com>
Date: Tue, 18 May 2010 10:38:30 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>	<20100517211459.GA7269@us.ibm.com>	<Pine.LNX.4.64.1005171721260.2347@bmsred.bmsi.com>	<4BF225AE.3080303@gmail.com>
	<4BF25A40.7060304@redhat.com>
In-Reply-To: <4BF25A40.7060304@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] shrink VG and PV
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

On 05/18/2010 10:13 AM, Bryn M. Reeves wrote:
> Once you have done this you should be able to issue pvresize with
> --physicalvolumesize as in your first post to reduce the space used by
> LVM2. Once that's done you can shrink your sda2 partition (note that
> this last step will likely still need a reboot - the kernel is still not
> at all happy about modifying in-use partitions, even for shrinking).

More detailed example here:

http://pastebin.org/246926

Regards,
Bryn.
