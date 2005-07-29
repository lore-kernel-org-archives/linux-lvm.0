Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6TLgAV03038
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:42:10 -0400
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6TLg2HF010386
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:42:03 -0400
Received: from nodin.corp.sgi.com (fddi-nodin.corp.sgi.com [198.29.75.193])
	by omx3.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with ESMTP
	id j6TML9Eg001910
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 15:21:10 -0700
Received: from [192.26.74.95] (janus.corp.sgi.com [192.26.74.95])
	by nodin.corp.sgi.com (SGI-8.12.5/8.12.10/SGI_generic_relay-1.2) with
	ESMTP id j6TLg1bT96621668
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 14:42:01 -0700 (PDT)
Message-ID: <42EAA2A9.1080107@deadhookers.org>
Date: Fri, 29 Jul 2005 14:42:01 -0700
From: Eric Wagar <eric@deadhookers.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] best way to make lv with 3 500G luns
References: <42EA9F25.20608@deadhookers.org>
	<00d101c59484$91b72520$6e09580a@b034547>
In-Reply-To: <00d101c59484$91b72520$6e09580a@b034547>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Rob Schwartz wrote:
> Have you tried the vgcreate with the -v  (for verbose) or -d  (for 
> debug) options?
> ----- Original Message ----- From: "Eric Wagar" <eric@deadhookers.org>
> To: "LVM" <linux-lvm@redhat.com>
> Sent: Friday, July 29, 2005 5:27 PM
> Subject: [linux-lvm] best way to make lv with 3 500G luns
>
>
>> What are the steps to create a volume comprised of 3 500G SGI TP9500 
>> LUNS on SLES9?
>>
>> I'm only able to get as far as pvcreate.  Afterwards, I am unable to 
>> create a visible vg.  By that I mean, I receive no error when I issue 
>> vgcreate, but I am unable to vgdisplay the new vg.
>>
>> This is on SLES9/SN2 with two module SGI A350 and using two FC paths.
I had not used the -v or -d option prior to this, no.  But, here is the 
information:
assault /home/ericwa# pvcreate /dev/scsi/sdh8-0c0i0l9;pvcreate 
/dev/scsi/sdh8-0c0i1l8;pvcreate /dev/scsi/sdh5-0c0i1l10
  No physical volume label read from /dev/scsi/sdh8-0c0i0l9
  Physical volume "/dev/scsi/sdh8-0c0i0l9" successfully created
  No physical volume label read from /dev/scsi/sdh8-0c0i1l8
  Physical volume "/dev/scsi/sdh8-0c0i1l8" successfully created
  No physical volume label read from /dev/scsi/sdh5-0c0i1l10
  Physical volume "/dev/scsi/sdh5-0c0i1l10" successfully created
...
assault /home/ericwa# vgcreate -v u018 /dev/scsi/sdh8-0c0i1l8 
/dev/scsi/sdh5-0c0i1l10 /dev/scsi/sdh8-0c0i0l9
<snip>
    Adding physical volume '/dev/scsi/sdh8-0c0i1l8' to volume group 'u018'
<snip>
    Adding physical volume '/dev/scsi/sdh5-0c0i1l10' to volume group 'u018'
<snip>
    Adding physical volume '/dev/scsi/sdh8-0c0i0l9' to volume group 'u018'
<snip>
    Archiving volume group "u018" metadata.
    Creating volume group backup "/etc/lvm/backup/u018"
  Volume group "u018" successfully created
assault /home/ericwa# vgdisplay -v
    Finding all volume groups
  Found duplicate PV aLiq4sGKfFA2S2t77t8MU5V13Pe4C17K: using /dev/sdg 
not /dev/sdr
  Found duplicate PV DThr6w5xGUEOOflPTEpFnnyUp02BXODP: using /dev/sdw 
not /dev/sdah
  Found duplicate PV P5CU7BDZ9m4NdrJyR7BrhSZT3fVDV8HB: using /dev/sdx 
not /dev/sdai
  Found duplicate PV aLiq4sGKfFA2S2t77t8MU5V13Pe4C17K: using /dev/sdan 
not /dev/sdr
  Found duplicate PV DThr6w5xGUEOOflPTEpFnnyUp02BXODP: using /dev/sdl 
not /dev/sdah
  Found duplicate PV P5CU7BDZ9m4NdrJyR7BrhSZT3fVDV8HB: using /dev/sdm 
not /dev/sdai
  Found duplicate PV aLiq4sGKfFA2S2t77t8MU5V13Pe4C17K: using /dev/sdac 
not /dev/sdr
  Found duplicate PV DThr6w5xGUEOOflPTEpFnnyUp02BXODP: using /dev/sdas 
not /dev/sdah
  Found duplicate PV P5CU7BDZ9m4NdrJyR7BrhSZT3fVDV8HB: using /dev/sdat 
not /dev/sdai
assault /home/ericwa# pvdisplay
<snip>
  --- NEW Physical volume ---
  PV Name               /dev/sdr
  VG Name
  PV Size               542.93 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               aLiq4s-GKfF-A2S2-t77t-8MU5-V13P-e4C17K

  --- NEW Physical volume ---
  PV Name               /dev/sdah
  VG Name
  PV Size               542.93 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               DThr6w-5xGU-EOOf-lPTE-pFnn-yUp0-2BXODP

  --- NEW Physical volume ---
  PV Name               /dev/sdai
  VG Name
  PV Size               542.93 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               P5CU7B-DZ9m-4Ndr-JyR7-BrhS-ZT3f-VDV8HB

All of the <snip> are the "Found duplicate PV" UUID lines.  This system 
has two FC HBA's, one each connected to a FC switch, which has two 
ISL's, and then each switch has two paths to the TP9500 controllers.

I am guessing, guessing since this is my first time to use LVM, that the 
output from pvdisplay showing "Allocatable           NO" is bad.  I have 
tried pvchange, but it seg faults.

thanks
eric
