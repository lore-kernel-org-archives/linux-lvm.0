Received: from [192.168.50.23] (vpn-14-137.rdu.redhat.com [10.11.14.137])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id l16Dcwmx021384
	for <linux-lvm@redhat.com>; Tue, 6 Feb 2007 08:38:59 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <45C62BB0.6090004@free.fr>
References: <45C62BB0.6090004@free.fr>
Message-Id: <abae97f2062bff4699caa277e2faea30@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] replacing a failling disk on a mirrred VG.
Date: Tue, 6 Feb 2007 07:40:03 -0600
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

This one should be pretty easy...

Effectively, you want to keep the primary mirror devices, so do:
lvconvert -m0 <vg/lv>
to down convert them to linear devices.

Then remove PV1 (vgreduce), add a new disk to your system, add it to 
your vg (vgextend), and finally, up-convert the linear devices to 
mirrors again:
lvconvert -m1 <vg/lv>

  brassow

On Feb 4, 2007, at 12:53 PM, Georges Giralt wrote:

> Hi !
> I run A Fedora Core 6 box with
> lvm> version
>   LVM version:     2.02.17 (2006-12-14)
>   Library version: 1.02.13 (2006-11-28)
>   Driver version:  4.10.0
> lvm>
> on a 2.6.19 kernel.
> My VG comprises 3PV  onto which I've spread 4 mirrored LVs.
> PV 0 : LV1 mirror copy 0, LV2 mirror copy 0, lv3 mirror copy 0 and lv4 
> mirror copy 0
> PV 1 : LV1 mirror copy 1, LV2 mirror log, LV3 mirror log and LV4 
> mirror copy 1
> PV2 : LV1 mirror log, LV2 mirror copy 1 , LV3 mirror copy 1 and LV4 
> mirror log.
> I plan to replace (Smart signals a future failure) the PV #1.
> Question : What is the best route to do this ? And is it feasible ?
> Thanks a lot in advance for your answer !
> -- 
> Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
> S'il vous pla�t, aidez nous � conserver nos ressources,
> recyclez vos �lectrons !
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
