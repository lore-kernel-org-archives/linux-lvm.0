Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EBE95C73E
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 13:24:09 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57E9999DBA
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 13:24:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y13so20901778wrd.3
	for <linux-lvm@redhat.com>; Tue, 09 Apr 2019 06:24:08 -0700 (PDT)
References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
Date: Tue, 9 Apr 2019 15:24:05 +0200
MIME-Version: 1.0
In-Reply-To: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] can't remove snapshot
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>

Dne 09. 04. 19 v 15:00 Lentes, Bernd napsal(a):
> Hello list,
> 
> I have a two-node HA-cluster which uses local and cluster LVM.
> cLVM is currently stopped, I try to remove a snapshot from the root lv which
> is located on a local VG.
> I get this error:
> ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
>    connect() failed on local socket: No such file or directory
>    Internal cluster locking initialisation failed.
>    WARNING: Falling back to local file-based locking.
>    Volume Groups with the clustered attribute will be inaccessible.
>      Archiving volume group "vg_local" metadata (seqno 26).
>      Removing snapshot volume vg_local/lv_snap_pre_sp4.
>      Loading table for vg_local-lv_root (254:8).
>    device-mapper: reload ioctl on  (254:8) failed: Invalid argument
>    Failed to refresh lv_root without snapshot.
> 

Hi

Have you tried to converted clustered VG to be a non-clustered one ?
And use file locking to proceed with operation on local device?

Zdenek
