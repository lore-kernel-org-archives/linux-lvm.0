Message-Id: <A56A8E5E02CBD511881800306E002CCA04F002@mrspdc.mrs.com.cn>
From: =?gb2312?B?Y2FybC5odWFuZyBb/FO9qORoXQ==?= <carl.huang@mic.com.tw>
MIME-Version: 1.0
Subject: [linux-lvm] disk failed
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
Date: Tue Feb  5 03:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

hello,

I'm new to lvm and sorry for my english.

I have a question: if I create a lv on vg that consists of
/dev/hdb,/dev/hdc,/dev/hdd. Now if disk /dev/hdb fails,will all the data on
the lv be lost?  I make an experiment: if /dev/hdc or /dev/hdd fails, the
data will only
lose on the failed disk, but if /dev/hdb fails ,the lv will not work. I
think the reason is the filesystem(ext2) metadata is stored on the first
disk. If filesystem is reiserfs, the lv will also not work more no matter
what disk fails.

So it's really a risk to use multiple disks together? 
How to avoid it or I make a mistake?

Thanks for any suggestion.

Carl.
