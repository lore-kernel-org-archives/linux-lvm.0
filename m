Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3636eO17976
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 23:06:40 -0400
Received: from sandesh.patni.com (sandesh.patni.com [208.250.32.13])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3636YTl010564
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 23:06:35 -0400
Received: from sensor.patni.com ([192.168.175.211])
	by sandesh.patni.com (8.12.11/8.12.11) with SMTP id j3634mti004746
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 23:04:55 -0400
Received: from onsitemail.patni.com ([192.168.175.202])
	by sensor.patni.com (SMSSMTP 4.0.0.59) with SMTP id
	M2005040522583120203
	for <linux-lvm@redhat.com>; Tue, 05 Apr 2005 22:58:31 -0400
Received: from onsitemail.patni.com (localhost [127.0.0.1])
	by onsitemail.patni.com (8.12.8/8.12.8) with ESMTP id j363LxaH023751
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 23:22:19 -0400
Message-ID: <34453.208.250.32.6.1112757699.squirrel@192.168.175.202>
In-Reply-To: <20050405195524.70A3A73829@hormel.redhat.com>
References: <20050405195524.70A3A73829@hormel.redhat.com>
Date: Tue, 5 Apr 2005 23:21:39 -0400 (EDT)
From: "Sandhya Suman" <sandhya.suman@patni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Relationship between Device Mapper and LVM2
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
To: linux-lvm@redhat.com

Hi vivek,

Regarding your query
>>When a user program issues a read command from a
>>file residing on a logical volume, how does the call actually gets
>>mapped onto the hard disk. We believe that the kernel passes the
>>"generic" command to the device mapper which then makes the final
>>translation on the basis of mapping tables stored with it. We just
>>wanted to be sure that LVM2 code does figure in the translation of the
>>read requests from the user applications to the disk.

The lv on which filesystem is created,when the user use this lv in
read/write,the lv is mapped to corresponding dm device.The dm device pass
the read/write request to underlying hard disk/SCSI device as the dm
device does not have its own proper request queue to fulfill read/write
request.
LVM is just a user interface in this case.Nothing to do with kernel.It
interacts with kernel using dm module.

Hope i answred your question.Let me know if it is not clear.

Regards
Sandhya
