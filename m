Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9HNqcv7022348
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 19:52:38 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9HNqVG9006040
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 19:52:32 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1IiIgg-0001aO-DM
	for linux-lvm@redhat.com; Wed, 17 Oct 2007 23:52:30 +0000
Received: from brian.lafayette.switchmanagement.com ([198.144.213.21])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 23:52:30 +0000
Received: from bstrand by brian.lafayette.switchmanagement.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 23:52:30 +0000
From: Brian Strand <bstrand@switchmanagement.com>
Date: Wed, 17 Oct 2007 23:52:22 +0000
Message-ID: <ff677n$a64$1@ger.gmane.org>
References: <ff3hde$7rt$2@ger.gmane.org>
	<20071017012858.GW10006@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20071017012858.GW10006@agk.fab.redhat.com>
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: pvmove obliterates filesystem (Opensuse 10.2,
	x86-64)
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

Alasdair G Kergon wrote:
> On Tue, Oct 16, 2007 at 11:27:42PM +0000, Brian Strand wrote:
>> 2462 dual-port FC HBA, using qla2400 (no dm-multipath).  Note:  I had
>> just completed a successful pvmove of another lv about 30 minutes prior
>> to this incident.
>  
>>   LVM version:     2.02.13 (2006-10-27)
>>   Library version: 1.02.12 (2006-10-13)
>>   Driver version:  4.7.0
>> Linux somebox 2.6.18.2-34-default #1 SMP Mon Nov 27 11:46:27 UTC 2006
>> x86_64 x86_64 x86_64 GNU/Linux
>  
> (need to check those versions are all compatible and kernel isn't missing
> relevant patches)

Is this information available somewhere I can check?


>>     Creating switch-pvmove0
>>   device-mapper: create ioctl failed: Device or resource busy
> 
> That should *not* happen.
> Are you sure the preceding pvmove completed correctly?

For the preceding pvmove, the log file showed no errors and there was
nothing from device-mapper in the logs.  "lvs -o +devices" showed the
expected result (the lv was now on the desired pv, and was not there
prior to the pvmove).  Also the successfully pvmoved lv contains some of
Oracle's system datafiles as well as binaries, so Oracle would have
imploded rapidly if something went wrong.


> Is some version of udev enabled on dm devices that might be interfering?

This I don't know; we're just running the stock out-of-the-box udev.
Any pointers to how I can find this out would be appreciated.


>>   device-mapper: reload ioctl failed: Invalid argument
> 
>>     Creating volume group backup "/etc/lvm/backup/switch" (seqno 250).
> 
> Need to check through the sequence of backups to see all the metadata
> changes it actually made (probably need the ones in the on-disk metadata
> area rather than just the /etc/lvm/backup ones).

Would dd suffice to get the on-disk metadata area?  If so, what is (are)
the offset(s) to use?  Is it ok to post these as attachments to the
list, or is there some other preferred means?


>>   ABORTING: Segment progression failed.
> 
>>   /dev/sdc: Moved: 60.0%
> 
> Message could be incorrect, need to check.
> 
>> Oct  9 22:33:21 somebox kernel: device-mapper: table: 253:13: linear:
>> dm-linear: Device lookup failed
> 
> So it couldn't use that device (a common cause is a size error when wrong
> device is used e.g. with software raid or partially-cloned devices).
> 
> Alasdair

If it helps any, 253:13 is the major:minor of the lv which got destroyed
during the pvmove.  It is still present in /dev/mapper, as I left the lv
alone (after fsck).  Please let me know if I should attach (or otherwise
send) any files.

Thanks,
Brian
