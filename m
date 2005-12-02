Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB2LlIV21316
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 16:47:18 -0500
Received: from mail1.pillardata.com (mail1.pillardata.com [63.251.178.136])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB2LlAEM010881
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 16:47:11 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Need to keep running fsck on LVM
Date: Fri, 2 Dec 2005 13:47:05 -0800
Message-ID: <35D744B011AD9A4A86B5962E85181C78027AB6E9@caex02.trans.corp>
From: "Brian Wong" <bwong@pillardata.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>



> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Terry Rigby
> Sent: Friday, December 02, 2005 9:25 AM
> To: linux-lvm@redhat.com
> Subject: Re: [linux-lvm] Need to keep running fsck on LVM
> 
> On December 2, 2005 09:12 am, Erik Ohrnberger wrote:
> > grep /dev/hd /var/log/messages /var/log/syslog | more
> 
> Nope, that outputs nothing at all.
> 
> I do however see the following in /vavr/log/messages over and over and
> over
> again...
> 
> Dec  1 23:12:46 localhost kernel: attempt to access beyond end of
device
> Dec  1 23:12:46 localhost kernel: dm-0: rw=0, want=6444890144,
> limit=905314304

That complaint is from ll_rw_blk.c.  There is probably an application
corrupting your filesystem, or a filesystem bug.
> 
> Gumby
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
