From: Ralf Eisinger <rei@ihs.uni-stuttgart.de>
Message-ID: <Pine.LNX.4.44.0207121606590.15532-100000@poseidon.ihs.uni-stuttgart.de>
MIME-Version: 1.0
Subject: [linux-lvm] RAID extension and lvm
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
Date: Fri Jul 12 09:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

during the next days we will get a new RAID-System.
We have planned to use it as one bis raid5-"disk". Its possible, to
increase the disk space by plugging in (a) new disk(s).
We want to use lvm too, because its possibility of making a snapshot.
I have two questions to that:
- when I "start" a snaptshot, where is lvm using the disk space, which is
  needed to track down the changes user will made during that time?
- Can lvm handle the changing of a disk size? (In our case, lvm will not
  recognize, that a disk is added, because the RAID-System offers the
  complete disk space as one big disk, so it seems (from the sight of
  lvm), that the disk size increases)

Is there anywhere a searchable version of the mailing list archive?

best regards

Ralf Eisinger
-------------------
IHS - University of Stuttgart, Germany
Pfaffenwaldring 10
70150 Stuttgart
Phone: (0049)-711-685-3201
