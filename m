Message-ID: <3DC1EFFC.A0EEBAFD@be.mbn.or.jp>
From: Miwako Nakai <nickey@be.mbn.or.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cache buffer size
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
Date: Thu Oct 31 21:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm <linux-lvm@sistina.com>

I'm using jfs on lvm/raid5 with snapshot.

When I copy file, it happens frequently
'raid5: switching cache buffer size XXX -> XXX'.
This message appears to syslog. It caused speed down to access disks.
So, I cut this message. It's seemed ok.

But it's still going to switch cache buffer size. I think it cost
some cpu time. When switching buffer cache size, it always happen
reflushing memories.

I want to fix buffer size. What shall I do?
I asked JFS group. But they do nothing about cache buffer.

kernel 2.4.20-pre10-ac2
lvm    1.0.5
jfs    1.0.23

--
nakai@ezinc.com
