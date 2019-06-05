Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 369AD19C6A
	for <linux-lvm@redhat.com>; Wed,  5 Jun 2019 02:43:15 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DA8C307D910
	for <linux-lvm@redhat.com>; Wed,  5 Jun 2019 02:42:53 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Wed,  5 Jun 2019 02:43:04 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Wed, 5 Jun 2019 02:41:10 +0000
Message-ID: <9ce61b86-c8f7-c227-2303-2f7bbe231d04@suse.com>
References: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
In-Reply-To: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
Content-Language: en-US
Content-ID: <3574F0A0561087418D945DE76936C17D@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] confused with lvm2 filter rules
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello list,

Can anybody help me for this question?
I tried on suse & centos with lvm2-2.02.180, both system have this issue.

The filter in /etc/lvm/lvm.conf only works with vgextend command.
It take no effect on pvcreate, vgcreate & vgreduce.

Thank you.

On 6/3/19 9:03 PM, Heming Zhao wrote:
> Hello,
> 
> I met below filter action when executed 'vgextend'.
> why the filter take no effect on executing pvcreate or vgcreate?
> 
> ```
> # ls -l /dev/disk/by-id/scsi-*
> lrwxrwxrwx 1 root root 9 Jun  3 20:44 /dev/disk/by-id/scsi-360073a707 ->
> ../../sda
> lrwxrwxrwx 1 root root 9 Jun  3 20:44 /dev/disk/by-id/scsi-36007c0036 ->
> ../../sdb
> lrwxrwxrwx 1 root root 9 Jun  3 20:27 /dev/disk/by-id/scsi-3600b99ec4 ->
> ../../sdc
> # pvcreate /dev/disk/by-id/scsi-36073a707 /dev/disk/by-id/scsi-36007c0036
> # pvs
>     PV         VG Fmt  Attr PSize PFree
>     /dev/sda      lvm2 ---  2.00g 2.00g
>     /dev/sdb      lvm2 ---  2.00g 2.00g
> # vgcreate vgtst /dev/disk/by-id/scsi-36073a707
> /dev/disk/by-id/scsi-36007c0036hy the filter take no effect on executing
> pvcreate or vgcreate?
> # vgs
>     VG    #PV #LV #SN Attr   VSize VFree
>     vgtst   2   0   0 wz--n- 3.98g 3.98g
> # vgextend vgtst /dev/disk/by-id/scsi-3600b99ec4
>     Device /dev/disk/by-id/scsi-3600b99ec4 excluded by a filter.
> # vgs
>     VG    #PV #LV #SN Attr   VSize VFree
>     vgtst   2   0   0 wz--n- 3.98g 3.98g
> 
> my enviroment:
> # rpm -qa | grep lvm2
> lvm2-clvm-2.02.180-8.16.x86_64
> lvm2-cmirrord-2.02.180-8.16.x86_64
> lvm2-2.02.180-8.16.x86_64
> 
> the filter rules:  (you can see all the disk in /dev/disk/by-id/ are
> rejected)
> # grep filter /etc/lvm/lvm.conf | grep -v "#"
>       filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",
> "r|/dev/fd.*|", "r|/dev/cdrom|", "a/.*/" ]
> ```
> 
> 
> Thank you.
> zhm
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
