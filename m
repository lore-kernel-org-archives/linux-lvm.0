Message-ID: <3B9BD5BD.6060606@ida.xs4all.nl>
Date: Sun, 09 Sep 2001 22:49:01 +0200
From: Jorg de Jong <lists@ida.xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvcreate contiguous flag question
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

I created a lv with the option --contiguous y.
But since my disks are rather full the created lv was NOT contiguous.

Strange.

If I try to change the allocation policy from contiguous to next free and to
contiugues again for this lv, it will fail. It will only let me set it to
next free. This makes sence since the lv is already fragmented.

But why is a newly created lv that has a allocation policy contiguous
but is fragmented non the less not reset to next free ? Or not created at all ?

regards,

Jorg de Jong.
