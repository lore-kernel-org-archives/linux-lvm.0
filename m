Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26DBA6B8EC
	for <linux-lvm@redhat.com>; Wed,  4 Apr 2018 07:12:45 +0000 (UTC)
Received: from prv-mh.provo.novell.com (prv-mh.provo.novell.com
	[137.65.248.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E42E0C047B63
	for <linux-lvm@redhat.com>; Wed,  4 Apr 2018 07:12:42 +0000 (UTC)
Message-Id: <5AC47AE7020000F9001CAC9D@prv-mh.provo.novell.com>
Date: Wed, 04 Apr 2018 01:12:39 -0600
From: "Gang He" <ghe@suse.com>
References: <5AC35747020000F9000B344F@prv-mh.provo.novell.com>
	<bdd19fc5-b0ff-4463-2bab-c3768d3d4a1e@redhat.com>
In-Reply-To: <bdd19fc5-b0ff-4463-2bab-c3768d3d4a1e@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] PVmove can not work on lvm2-2.02.177
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
To: linux-lvm@redhat.com

Hi Zdenek,

>>> Zdenek Kabelac <zkabelac@redhat.com> 04/03/18 4:11 PM >>>
Dne 3.4.2018 v 04:28 Gang He napsal(a):
> Hello list,
> 
> As you know, pvmove can run on old version (e.g. lvm2-2.02.120 on SLE12SP2),
> But with new version lvm2-2.02.177, I can not run pvmove successfully in the cluster.
> Here, I paste some information from my test,
> if you can know the cause, please help to figure out.
> 
> tb0307-nd1:/ # cat /etc/issue
> Welcome to openSUSE Tumbleweed 20180307 - Kernel \r (\l).
> tb0307-nd1:/ # uname -r
> 4.15.7-1-default
> tb0307-nd1:/ # rpm -qa | grep lvm
> lvm2-cmirrord-2.02.177-4.1.x86_64
> liblvm2app2_2-2.02.177-4.1.x86_64
> liblvm2cmd2_02-2.02.177-4.1.x86_64
> lvm2-clvm-2.02.177-4.1.x86_64
> lvm2-lockd-2.02.177-4.1.x86_64
> lvm2-2.02.177-4.1.x86_64
> lvm2-testsuite-2.02.177-4.1.x86_64
> 
> tb0307-nd1:/ # pvs
>    PV         VG          Fmt  Attr PSize  PFree
>    /dev/vdb   cluster-vg2 lvm2 a--  40.00g 20.00g
>    /dev/vdc   cluster-vg2 lvm2 a--  40.00g 40.00g
> tb0307-nd1:/ # vgs
>    VG          #PV #LV #SN Attr   VSize  VFree
>    cluster-vg2   2   1   0 wz--nc 79.99g 59.99g
> tb0307-nd1:/ # lvs
>    LV      VG          Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
>    test-lv cluster-vg2 -wi-ao---- 20.00g
> tb0307-nd1:/ # pvmove -i 5 /dev/vdb /dev/vdc
>    Increasing mirror region size from 0    to 16.00 KiB
>    Error locking on node a4311a8: Device or resource busy
>    Failed to activate cluster-vg2/test-lv   <<== Failed, but in fact, I can mount cluster-vg2/test-lv with ocfs2 file system in the cluster, and read/write files from each node.

Hi


Yep - it's a work in progress - if you take upstream from git - there are 
already fixes committed.  Hopefully next release (2.02.178) will address most 
regressions cause by newer (hopefully better) code.

Do you have a schedule for next release (2.02.178)? pvmove is a good feature, I hope we can support it in our next SLE release. 
By the way, some customers really used this feature, but it did not look very stable,
especially when users did pvmove during the (clustered) LV is being used for reading/writing.
Thanks a lot.
Gang

Good to see someone is really using it...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO@http://tldp.org/HOWTO/LVM-HOWTO/
