From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 5 Oct 2001 11:54:32 -0600
Subject: Re: [linux-lvm] Clarification
Message-ID: <20011005115432.C315@turbolinux.com>
References: <00ba01c14d93$70ec7340$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00ba01c14d93$70ec7340$836788cf@industry>
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
Content-Transfer-Encoding: 7bit
To: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Cc: linux-lvm@sistina.com

On Oct 05, 2001  07:46 -0400, Jason A. Lixfeld wrote:
> I'm just looking for clarification:
> 
> ext2resize will actually resize ext3 aswell?  With no extra flags?  It
> will just know that the LVM is ext3 and not ext2?

If it is unmounted, it will work fine.  There is no difference between
ext2 and ext3 for a (cleanly) unmounted filesystem (the journal is just
a regular file).  If you try to resize a filesystem that has a dirty
journal (e.g. after a crash) it will refuse to do so and you need to
run e2fsck.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
