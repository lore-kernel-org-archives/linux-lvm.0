Message-ID: <51DBC6D5.4060303@redhat.com>
Date: Tue, 09 Jul 2013 10:16:21 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAAksFbsN743ZFD9TOSAT=p582Ki0Wr-Z++Hd0m8uyVou=Z=Hmw@mail.gmail.com>
In-Reply-To: <CAAksFbsN743ZFD9TOSAT=p582Ki0Wr-Z++Hd0m8uyVou=Z=Hmw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM failure after upgrade to Fedora 19
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
To: Jeffrey Forbes <piconewton@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 07/09/2013 05:07 AM, Jeffrey Forbes wrote:
> I recently upgrade to Fedora 19 from 17. Fedup did not work correctly,
> so I did a clean install on the system disk.
> However, I have a data disk that is raid-1 and has a volume group and
> logical volumes that were create under Fedora 17
> and was not giving any errors. Now with Fedora 19 on mounting the
> logical volume, the following errors are reported:
> 
> [  130.432660] Buffer I/O error on device dm-1, logical block 119570432
> [  130.432664] lost page write due to I/O error on dm-1
> [  130.432674] JBD2: Error -5 detected when updating journal superblock
> for dm-1-8.
> [  130.432701] Aborting journal on device dm-1-8.
> [  130.432705] Buffer I/O error on device dm-1, logical block 119570432
> [  130.432706] lost page write due to I/O error on dm-1
> [  130.432708] JBD2: Error -5 detected when updating journal superblock
> for dm-1-8.
> [  218.261625] EXT4-fs (dm-1): previous I/O error to superblock detected
> [  218.261640] Buffer I/O error on device dm-1, logical block 0
> [  218.261642] lost page write due to I/O error on dm-1
> [  218.261644] EXT4-fs error (device dm-1): __ext4_journal_start_sb:60:
> Detected aborted journal
> [  218.261647] EXT4-fs (dm-1): Remounting filesystem read-only
> [  218.261649] EXT4-fs (dm-1): previous I/O error to superblock detected
> [  218.261653] Buffer I/O error on device dm-1, logical block 0
> [  218.261654] lost page write due to I/O error on dm-1
> 

What's the exact device layout after boot? (I assume that if it's only a
data disk, you're still able to boot into your system...) Please, try to
post the output of "lsblk" and then probably the whole "lvmdump" would help.

Please, open a new bug report for this  problem so you can attach the
output needed:
https://bugzilla.redhat.com/enter_bug.cgi?product=Fedora&component=lvm2&version=19.

Thanks.

Peter
