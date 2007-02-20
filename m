Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KD5AOY005707
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 08:05:10 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KD58mI008600
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 08:05:08 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1HJUg2-0003Wh-3G
	for linux-lvm@redhat.com; Tue, 20 Feb 2007 14:05:02 +0100
Received: from 202.3.112.4 ([202.3.112.4])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 14:05:02 +0100
Received: from rrs by 202.3.112.4 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 14:05:02 +0100
From: Ritesh Raj Sarraf <rrs@researchut.com>
Date: Tue, 20 Feb 2007 18:00:25 +0530
Message-ID: <186ra4-8hp.ln1@www.researchut.com>
References: <3nmja4-jtv.ln1@www.researchut.com>
	<20070220061150.GA3215@percy.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: LVM + Multipathing
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

Luca Berra wrote:

> On Sat, Feb 17, 2007 at 09:52:27PM +0530, Ritesh Raj Sarraf wrote:
>>Hi,
>>
>>I have a question regarding the combination of LVM + Multipathing in a SAN
>>environment.
>>
>>I have a LUN mapped to a host using iSCSI. I have two two paths to the LUN.
>>This setup, using multipathing, provides me failover functionality.
>>
>>My question is how does LVM react to path failures ?
>>In a failover environment, multipathing can take upto 120 seconds to detect
>>that the active path to the LUN is no more available and then switch to the
>>secondary path. During this 120 seconds, how does LVM react ? Does it really
>>sense that the device is offlined ? Or that information is never passed to LVM
>>and it just allows I/O to happen leaving that responsibility to the
>>multipathing layer ?
> 
> i believe LVM does not react at all.
> 

I brought this question because I'm seeing Filesystem READONLY issues when doing
a takeover/giveback.

My understanding is that a filesystem usually goes read-only, only when it
senses errors in the drive. Now I believe LVM might the culprit because beneath
the filesystem and above the block device, LVM is the only layer.

Thanks,
Ritesh
-- 
Ritesh Raj Sarraf
RESEARCHUT - http://www.researchut.com
"Necessity is the mother of invention."
"Stealing logic from one person is plagiarism, stealing from many is research."
"The great are those who achieve the impossible, the petty are those who
cannot - rrs"
