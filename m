Date: Tue, 18 Sep 2001 05:09:36 -0400 (EDT)
From: "G'abor Luk'acs" <lukacs@mathstat.yorku.ca>
Message-ID: <Pine.A41.4.31.0109180504240.109452-100000@pascal.math.yorku.ca>
MIME-Version: 1.0
Subject: [linux-lvm] lvreduce
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
To: Linux-LVM@Sistina.com

Hi,


I am in the process of installin Linux 8.0, and I have downloaded and
compiled lvm version 1.0, I patched the kernel, compiled it, etc. So
everything semes to work, except for one thing: lvreduce somehow damages
the whole volume group in a way that it becomes inconsistent.

Everything else seems to work fine, so I really cannot understand why it
is happening. The whole message of lvreduce seems to be strange a bit:

when I am redicing an LV when it is enabled then it askes for
confirmation, but when I disabled it just to see what happens, it wrote me
that since it is not active I cannot reduce it.

I am completely aware to the fact that first I have to resize the FS
inside, but it is not the question, as resize2fs seems to work pefectly
well.

Somehow my feeling is that something is wroking with the consistency
checking mechanism.

I would really apprecaite if you could advise me about it.


I am looking forward to hearing from you.


Thanks in advance,

Gabor Lukacs
