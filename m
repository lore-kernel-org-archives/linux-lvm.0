Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l67B3gK8016463
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 07:03:42 -0400
Received: from mail.esperi.org.uk (41-052.adsl.zetnet.co.uk [194.247.41.52])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l67B3e49001409
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 07:03:41 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l67B3cHR032454
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 12:03:38 +0100
Subject: Re: [linux-lvm] Clone disk with LVM
References: <46897378.8040305@email.arc.nasa.gov>
From: Nix <nix@esperi.org.uk>
Date: Sat, 07 Jul 2007 12:03:37 +0100
In-Reply-To: <46897378.8040305@email.arc.nasa.gov> (Ryan Nelson's message of
	"Mon, 02 Jul 2007 14:51:52 -0700")
Message-ID: <87ir8wa31y.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 2 Jul 2007, Ryan Nelson spake thusly:
> Because of the dd the LVM had the same names and UUIDs for the vg and lg.  I was able to change the names however I wasn't
> successful in change the UUIDs.  It didn't even look like there was an option to change the UUIDs for the lv.

vgcfgbackup, edit the backup, edit the ids in the logical_volumes
sections, check your work carefully, and vgcfgrestore?

(One very nice thing about LVM2 is that all the metadata is textual...)

-- 
`... in the sense that dragons logically follow evolution so they would
 be able to wield metal.' --- Kenneth Eng's colourless green ideas sleep
 furiously
