From: "tester7 A." <benew666@hotmail.com>
Mime-Version: 1.0
Message-ID: <Sea2-F42hvqgStMVhEU00001df3@hotmail.com>
Subject: [linux-lvm] Inactive snapshot?
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
Date: Tue Sep 16 00:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

A few questions and sugesstions regarding LVM2 snapshots.

1. Force active snapshot to be inactive and make it accessable.
It seems like inactive snapshot are not accesable at all. Inactive snapshots 
does not update the changes, but it holds the changes while it was active, 
so old data might be usefull.

Since, the LVM snapshots are not meant to stay long in the system and 
delegrate the performance dramatically(according to my own BMT), I would 
like to make the snapshot inactive at the some moment so that it does not 
affect the I/O performacne, and also I would like to access the old data.

3. LVM2 snapshots are async?

Thanks in advance.

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus
