Message-ID: <20040116002908.11514.qmail@web41504.mail.yahoo.com>
From: Rajesh Saxena <rs_404@yahoo.ca>
Subject: Re: [linux-lvm] JFS or XFS
In-Reply-To: <20040115231819.49123.qmail@web41506.mail.yahoo.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan 15 19:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thank you all for the replies regarding ReiserFS....... I will have to
do more research into this matter because originally I did not consider
reiser for the server. It is always good to get other peoples opinions
on topics like this. I have one small request if you don't mind. The
mail server will run cyrus imapd and while reading the documentation I
saw the following note which is attached below after my email. The
author of this document also notes that XFS includes a program called
xfs_freeze which will freeze a filesystem from new changes so a more
reliable snapshot can be created. Again people here with more
experience with LVM and reiserfs might know of a better way to do the
snapshot for backups. Any opinions?
Thank you all for your insight. Please keep posting if you have
different opinionss.

Please scroll all the way to the bottom:
http://acs-wiki.andrew.cmu.edu/twiki/bin/view/Cyrus/Backup

One issue you may run into: if you're using ReiserFS, at least on Linux
2.4 with LVM1, then snapshots may occasionally fail. The snapshot will
be created fine, but the ReiserFS fileystem on it will not be mountable
if it has incomplete transactions. The ReiserFS code tries to replay
the transactions, fails because the snapshot is read-only, and fails to
mount the FS. I've found that syncing the disks before taking the
snapshot reduces the chances of this happening dramatically:

sync && sleep 1 && sync && sleep 1 && sync # try to make sure FS will
be clean
nice -n -19 lvcreate -s -L 1G -n var_s /dev/OS/var >&/dev/null || \
  ( echo "Error creating snapshot of /var: $?" && exit 1 )


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
