Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0RKaG126751
	for <linux-lvm@redhat.com>; Fri, 27 Jan 2006 15:36:16 -0500
Received: from mail.funsoft.com (funsoft.funsoft.com [71.129.27.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0RKa7kv005985
	for <linux-lvm@redhat.com>; Fri, 27 Jan 2006 15:36:07 -0500
Received: from [192.168.5.27] (funsoft.funsoft.com [192.168.11.1])
	by mail.funsoft.com (8.11.6/8.11.0) with ESMTP id k0RKa0Y20925
	for <linux-lvm@redhat.com>; Fri, 27 Jan 2006 12:36:01 -0800
Message-ID: <43DA841D.3080208@funsoft.com>
Date: Fri, 27 Jan 2006 15:35:41 -0500
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] error msg: VG vgc1 metadata too large for circular
	buffer
Reply-To: eheman@funsoft.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-lvm <linux-lvm@redhat.com>

I am running SuSE 9.3 PRO.
# uname -r
2.6.11.4-21.9-bigsmp

I pulled the latest CVS tree two days ago for both device-mapper and 
LVM2 because I hit a problem with the level of those that came with SuSE 
9.3.  I need to be able to create hundreds (say 400 or 500) logical 
volumes with the application I am working with.

The new CVS code allowed me to get many many more than I was able to get 
prior to going with the new code from the CVS trees.

I created a volume group on a 500+G drive with -M2, omitted 
metadatasize, and let the allocation size default to 4M (probably dumb 
given the size of the volumes I am creating).

I managed to about 392 volumes created in the volume group. Now any 
attempt to create additional or to delete a logical volume from that 
group fails with a message:
"VG vgc1 metadata too large for circular buffer"

# lvremove -vvvvv vgc1/33901_vgc1_392
<lots-of-stuff-snipped>

#metadata/pv_manip.c:241         /dev/sdc1 381:  89154    234: 
33901_vgc1_382(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 382:  89388    234: 
33901_vgc1_383(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 383:  89622    234: 
33901_vgc1_384(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 384:  89856    234: 
33901_vgc1_385(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 385:  90090    234: 
33901_vgc1_386(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 386:  90324    234: 
33901_vgc1_387(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 387:  90558    234: 
33901_vgc1_388(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 388:  90792    234: 
33901_vgc1_389(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 389:  91026    234: 
33901_vgc1_390(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 390:  91260    234: 
33901_vgc1_391(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 391:  91494    234: NULL(0:0)
#metadata/pv_manip.c:241         /dev/sdc1 392:  91728  47815: NULL(0:0)
#format_text/export.c:121         Doubling metadata output buffer to 131072
#format_text/format-text.c:408   VG vgc1 metadata too large for circular 
buffer
#metadata/metadata.c:782         <backtrace>
#locking/file_locking.c:59       Unlocking /var/lock/lvm/V_vgc1
#device/dev-io.c:483         Closed /dev/sdc1
x260:/usr/flexes


I can destroy the data. In fact, that is what I would like to do, but 
softly using lvremove, vgremove, pvremove if possible. But I can't get 
around the current error.

Advice,please?  Are there parameters I can give during the creation of 
the group or volume to avoid this?
-- 
Gary Eheman
Fundamental Software, Inc.
http://www.funsoft.com
