Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kADDlvmV020930
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 08:47:57 -0500
Received: from web51102.mail.yahoo.com (web51102.mail.yahoo.com
	[206.190.38.144])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kADDl7t6007346
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 08:47:21 -0500
Date: Mon, 13 Nov 2006 05:47:01 -0800 (PST)
From: Dave <davo_muc@yahoo.com>
Subject: Re: [linux-lvm] pvmove of lvs while filesystems mounted not
	supported?!?
In-Reply-To: <44E2327A.7020907@davidb.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <902218.58339.qm@web51102.mail.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, ed@quillen.net, lvm@davidb.org

Hi David & list readers,

I am still stuck using LVM1 (1.0.8-14) on a RedHat AS3 system (kernel:
2.4.21-47.ELsmp) and may need to move all data from the existing disks to a new set
of disks.

Can I safely use pvmove (under LVM1) to perform this action while the file systems
are mounted or not?  If not, are there other ways LVM can help move all data to the
new disks without having to unmount the file systems in use?  

Thanks,
Dave

--- David Brown <lvm@davidb.org> wrote:

> Edward Quillen wrote:
> > Redhat support is telling me (see quote below) that pvmove is not supported when
> there are mounted
> > filesystems on top of the lvs that are being moved. Can this be true? Everyother
> lvm that I have
> > worked with allows this. I am currently experiencing device mapper hangs when I
> run pvmove while
> > there are filesystems mounted even if there is no processes using the
> filesystems. 
> > Is this supposed to work? If so, has anyone had similar issues? Any help would
> be appreciated? 
> 
> Requiring an unmount of the filesystem would kind of defeat the purpose 
> of pvmove.  In that case, just create a new volume and dd the data across.
> 
> pvmove creates a mirror for each segment it is moving.  That way updates 
> will be written to both segments while the mirror is active.
> 
> I've done it numerous times, including moving very active filesystems 
> off of a flaky drive so that I could replace it.
> 
> Dave Brown
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 



 
____________________________________________________________________________________
Want to start your own business?
Learn how on Yahoo! Small Business.
http://smallbusiness.yahoo.com/r-index
