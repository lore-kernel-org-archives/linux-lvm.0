Return-Path: <lembark@wrkhors.com>
Message-ID: <3A86EBFD.1401E7A8@wrkhors.com>
Date: Sun, 11 Feb 2001 13:46:05 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] (no subject)
References: <20010211191615.6223.qmail@web216.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 
> Is there a utility to convert an existing ext2fs to a
> lvm or do I have to due a complete new install???

if you aren't re-using the same acerage, just create the
new LVM and cpio -p the data from old to new.  if you want
to re-use the disk space then you'll have to back it up,
make the LVM's and restore the contents.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
