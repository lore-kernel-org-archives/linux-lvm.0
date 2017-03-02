Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v225kY6m021684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Mar 2017 00:46:34 -0500
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DACFE81239
	for <linux-lvm@redhat.com>; Thu,  2 Mar 2017 05:46:32 +0000 (UTC)
References: <b55d9679-db08-7e72-ff0f-ec471fc8f514@free.fr>
From: Eric Ren <zren@suse.com>
Message-ID: <e7242e4c-537d-a0b5-523c-cfa55d7170cb@suse.com>
Date: Thu, 2 Mar 2017 13:44:13 +0800
MIME-Version: 1.0
In-Reply-To: <b55d9679-db08-7e72-ff0f-ec471fc8f514@free.fr>
Content-Type: multipart/mixed; boundary="------------BE70B5F184B4D23A8835A75A"
Subject: Re: [linux-lvm] Sorry to ask here ...
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
To: LVM general discussion and development <linux-lvm@redhat.com>, georges.giralt@free.fr

This is a multi-part message in MIME format.
--------------BE70B5F184B4D23A8835A75A
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/24/2017 03:25 AM, Georges Giralt wrote:
> Hello !
>
> I'm sorry to ask for help here, but I'm lost in the middle of nowhere ...
>
> The context :
>
> A PC hardware with an UEFI "BIOS" set to legacy boot only.
>
> 3 disks with 2 partitions each. The 3 first partitions are set in software mirror (md0) 
> and used for /boot (Ext4) .The second 3 partitions are used as a software mirror and the 
> resulting md1 is the sole PV of a vg0 group onto which 8 logical volumes are set. This is 
> used to run Ubuntu 16.04.2 software (after many upgrades...).   *
>
> This setup has worked for years and seen changes in disk sizes, main board, etc...
>
> Lastly, I bet the cause is an upgrade of some packages, the machine refuses to boot. It 
> drops onto initramfs shell because the vg0 volume group is not activated. Launching lvm 
> and doing a vgchange -a y does the trick and the system boots fine afterwards.
>
> I've searched everything I can (but maybe the setup was so rock solid I became lazy or 
> unconscious) and tried to make again the initramfs with no luck.
>
> So every leads or advice would be greatly appreciated. Please, refrain to hit me hard on 
> the face. I'm already mourning....
>
> Many thanks in advance for your help !
>
>
> * : The 3 disks are here because at one time, long ago, I used mirroring in the LVM 
> software. ... I switched to software raid and kept the 3 disks as I had them into the box.
Looks very similar with these bugs:

https://bugzilla.opensuse.org/show_bug.cgi?id=964862
https://bugzilla.opensuse.org/show_bug.cgi?id=919284
https://bugzilla.opensuse.org/show_bug.cgi?id=1019886

You might be interested in having a try with this fix (attached):
"simplify-special-case-for-md-in-69-dm-lvm-metadata.patch"

This patch was originally discussed here - https://www.spinics.net/lists/raid/msg55182.html

But for some reason, it is not accepted by upstream:)

Hope it can help.

Eric

>
>


--------------BE70B5F184B4D23A8835A75A
Content-Type: text/x-patch;
	name="0001-Simplify-special-case-for-md-in-69-dm-lvm-metadata.r.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-Simplify-special-case-for-md-in-69-dm-lvm-metadata.r.pa";
	filename*1="tch"


--------------BE70B5F184B4D23A8835A75A--
