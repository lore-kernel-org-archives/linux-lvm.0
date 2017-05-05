Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 283DB777C5
	for <linux-lvm@redhat.com>; Fri,  5 May 2017 13:09:45 +0000 (UTC)
Received: from mail1.bemta6.messagelabs.com (mail1.bemta6.messagelabs.com
	[193.109.254.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 762B34E4D1
	for <linux-lvm@redhat.com>; Fri,  5 May 2017 13:09:36 +0000 (UTC)
Received: from mail.lmax.com (co1mail01.yb.lmax [10.81.16.37])
	by mail.lmax.com (Postfix) with ESMTP id B20C275800CD
	for <linux-lvm@redhat.com>; Fri,  5 May 2017 13:09:34 +0000 (UTC)
Date: Fri, 5 May 2017 13:09:34 +0000 (UTC)
From: Luke Bigum <luke.bigum@lmax.com>
Message-ID: <1972636064.11472431.1493989774603.JavaMail.zimbra@lmax.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvconvert --merge invalidating snapshot
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

Hello,

We're running in to an issue with merging snapshots and need some direction on how to debug further.  We have some jobs in Jenkins that are repeatedly creating and merging snapshots.  After several consecutive runs they fail inside the lvconvert command.  Sometimes this is 3 runs, sometimes it's hundreds, but eventually it will fail.  This is on CentOS 6.8 with lvm2-2.02.143-7.el6.x86_64, but I can reproduce the same problem when upgrading to lvm2-2.02.143-12.el6.x86_64 from 6.9. The error is:

  journal: Merging snapshot invalidated. Aborting merge.

Which is thrown by lvconvert during it's progress polling code when it gets back -1 (DM_PERCENT_INVALID) as the merge percentage.  The snapshot is healthy before merging, there are very few (if any) block changes in the LV when our Jenkins jobs are running, and the snapshot and source volume are quite small (few hundred MiB).  I've managed to reproduce the issue outside of the Jenkins tests with this Bash loop. It generally takes 15-30 minutes of running this to fail:


while [[ 1 ]]; do
  date
  /sbin/lvremove -f vg_os/journal_reserved_snap
  /sbin/lvcreate -s -n journal_snap -L 160.00m vg_os/journal
  /bin/umount /mnt
  /sbin/lvconvert --merge -i 5 vg_os/journal_snap
  /bin/mount /mnt
  /sbin/lvcreate -L 160.00m -n vg_os/journal_reserved_snap
  echo
done


When the merge fails, the snapshot is left in the merging state but invalid, and oddly 100% full:


# lvs --all
...
  [journal_snap]        vg_os Swi-I-s--- 160.00m      journal 100.00                                 


Device-Mapper says this about the merge:

May  5 10:45:55 lddev-build-scotty04 kernel: device-mapper: snapshots: Cancelling snapshot handover.
May  5 10:45:55 lddev-build-scotty04 kernel: device-mapper: snapshots: Snapshot is invalid: can't merge


And the *-cow and *-real DMs still exist:

# dmsetup ls | grep journal
vg_os-journal	(253:3)
vg_os-journal_snap	(253:6)
vg_os-journal_snap-cow	(253:5)
vg_os-journal-real	(253:4)


I can clean up the snapshot with 'lvremove' and start the process all over again.  I can also reproduce the problem on bare metal hardware and in a KVM instance (not that it should make a difference).

I'm at a bit of a loss on how to debug this any further.  I've done a little bit of experimenting with rolling back metadata changes to before the merge, but I don't really know what I'm looking for, and I generally always end up locking up Device-Mapper in some way and having to reboot :-)

Can anyone suggest a way forward here?

As an aside, while ruling out possible causes I tried the same Bash loop on a CentOS 6.8 machine with a non-standard kernel by accident. The result is different; it never fails to merge, but the LVM operations start really fast and get slower and slower overnight. When it would take less than a second to complete a loop first it was taking 30+ seconds in the end, and giving an interesting message about reserved memory. A resource leak?  I mention it just in case it's sheds light on the first problem, I don't really expect you to help me when using our custom kernel :-)

  Internal error: Reserved memory (15560704) not enough: used 25010176. Increase activation/reserved_memory?
  Logical volume "journal_reserved_snap" successfully removed

Thanks,

-- 
Luke Bigum
Lead Engineer

Information Systems
---

LMAX Exchange, Yellow Building, 1A Nicholas Road, London W11 4AN
http://www.LMAX.com/

Recognised by the most prestigious technology and business awards
 
Financial technology awards
2017 Best FX trading venue, Fund Technology & WSL Awards
2016 Best trading & execution venue, HFM US Technology Awards

FX industry awards
2016, 2015, 2014, 2013 Winner, Profit & Loss Readers' Choice Awards
2016, 2015, 2014, 2013 Winner, WSL Institutional Trading Awards

Business growth awards
2016, 2015 Winner, Deloitte UK Technology Fast 50
2015, 2014, 2013, Winner, The Sunday Times Tech Track 100
2016, 2015 Winner, Deloitte EMEA Technology Fast 500
2015 Winner, Tech City UK Future 50

---

FX and CFDs are leveraged products that can result in losses exceeding your deposit. They are not suitable for everyone so please ensure you fully understand the risks involved.

This message and its attachments are confidential, may not be disclosed or used by any person other than the addressee and are intended only for the named recipient(s). This message is not intended for any recipient(s) who based on their nationality, place of business, domicile or for any other reason, is/are subject to local laws or regulations which prohibit the provision of such products and services. This message is subject to the following terms (http://lmax.com/pdf/general-disclaimers.pdf), if you cannot access these, please notify us by replying to this email and we will send you the terms. If you are not the intended recipient, please notify the sender immediately and delete any copies of this message.

LMAX Exchange is the trading name of LMAX Limited. LMAX Limited operates a multilateral trading facility. LMAX Limited is authorised and regulated by the Financial Conduct Authority (firm registration number 509778) and is a company registered in England and Wales (number 6505809).

LMAX Hong Kong Limited is a wholly-owned subsidiary of LMAX Limited. LMAX Hong Kong is licensed by the Securities and Futures Commission in Hong Kong to conduct Type 3 (leveraged foreign exchange trading) regulated activity with CE Number BDV088.
