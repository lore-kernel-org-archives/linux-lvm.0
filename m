From: Kirk Reiser <kirk@braille.uwo.ca>
Message-Id: <E17ZvV3-00005K-00@speech.braille.uwo.ca>
Subject: [linux-lvm] retro fit lvm?
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
Date: Wed Jul 31 10:34:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Folks:  It seems to me this should be a FAQ but I couldn't find any
reference to it in any of the how-to's.

Is it possible to retrofit lvm onto an already existing file system?

The reason I am asking is I already have an ext3 set of disks and
partitions quite full of valuable data.  I would like to change those
partitions over to lvm because it would solve one problem in
particular I am having which is a partition with many entries which
can not easily be split into separate partitions.  My data is
currently about 280gb and I don't have the room to off load recreate
the partitions with lvm and then reload the data.  So I was wondering
if I could retrofit lvm onto the already formatted and filled
partitions.

Any suggestions and pointers would certainly be appreciated.

  Kirk
