From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] quota on LVM
Message-ID: <20011112115915.T1778@lynx.no>
References: <20011112183033.11789.qmail@web14604.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011112183033.11789.qmail@web14604.mail.yahoo.com>; from berthierp@yahoo.com on Mon, Nov 12, 2001 at 10:30:33AM -0800
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
Date: Mon Nov 12 12:58:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Berthier <berthierp@yahoo.com>
Cc: linux-lvm@sistina.com

On Nov 12, 2001  10:30 -0800, Pierre Berthier wrote:
> is it possible at all to use quota on LVM and how to do that? If you
> tell me it is possible in theory in the standard way, I'll explain
> you my config on which it doesn't work :-)

Unless I don't understand your question, quota is a filesystem issue, while
LVM is a block device (i.e. the two are not related).  Maybe you are using
reiserfs, which needs patches for quota to work?

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
