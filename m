Date: Wed, 5 Sep 2001 12:29:50 -0500 (CDT)
From: Xiaoxiang Liu <xiliu@ncsa.uiuc.edu>
In-Reply-To: <E15eZdD-0008IY-00@hermes.sistina.com>
Message-ID: <Pine.SOL.3.95.1010905110932.12169A-100000@pecos.ncsa.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Parallel IO on striped logic volume?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Xiaoxiang Liu <xiliu@ncsa.uiuc.edu>

I have a performance problem about parallel IO on striped logic volume.

I build a striped LV on 4 scsi disks. If I do sequential IO on one disk
with buffer size 4k, the bandwidth is 9MB/s. Then I do sequential IO on
LV with buffer size 16k. Theoretically I can get almost 4*9=36MB/s because
LVM stripe 4k IO on every disk but I only get 18MB/s. I don't know where
I lost so much performance or it is the overhead of LVM? I do believe LVM 
do parallel IO because if I increase buffer size to 1024k, I can get 
51MB/s which is close to 4*14 MB/s and 14MB/s is the maximum
bandwidth of a single disk.

My question is why I can't see nearly linear scaling of the bandwidth 
when the buffer size is small? Does striping LVM do real parallel IO
similar to software RAID0?
 

--xiaoxiang
