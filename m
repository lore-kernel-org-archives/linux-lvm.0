From: Chris Jantzen <chris@maybe.net>
Message-ID: <20020907221823.GL22569@maybe.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] md + lvm + reiser
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
Date: Sat Sep  7 17:18:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Excuse me if this has been covered already, though I did try to read
through the archives. I am running md raid5 (software) over several
drives and importing that into LVM and using reiserfs. It's worked fine
for some time, but now I want to start snapshots. I've learned about the
VFS lock patch, yes, but my real question is: why is the raid5 buffer
cache constantly thrashing back and forth? I assume this has to do with
a conflict between reiserfs's 4096 byte blocks and LVM's 512
SECTOR_SIZE. Or did I configure something wrong somewhere? Is it safe to
just change SECTOR_SIZE in lvm.h or will that mess up on-disk
structures? Thank you.

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
