Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.1 available at www.sistina.com
References: <20011126203223.A81635@antimony.sistina.com>
	<20011127170945.B7161@d3.front>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Ralph Jennings's message of "Tue, 27 Nov 2001 17:09:45 -0800"
Message-ID: <ufaofln4q2k.fsf@epithumia.math.uh.edu>
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
Date: Tue Nov 27 19:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "RJ" == Ralph Jennings <ralph@oro.net> writes:

>> o support for non-partitioned MDs

RJ> What does this mean?  Skipping the lilo used portion?

Well, you create an MD device and run pvcreate on it directly instead
of partitioning it and running pvcreate on the partition(s).

So you get something like:

XYX:nas00:~> cat /proc/lvm/VGs/nas/PVs/md5
name:         /dev/md5
size:         833674752
status:       1
number:       1
allocatable:  2
LV current:   2
PE size:      8192
PE total:     50882
PE allocated: 5760
device:       09:05
uuid:         ARVg-SWBN-tvwA-Go2T-BuM9-6ntF-LUqu-nQXY

I didn't have any problems doing this with 1.0.1rc4.

 - J<
