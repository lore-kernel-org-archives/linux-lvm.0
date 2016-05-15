Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4FAXE3m009718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 15 May 2016 06:33:14 -0400
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id A32286314A
	for <linux-lvm@redhat.com>; Sun, 15 May 2016 10:33:10 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr003msb.fastweb.it
	(8.5.140.04) id 572A1723009D6D73 for linux-lvm@redhat.com;
	Sun, 15 May 2016 12:33:09 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 15 May 2016 12:33:08 +0200
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
Subject: [linux-lvm] =?utf-8?q?Unexptected_filesytem_unmount_with_thin_pro?=
	=?utf-8?q?vision_and_autoextend__disabled_-_lvmetad_crashed=3F?=
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
To: linux-lvm@redhat.com

Hi list,
I had an unexptected filesystem unmount on a machine were I am using 
thin provisioning.

It is a CentOS 7.2 box (kernel 3.10.0-327.3.1.el7, 
lvm2-2.02.130-5.el7_2.1), with the current volumes situation:
# lvs -a
   LV                   VG         Attr       LSize  Pool         Origin 
Data%  Meta%  Move Log Cpy%Sync Convert
   000-ThinPool         vg_storage twi-aotz-- 10.85t                     
74.06  33.36
   [000-ThinPool_tdata] vg_storage Twi-ao---- 10.85t
   [000-ThinPool_tmeta] vg_storage ewi-ao---- 88.00m
   Storage              vg_storage Vwi-aotz-- 10.80t 000-ThinPool        
74.40
   [lvol0_pmspare]      vg_storage ewi------- 88.00m
   root                 vg_system  -wi-ao---- 55.70g
   swap                 vg_system  -wi-ao----  7.81g

As you can see, thin pool/volume is at about 75%.

Today I found the Storage volume unmounted, with the following entries 
in /var/log/message:
May 15 09:02:53 storage lvm[43289]: Request to lookup VG vg_storage in 
lvmetad gave response Connection reset by peer.
May 15 09:02:53 storage lvm[43289]: Volume group "vg_storage" not found
May 15 09:02:53 storage lvm[43289]: Failed to extend thin 
vg_storage-000--ThinPool-tpool.
May 15 09:02:53 storage lvm[43289]: Unmounting thin volume 
vg_storage-000--ThinPool-tpool from /opt/storage.
...

The lines above repeated each 10 seconds.

What puzzle me is that both thin_pool_autoextend_threshold and 
snap_pool_autoextend_threshold are disabled in the lvm.conf file 
(thin_pool_autoextend_threshold = 100 and snap_pool_autoextend_threshold 
= 100). Moreover, no custom profile/policy is attached to the thin 
pool/volume.

To me, it seems that the lvmetad crashed/had some problems and the 
system, being "blind" about the thin volume utilization, put it offline. 
But I can not understand the "Failed to extend thin 
vg_storage-000--ThinPool-tpool", and I had *no* autoextend in place.

I rebooted the system and the Storage volume is now mounted without 
problems. I also tried to write about 16 GB of raw data to it, and I 
have no problem. However, I can not understand why it was put offline in 
the first place. As a last piece of information, I noted that kernel & 
lvm was auto-updated two days ago. Maybe it is related?

Can you give me some hint of what happened, and how to avoid it in the 
future?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
